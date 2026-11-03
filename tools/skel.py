"""Generate the skeleton Pascal sources: every unit with real procedure frames and BASM `db` bodies.

src/<UNIT>.PAS for each game unit. Bodies are the original bytes; every far/near call, procedure address and segment
fixup is symbolic so TPC links the same procedures (smart linking) and writes the same relocations.
System RTL calls stay literal bytes (no BASM name for them) until the code is rewritten in Pascal.
"""
import json, re, struct, subprocess, os, sys, collections

U = {u['key']: u for u in json.load(open('out/units.json'))}
P = json.load(open('out/procs.json'))
UNITS = [k for k in U]  # paragraph order
SEG = {u['seg']: k for k, u in U.items()}
SEG[0x9E7] = '@Data'
TPL = ('Dos', 'Crt', 'Overlay', 'System')
TPLNAMES = {('Crt', 0x1C0): 'ClrScr', ('Crt', 0x29C): 'Delay', ('Crt', 0x2FB): 'KeyPressed', ('Crt', 0x30D): 'ReadKey',
            ('Dos', 0x0B): 'Intr', ('Dos', 0xA2): 'GetTime', ('Dos', 0xDE): 'DiskFree', ('Dos', 0x112): 'FindFirst',
            ('Dos', 0x150): 'FindNext', ('Dos', 0x18D): 'FExpand', ('Dos', 0x256): 'FSplit',
            ('Crt', 0x2C7): 'Sound', ('Crt', 0x2F4): 'NoSound',
            ('Overlay', 0x12): 'OvrInit', ('Overlay', 0x1A3): 'OvrSetBuf', ('Overlay', 0x1F2): 'OvrGetBuf'}
RESERVED = set('''and array asm begin case const constructor destructor div do downto else end file for function goto if
implementation in inherited inline interface label mod nil not object of or packed procedure program record repeat set
shl shr string then to type unit until uses var while with xor absolute assembler external far forward interrupt near
private virtual exit halt'''.split())

# ---- names
ida = {}
for l in open('names.tsv'):
    k, off, kind, n = l.rstrip('\n').split('\t')
    if kind == 'proc': ida[(k, int(off, 16))] = n
used = collections.Counter()
NAME = {}
for k, v in P.items():
    for p in v['procs']:
        n = ida.get((k, p['entry']))
        if n and re.match(r'^[A-Za-z_]\w*$', n) and not n.lower().startswith(('sub_', 'j_')) and n.lower() not in RESERVED:
            n = n[:40]
        else:
            n = None
        NAME[(k, p['entry'])] = n
for (k, e), n in NAME.items():
    if n: used[n.lower()] += 1
for (k, e), n in list(NAME.items()):
    if not n or used[n.lower()] > 1:
        NAME[(k, e)] = ('%s_%s_%04X' % (n, k, e)) if n else 'p%s_%04X' % (k, e)
    if U[k].get('init') == e and k != 'M':
        NAME[(k, e)] = None  # unit initialization block

DEAD_EXTRA = {}
OPLUS = {'R182', 'R47F'}
DMINUS = {'O075'}   # D- frees local symbols ("Too many symbols"); costs the map line numbers used to locate mismatches
OPLUS_PROCS = set()   # (key, entry) of procedures compiled {$O+} inside $O- units (set by tools/lift/prog.py)   # resident units compiled overlay-safe ($O+: literal arguments copied to stack temps)
EXTRA_USES = {}
MAIN_SWAP = [('O06E', 'O075')]   # pairs listed in swapped order in the main program's uses clause

EXT_TAIL = set()   # (key, offset) of tail entries called from other units: declared in the interface
TAIL = {}   # key -> {offset: (name, far)}
STRFUNC = set()
STRRES = {}       # (key, entry) -> n: string function returning string[n] (n < 255)   # (key, entry) of string functions (result pointer left on the caller's stack)
SIGS = {}         # (key, entry) -> [Pascal parameter types]   (set by tools/lift/build.py)
LIFTED = {}       # (key, entry) -> {'decl': [...], 'body': [...]}
LIFT_DECLS = {}   # key -> unit-level declarations (types, absolute aliases)

def params_ok(p, pt, nested=False):
    """A skeleton procedure may take refined parameter types when the stack layout is unchanged."""
    sz = sum(6 if t == 'real' else 4 if (t in ('pointer', 'longint', 'string') or re.match(r'[SB]\d+$', t)) else 2 for t in pt)
    return sz == p['retn'] - (2 if nested else 0)
DSREF = {}  # main program: one symbolic reference each to DSCONST / DSVAR keeps them linked
def tail_params(key, t):
    """Parameter list of an asm tail entry, once the lifter has typed it (SIGS); none before."""
    ts = SIGS.get((key, t))
    if not ts or not ts[0]: return ''
    g = []     # a0, a1: word; a2: pointer (TPC lines are limited to 127 characters)
    for i, x in enumerate(ts[0]):
        if g and g[-1][1] == x: g[-1][0].append('a%d' % i)
        else: g.append((['a%d' % i], x))
    return '(' + '; '.join('%s: %s' % (','.join(n), x) for n, x in g) + ')'

def tail_labels(key):
    """Entry points into a unit's {$L} asm tail referenced from its Pascal part."""
    if key in TAIL: return TAIL[key]
    v = P[key]; lab = {}
    if v.get('obj'):
        a, b = v['obj']
        code = open('out/u/%s.bin' % key, 'rb').read()
        for p in v['procs']:
            for off, ln, txt in disasm(code, p['body'][0], p['body'][1]):
                if code[off] == 0xe8 and ln == 3:
                    t = (off + 3 + struct.unpack('<h', code[off+1:off+3])[0]) & 0xFFFF
                    if a <= t < b: lab[t] = ('X%s_%04X' % (key, t), code[off-1] == 0x0e)
                if code[off] == 0xb8 and ln == 3:
                    t = struct.unpack('<H', code[off+1:off+3])[0]
                    if a <= t < b and code[off+3] == 0xba: lab[t] = ('X%s_%04X' % (key, t), True)
        for k2, u2 in U.items():      # far calls / addresses from other units
            if k2 in TPL: continue
            c2 = open('out/u/%s.bin' % k2, 'rb').read()
            for f, sg in u2['fixups']:
                t = struct.unpack('<H', c2[f-2:f])[0]
                if sg == U[key]['seg'] and a <= t < b and f >= 3 and k2 != key:
                    lab.setdefault(t, ('X%s_%04X' % (key, t), True)); EXT_TAIL.add((key, t))
    TAIL[key] = lab
    return lab

def target(seg, ofs):
    """Name of the symbol at seg:ofs (far call / address target)."""
    k = SEG.get(seg)
    if k is None: raise KeyError('seg %X' % seg)
    if k in ('Crt', 'Dos', 'Overlay'): return TPLNAMES[(k, ofs)]
    if k == 'System' or k == '@Data': return None
    if 'entries' in U[k]:
        idx = (ofs - 0x20) // 5
        assert (ofs - 0x20) % 5 == 0, (k, hex(ofs))
        ofs = U[k]['entries'][idx]
    n = NAME.get((k, ofs))
    if n is None and ofs in tail_labels(k): n = tail_labels(k)[ofs][0]
    if n is None: raise KeyError('%s:%04X' % (k, ofs))
    return n

def anyname(seg):
    k = SEG[seg]
    if k == '@Data': return '@Data'
    for (kk, e), n in NAME.items():
        if kk == k and n: return n
    raise KeyError(k)

def disasm(code, start, end):
    """[(offset, length, text)] for code[start:end]."""
    r = subprocess.run(['ndisasm', '-b16', '-o', str(start), '-'], input=code[start:end], capture_output=True, check=True)
    out = []
    for l in r.stdout.decode().splitlines():
        m = re.match(r'^([0-9A-F]{8})  ([0-9A-F]+)\s+(.*)$', l)
        if m: out.append((int(m.group(1), 16), len(m.group(2)) // 2, m.group(3)))
        else: pass  # continuation lines of long instructions
    return out

def lits(code, a, e):
    """Split a literal pool into strings / 32-byte sets: fewest items, empty strings and duplicates penalised.
    Offsets the code loads with `mov di,X; push cs` (TP's literal reference) must start an item."""
    INF = 10**9
    refs = {struct.unpack('<H', code[m.start()+1:m.start()+3])[0] for m in re.finditer(rb'\xbf..\x0e', code, re.S)}
    best = {e: (0, [])}
    for i in range(e - 1, a - 1, -1):
        cands = []
        n = code[i]
        if i + 1 + n <= e and (i + 1 + n) in best:
            c, rest = best[i + 1 + n]
            it = ('s', code[i+1:i+1+n])
            np = sum(1 for ch in it[1] if not 32 <= ch < 127)
            cands.append((c + 1 + 3 * np + (5 if n == 0 else 0) + (50 if it in rest else 0), [it] + rest))
        if i + 32 <= e and (i + 32) in best:
            c, rest = best[i + 32]
            it = ('set', code[i:i+32])
            cands.append((c + 2 + (50 if it in rest else 0), [it] + rest))
        # an item may not swallow a referenced offset
        ok = []
        for c, items in cands:
            ln = 1 + len(items[0][1]) if items[0][0] == 's' else 32
            ok.append((c + 20 * sum(1 for r in refs if i < r < i + ln), items))
        if ok: best[i] = min(ok, key=lambda x: x[0])
    if a not in best: raise ValueError('pool %x-%x' % (a, e))
    items = best[a][1]
    if len(set(items)) != len(items): print('WARNING duplicate literal in pool %x-%x' % (a, e), file=sys.stderr)
    return items

def pstr(b):
    """Pascal literal for bytes (quoted runs + #nn)."""
    if not b: return "''"
    parts = []; cur = ''
    for c in b:
        if 32 <= c < 127:
            cur += "''" if c == 39 else chr(c)
        else:
            if cur: parts.append("'" + cur + "'"); cur = ''
            parts.append('#%d' % c)
    if cur: parts.append("'" + cur + "'")
    s = ''.join(parts)
    return s

def init_temps(p):
    """A unit init block has no var section: dead string temps (FS = 256 bytes, TMPk = k+1) reserve its frame."""
    n = p.get('locals', 0); st = []
    if n == 262: return ["if F2(FS, '*.exe') then;"]    # R182: a 256-byte result + a StrLoad copy of a pool literal ($O+)
    # temps are freed after each statement: one expression holds them all
    fs = ['FS'] * (n // 256) + (['TMP%d' % (n % 256 - 1)] if n % 256 else [])
    if len(fs) == 1: st.append('if LV = %s then;' % fs[0])
    elif len(fs) == 2: st.append('if (LV = %s) and (LV = %s) then;' % tuple(fs))
    elif fs: raise ValueError('init temps %d' % n)
    return st

def setlit(b):
    els = [i for i in range(256) if b[i >> 3] >> (i & 7) & 1]
    rng = []; i = 0
    while i < len(els):
        j = i
        while j + 1 < len(els) and els[j+1] == els[j] + 1: j += 1
        rng.append(str(els[i]) if i == j else '%d..%d' % (els[i], els[j])); i = j + 1
    return '[' + ', '.join(rng) + ']'

def wrap(items, indent, maxlen=120, cont=None):
    """Join items with ', ' into lines <= maxlen; continuation lines start with cont (default: spaces)."""
    cont = cont if cont is not None else ' ' * len(indent)
    lines = []; cur = indent; first = True
    for it in items:
        add = it if first else ', ' + it
        if len(cur) + len(add) > maxlen and not first:
            lines.append(cur + ','); cur = cont + it
        else:
            cur += add
        first = False
    lines.append(cur)
    return lines

def body_asm(key, code, a, b, fixups, nears):
    """BASM lines for code[a:b]."""
    out = []; pend = []
    def flush():
        while pend:
            chunk = pend[:28]; del pend[:28]
            out.append('  db ' + ','.join(str(x) for x in chunk))
    fixset = {f: s for f, s in fixups}
    ins = disasm(code, a, b)
    i = 0
    while i < len(ins):
        off, ln, txt = ins[i]
        raw = code[off:off+ln]
        fx = [f for f in fixset if off <= f < off + ln]
        stmt = None
        if raw[0] == 0x9a and fx == [off + 3]:
            seg = fixset[off + 3]; ofs = struct.unpack('<H', raw[1:3])[0]
            t = target(seg, ofs)
            if t: stmt = 'call ' + t
        elif fx:
            assert len(fx) == 1, (key, hex(off), txt)
            f = fx[0]; seg = fixset[f]
            if SEG.get(seg) == 'System': stmt = None
            elif raw[0] == 0xba and ln == 3 and i > 0 and code[ins[i-1][0]] == 0xb8 and ins[i-1][1] == 3:
                # mov ax, offset X; mov dx, seg X  (address of a procedure)
                t = target(seg, struct.unpack('<H', code[ins[i-1][0]+1:ins[i-1][0]+3])[0]) if SEG.get(seg) != '@Data' else None
                if t:
                    del pend[-3:]; flush()
                    out.append('  mov ax, offset ' + t)
                    stmt = 'mov dx, seg ' + t
                else:
                    pend.extend(raw[:f - off]); flush(); out.append('  dw seg ' + anyname(seg)); i += 1; continue
            else:
                pend.extend(raw[:f - off]); flush()
                out.append('  dw seg ' + anyname(seg))
                pend.extend(raw[f - off + 2:]); i += 1; continue
        elif key == 'M' and raw[:2] in (b'\xff\x36', b'\x80\x3e') and DSREF.get('done', 0) < 2:
            a16 = struct.unpack('<H', raw[2:4])[0]
            area = 'c' if a16 < DS_CONST_END else 'v'
            if area not in DSREF:
                DSREF[area] = 1; DSREF['done'] = DSREF.get('done', 0) + 1
                n, k = dsname(a16)
                ref = n if not k else '%s+%d' % (n, k)
                if raw[0] == 0xff: stmt = 'push word ptr %s' % ref
                else: stmt = 'cmp byte ptr %s, %d' % (ref, raw[4])
        elif raw[0] == 0xe8 and ln == 3:
            t = (off + 3 + struct.unpack('<h', raw[1:3])[0]) & 0xFFFF
            n = nears.get(t)
            if n:
                far = n[1]
                if far:
                    # far proc of this unit: Pascal/BASM emit push cs; call near. The push cs must be just before.
                    assert pend and pend[-1] == 0x0e, (key, hex(off), 'far near-call without push cs')
                    pend.pop(); flush(); out.append('  push cs')
                stmt = 'call near ptr ' + n[0]
        if stmt:
            flush(); out.append('  ' + stmt)
        else:
            pend.extend(raw)
        i += 1
    flush()
    return out

def nesting():
    """{(key, child_entry): parent_entry} from 'push bp; [push cs;] call near' sites, then siblings: a nested
    caller passing its own static link ('push word ptr [bp + link]') to a callee makes the callee its sibling."""
    out = {}
    sib = []
    for k, v in P.items():
        code = open('out/u/%s.bin' % k, 'rb').read()
        entries = {p['entry']: p for p in v['procs']}
        for p in v['procs']:
            if 'body' not in p:
                continue
            a, b = p['body']
            ins = disasm(code, a, b)
            for j, (off, ln, txt) in enumerate(ins):
                if code[off] == 0xe8 and ln == 3:
                    t = (off + 3 + struct.unpack('<h', code[off+1:off+3])[0]) & 0xFFFF
                    c = entries.get(t)
                    if c is None:
                        continue
                    prev = [x[2] for x in ins[max(0, j-2):j]]
                    if c.get('far') and prev[-2:] == ['push bp', 'push cs'] or not c.get('far') and prev[-1:] == ['push bp']:
                        out[(k, t)] = p['entry']
                    else:
                        lp = prev[-2] if c.get('far') and prev[-1:] == ['push cs'] and len(prev) > 1 else (prev[-1] if prev and not c.get('far') else None)
                        m = re.match(r'push word \[bp\+0x([0-9a-f]+)\]$', lp or '')
                        if m:
                            sib.append((k, p, int(m.group(1), 16), t))
    changed = True
    while changed:
        changed = False
        for k, p, off, t in sib:
            if (k, p['entry']) in out and (k, t) not in out and off == (6 if p.get('far') else 4):
                out[(k, t)] = out[(k, p['entry'])]
                changed = True
    return out

NEST = None

def depth(key, e):
    global NEST
    if NEST is None: NEST = nesting()
    d = 0
    while (key, e) in NEST:
        e = NEST[(key, e)]; d += 1
    return d

SKEL_FRAMES = {}  # (key, entry) -> var lines for a skeleton procedure whose nested children need named locals

def gen_unit(key):
    global NEST
    if NEST is None: NEST = nesting()
    u = U[key]; v = P[key]
    code = open('out/u/%s.bin' % key, 'rb').read()
    procs = v['procs']
    fix = u['fixups']
    nears = {p['entry']: (NAME[(key, p['entry'])], p.get('far')) for p in procs if NAME[(key, p['entry'])]}
    tails = tail_labels(key)
    nears.update(tails)
    ovl = 'entries' in u
    iface = []
    if ovl:
        iface = [e for e in u['entries'] if e != u['init']]
    else:
        iface = [p['entry'] for p in procs if p.get('far') and p['entry'] != u.get('init') and (key, p['entry']) not in NEST]
    byentry = {p['entry']: p for p in procs}
    types = {}
    def sig(p, forward=False):
        n = NAME[(key, p['entry'])]
        letter = chr(ord('a') + depth(key, p['entry']))
        nested = (key, p['entry']) in NEST
        if (key, p['entry']) in SIGS:
            pt, rtype = SIGS[(key, p['entry'])]
            for t in pt:
                if re.match(r'S\d+$', t): types[t] = 'string[%s]' % t[1:]
                if re.match(r'B\d+$', t): types[t] = 'array[1..%s] of byte' % t[1:]
            params = ['%s%d: %s' % (letter, i, t) for i, t in enumerate(pt)]
            if (key, p['entry']) not in LIFTED and not params_ok(p, pt, nested):
                params = None
            if params is not None:
                ps = '(' + '; '.join(params) + ')' if params else ''
                if len(ps) > 90: ps = '\n  ' + '\n'.join(wrap(params, '(', 100, cont='   ')).replace(', ', '; ').replace(',\n', ';\n') + ')'
                kw = 'function' if p['result'] or (key, p['entry']) in STRFUNC else 'procedure'
                res = {'byte': ': byte', 'word': ': word', 'longint': ': longint', 'real': ': real', 'pointer': ': pointer', 'shortint': ': shortint', 'integer': ': integer'}.get(rtype, '')
                if (key, p['entry']) in STRFUNC: res = ': S%d' % STRRES[(key, p['entry'])] if (key, p['entry']) in STRRES else ': string'
                return '%s %s%s%s;' % (kw, n, ps, res)
        base = 6 if p['far'] else 4
        size = p['retn']
        if nested:
            base += 2; size -= 2      # static link (TP passes it implicitly)
        copies = {c['src']: c for c in p['copies']}
        params = []; o = base + size
        idx = 0
        while o > base:
            if (o - 4) in copies and o - 4 >= base:
                c = copies[o - 4]
                if c['rtl'] == 0xA89:
                    t = 'string' if c['n'] == 255 else 'S%d' % c['n']
                    if c['n'] != 255: types['S%d' % c['n']] = 'string[%d]' % c['n']
                else:
                    t = 'B%d' % c['n']; types[t] = 'array[1..%d] of byte' % c['n']
                params.append('%s%d: %s' % (letter, idx, t)); o -= 4
            else:
                params.append('%s%d: word' % (letter, idx)); o -= 2
            idx += 1
        assert o == base, (key, hex(p['entry']), o, base)
        ps = '(' + '; '.join(params) + ')' if params else ''
        if len(ps) > 90: ps = '\n  ' + '\n'.join(wrap(params, '(', 100, cont='   ')).replace(', ', '; ').replace(',\n', ';\n') + ')'
        kw = 'function' if p['result'] else 'procedure'
        res = {'byte': ': byte', 'word': ': word', 'longint': ': longint', 'real': ': real'}.get(p['result'], '')
        return '%s %s%s%s;' % (kw, n, ps, res)
    def localsize(p):
        rs = {'byte': 1, 'word': 2, 'longint': 4, 'real': 6, None: 0}[p['result']]
        cs = sum((c['n'] + 1) if c['rtl'] == 0xA89 else c['n'] for c in p['copies'])
        return p['locals'] - rs - cs
    L = []
    L.append('{ %s: generated skeleton (original bytes in BASM) }' % key)
    L.append('{$A-,B-,D%s,E-,F+,G-,I-,L-,N-,O%s,R-,S-,V-,X-}' % ('-' if key in DMINUS else '+', '+' if ovl or key in OPLUS else '-'))
    L.append('unit %s;' % key)
    L.append('')
    L.append('interface')
    L.append('')
    L.append('uses GAMEDATA;')
    L.append('')
    body = []
    callees = set()
    for p in procs:
        e = p['entry']
        bl = body_asm(key, code, p['body'][0], p['body'][1], fix, nears)
        for l in bl:
            m = re.match(r'\s*(?:call near ptr|call|dw seg|mov dx, seg) (\w+)', l)
            if m: callees.add(m.group(1))
        p['_asm'] = bl
    # types used in interface signatures must be declared there
    isigs = [sig(byentry[e]) for e in iface]
    for p in procs: sig(p)
    types = {t: d for t, d in types.items() if not re.match(r'[SB]\d+$', t)}
    if types:
        L.append('type')
        for t, d in sorted(types.items()): L.append('  %s = %s;' % (t, d))
        L.append('')
    L += isigs
    L += ['procedure %s%s;' % (n, tail_params(key, t)) for t, (n, far) in sorted(tails.items()) if (key, t) in EXT_TAIL]
    L.append('')
    L.append('implementation')
    L.append('')
    deps = sorted({owner[c] for c in callees if c in owner and owner[c] != key} |
                  {m.group(1) for c in callees for m in [re.match(r'X(R[0-9A-F]{3})_[0-9A-F]{4}$', c)] if m and m.group(1) != key})
    deps = [d for d in deps if d not in TPL]
    # extra (code-less) uses that reproduce the original unit order: a circular implementation-uses pair
    # completes the unit the main program lists second first (see NOTES.md, unit order)
    deps = sorted(set(deps) | set(EXTRA_USES.get(key, [])))
    tpl = [t for t in ('Crt', 'Dos', 'Overlay') if any(TPLNAMES.get((t, o)) in callees for (tt, o) in TPLNAMES if tt == t)]
    L += wrap(['LIT'] + tpl + deps, 'uses ')
    L[-1] += ';'
    L.append('')
    L += LIFT_DECLS.get(key, [])
    L.append('')
    if tails:
        gen_tail(key, code, tails)
        L.append('{$L %sA.OBJ}' % key)
        for t, (n, far) in sorted(tails.items()):
            L.append('procedure %s; external;' % n if (key, t) in EXT_TAIL else 'procedure %s%s; %s; external;' % (n, tail_params(key, t), 'far' if far else 'near'))
        L.append('')
    for p in procs:
        if p['entry'] in iface or p['entry'] == u.get('init') or (key, p['entry']) in NEST: continue
        L.append(sig(p).rstrip(';') + ('; far; forward;' if p['far'] else '; near; forward;'))
    L.append('')
    children = {}
    for p in procs:
        par = NEST.get((key, p['entry']))
        if par is not None:
            children.setdefault(par, []).append(p)

    def emit(p):
        e = p['entry']; n = NAME[(key, e)]
        init = e == u.get('init')
        out = []
        out.append('{ %04X }' % e)
        if init:
            out.append('begin')
        else:
            out.append(sig(p))
            if (key, e) in LIFTED:
                out += LIFTED[(key, e)]['decl']
            elif (key, e) in SKEL_FRAMES:
                out += SKEL_FRAMES[(key, e)]
            else:
                ls = localsize(p) - (0 if (key, e) not in NEST else 0)
                if ls > 0: out.append('var loc: array[1..%d] of byte;' % ls)
            for c in children.get(e, []):
                out += ['  ' + x if x else x for x in emit(c)]
            out.append('begin')
        items = lits(code, p['lit'], e)
        if items or (key, e) in DEAD_EXTRA or (init and init_temps(p) and (key, e) not in LIFTED):
            st = []
            for t, b in items:
                if t == 's' and not b: st.append("if Pos('', LV) = 0 then")
                elif t == 's': st.append('if LV = %s then' % pstr(b))
                else: st.append('if LSV = %s then' % setlit(b))
            out.append('  if false then begin')
            for s_ in st:
                if len(s_) <= 110: out.append('    ' + s_ + ';')
                elif s_.startswith('if LSV'): out.extend(wrap(s_[10:-6].split(', '), '    if LSV = [', cont='      ')); out[-1] += '] then;'
                else: out.extend(splitlit(s_))
            if (key, e) in DEAD_EXTRA: out.append('    ' + DEAD_EXTRA[(key, e)])
            if init and (key, e) not in LIFTED: out += ['    ' + x for x in init_temps(p)]
            out.append('  end;')
        if (key, e) in LIFTED:
            out += LIFTED[(key, e)]['body']
        else:
            out.append('  asm')
            out += ['  ' + x for x in p['_asm']]
            out.append('  end;')
        out.append('end.' if init else 'end;')
        out.append('')
        return out

    for p in procs:
        if (key, p['entry']) in NEST:
            continue
        if (key, p['entry']) in OPLUS_PROCS and not (ovl or key in OPLUS):
            L += ['{$O+}'] + emit(p) + ['{$O-}']      # overlay-safe code for this procedure only
        else:
            L += emit(p)
    if u.get('init') is None or key == 'M':
        L.append('end.')
    return L

def gen_tail(key, code, tails):
    """src/<key>A.ASM (nasm, OMF): the original bytes of the unit's asm tail with public entry labels."""
    a, b = P[key]['obj']
    while b > a and code[b-1] == 0: b -= 1     # paragraph padding
    fix = {f: s for f, s in U[key]['fixups'] if a <= f < b}
    L = ['; %s asm tail %04X-%04X (original bytes; generated by tools/skel.py)' % (key, a, b),
         'segment CODE public class=CODE', '']
    for t, (n, far) in sorted(tails.items()): L.append('global %s' % n)
    L.append('')
    i = a
    labels = {t: n for t, (n, far) in tails.items()}
    pend = []
    def flush():
        while pend:
            ch = pend[:16]; del pend[:16]
            L.append('  db ' + ','.join('0x%02x' % x for x in ch))
    while i < b:
        if i in labels: flush(); L.append('%s:' % labels[i])
        if i in fix:
            assert SEG[fix[i]] == key, (key, hex(i))
            flush(); L.append('  dw seg %s' % ('X%s_%04X' % (key, a) if a in labels else '$$'))
            i += 2; continue
        pend.append(code[i]); i += 1
    flush()
    open('src/%sA.ASM' % key, 'w').write('\n'.join(L) + '\n')
    subprocess.run(['nasm', '-f', 'obj', '-o', 'src/%sA.OBJ' % key, 'src/%sA.ASM' % key], check=True)

def splitlit(s):
    """if LV = '....long....' then -> lines joined with + (constant-folded by TPC?)."""
    inner = s[9:-5]; pre = 'if LV = ('
    assert s.endswith(' then')
    toks = re.findall(r"'(?:[^']|'')*'|#\d+", inner)
    lines = ['    ' + pre]; cur = ''
    for t in toks:
        if len(cur) + len(t) > 100:
            lines.append('      ' + cur + ' +'); cur = ''
        if len(t) > 100:
            # break a quoted run
            q = t[1:-1]
            while len(q) > 90:
                cut = 90
                while q[cut-1] == "'" and q[:cut].count("'") % 2: cut -= 1
                lines.append("      '" + q[:cut] + "' +"); q = q[cut:]
            t = "'" + q + "'"
        cur += t
    lines.append('      ' + cur + ') then;')
    return lines

owner = {}
for (k, e), n in NAME.items():
    if n: owner[n] = k
for (t, o), n in TPLNAMES.items(): owner[n] = t

DS_CONST_START = 2        # DS:0 holds a word TPC puts before all typed constants
DS_CONST_END = 0x7D8C      # game typed constants occupy DS[DS_CONST_START, DS_CONST_END)
DS_VAR_START = 0x7DDE
DS_VAR_SIZE = int(os.environ.get('VARSIZE', '0x7D98'), 16)  # game vars, from 0x47F4 (refined by diffing)

DSITEMS = None
def dsname(a16):
    """(GAMEDATA item name, offset inside it) for a DS address."""
    global DSITEMS
    if DSITEMS is None:
        DSITEMS = []
        for l in open('src/GAMEDATA.PAS'):
            m = re.match(r'\{([0-9A-F]{4})\} (\w+):', l)
            if m: DSITEMS.append((int(m.group(1), 16), m.group(2)))
        DSITEMS.sort()
    best = max((x for x in DSITEMS if x[0] <= a16), default=None)
    return best[1], a16 - best[0]

def gen_main():
    key = 'M'; u = U[key]
    code = open('out/u/M.bin', 'rb').read()
    o = open('orig/GAME.bin', 'rb').read()
    ds = o[0x9E70:]
    game = [k for k in UNITS if k not in TPL and k != 'M']
    usel = ['Overlay', 'Dos', 'Crt', 'GAMEDATA'] + list(reversed(game)) + ['LIT']
    for a, b in MAIN_SWAP:
        i, j = usel.index(a), usel.index(b); usel[i], usel[j] = usel[j], usel[i]
    L = ['{ GAME: main program (generated skeleton) }',
         '{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O-,R-,S-,V-,X-}',
         '{$M 16384,0,655360}',
         'program GAME;', '']
    L += wrap(usel, 'uses ')
    L[-1] += ';'
    L.append('')
    for k in game:
        if k.startswith('O'): L.append('{$O %s}' % k)
    L.append('')
    if os.path.exists('data/main_body.pas'):
        # hand-written main program body (declarations + begin..end.)
        L += open('data/main_body.pas').read().rstrip('\n').split('\n')
        return L
    L.append('begin')
    items = lits(code, 0, 2)
    L.append('  if false then begin')
    for t, b in items: L.append('    if LV = %s then;' % pstr(b))
    L.append('    if LV = FS then;')
    L.append('  end;')
    nears = {}
    L.append('  asm')
    L += ['  ' + x for x in body_asm(key, code, 0x10D, 0x2F6, u['fixups'], nears)]
    L.append('  end;')
    L.append('end.')
    return L

if __name__ == '__main__':
    os.makedirs('src', exist_ok=True)
    if sys.argv[1:] == ['M']:
        open('src/GAME.PAS', 'w', newline='\r\n').write('\n'.join(gen_main()) + '\n'); sys.exit()
    keys = sys.argv[1:] or [k for k in UNITS if k not in TPL and k != 'M']
    for k in keys:
        if P[k].get('obj'): print('NOTE %s has an asm tail %X-%X (not generated)' % (k, *P[k]['obj']))
        L = gen_unit(k)
        open('src/%s.PAS' % k, 'w', newline='\r\n').write('\n'.join(L) + '\n')
    print('ok', len(keys))
