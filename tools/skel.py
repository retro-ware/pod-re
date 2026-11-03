"""Generate the skeleton Pascal sources: every unit with real procedure frames and BASM `db` bodies.

src/<UNIT>.PAS for each game unit. Bodies are the original bytes; every far/near call, procedure address and segment
fixup is symbolic so TPC links the same procedures (smart linking) and writes the same relocations.
System RTL calls stay literal bytes (no BASM name for them) until the code is rewritten in Pascal.
"""
import json, re, struct, subprocess, os, sys, collections
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

U = {u['key']: u for u in json.load(open('out/units.json'))}
P = json.load(open('out/procs.json'))
UNITS = [k for k in U]  # paragraph order
SEG = {u['seg']: k for k, u in U.items()}
SEG[0xDE2] = '@Data'
TPL = ('Dos', 'Crt', 'Overlay', 'System')
TPLNAMES = {('Dos', 0x0B): 'Intr', ('Dos', 0xA2): 'GetTime', ('Dos', 0xDE): 'DiskFree', ('Dos', 0x112): 'FindFirst',
            ('Dos', 0x150): 'FindNext', ('Dos', 0x18D): 'FExpand', ('Dos', 0x256): 'FSplit',
            ('Overlay', 0x14): 'OvrInit', ('Overlay', 0x19B): 'OvrSetBuf', ('Overlay', 0x1F3): 'OvrGetBuf'}
# skeleton stand-ins for TPL calls: the real routine with dummy arguments, so the TPL unit's code and data link
TPLCALL = {'Intr': 'Intr(0, TPLR(LP)^)', 'GetTime': 'GetTime(LW, LW, LW, LW)', 'DiskFree': 'LL := DiskFree(0)',
           'FindFirst': "FindFirst(LV, 0, TPLS(LP)^)", 'FindNext': 'FindNext(TPLS(LP)^)', 'FExpand': "LV := FExpand(LV)",
           'FSplit': "FSplit(LV, TPLDS(LP)^, TPLNS(LP)^, TPLES(LP)^)", 'OvrInit': "OvrInit(LV)",
           'OvrSetBuf': 'OvrSetBuf(0)', 'OvrGetBuf': 'LL := OvrGetBuf'}
TPLTYPES = 'type TPLR = ^Registers; TPLS = ^SearchRec; TPLDS = ^DirStr; TPLNS = ^NameStr; TPLES = ^ExtStr;'
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

DEAD_EXTRA = {}  # frame temps: 256 (FS) + 10 (literal) = 10Ah
OPLUS = set()
OPLUS_PROCS = set()   # (key, entry) of procedures compiled {$O+} inside $O- units (set by tools/lift/prog.py)   # resident units compiled overlay-safe ($O+: literal arguments copied to stack temps)
EXTRA_USES = {}
MAIN_SWAP = []   # pairs listed in swapped order in the main program's uses clause

TAIL = {}   # key -> {offset: (name, far)}
STRFUNC = set()
STRRES = {}       # (key, entry) -> n: string function returning string[n] (n < 255)   # (key, entry) of string functions (result pointer left on the caller's stack)
SIGS = {}         # (key, entry) -> [Pascal parameter types]   (set by tools/lift/build.py)
LIFTED = {}       # (key, entry) -> {'decl': [...], 'body': [...]}
LIFT_DECLS = {}   # key -> unit-level declarations (types, absolute aliases)

def params_ok(p, pt, nested=False):
    """A skeleton procedure may take refined parameter types when the stack layout is unchanged."""
    sz = sum(6 if t == 'real' else 4 if (t in ('pointer', 'longint', 'string', 'var') or re.match(r'[SB]\d+$', t)) else 2 for t in pt)
    return sz == p['retn'] - (2 if nested else 0)
DSREF = {}  # main program: one symbolic reference each to DSCONST / DSVAR keeps them linked
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
    if v.get('obj'):
        # far calls into the tail from other units (the label must then be public in the interface)
        a, b = v['obj']
        for k2, u2 in U.items():
            if k2 == key or k2 not in P: continue
            c2 = open('out/u/%s.bin' % k2, 'rb').read()
            for f, sg in u2['fixups']:
                if sg == U[key]['seg'] and f >= 3 and c2[f - 3] == 0x9a:
                    t = struct.unpack('<H', c2[f-2:f])[0]
                    if a <= t < b: lab[t] = ('X%s_%04X' % (key, t), True)
    TAIL[key] = lab
    return lab

TAILSIG = {}
def LIFT_BODIES_TEXT(key):
    g = globals().get('LIFT_BODIES') or {}
    out = []
    for kk, v in g.items():
        if (kk[0] if isinstance(kk, tuple) else kk) == key:
            out += v if isinstance(v, list) else [str(v)]
    return out

TAILNEAR = set()
TAILFUNC = {}
TAILBYTE = {}

def tail_sig(key, ofs):
    """Parameter sizes (Pascal order) of a far asm-tail routine: retf N plus the [bx+d] slots after mov bx,sp
    (an les slot is a pointer). None when the routine's shape is not that simple."""
    if (key, ofs) in TAILSIG: return TAILSIG[(key, ofs)]
    code = open('out/u/%s.bin' % key, 'rb').read()
    acc = {}; n = None; bxsp = False; bpf = False; near = False; prevw = None; wid = {}
    # slot offsets are recorded raw ([bp+d] / [bx+d]) and normalised once retf/ret tells far from near
    def put(d, w): acc[d] = max(acc.get(d, 2), w)
    for off, ln, txt in disasm(code, ofs, min(len(code), ofs + 0x800)):
        t = txt.split()
        if t and t[0] == 'mov' and txt.replace(' ', '').endswith('bx,sp'): bxsp = True
        if t and t[0] == 'mov' and txt.replace(' ', '').endswith('bp,sp') and off <= ofs + 1: bpf = True
        w = 4 if t and t[0] in ('les', 'lds') else 2
        bw = 'byte' in txt or re.match(r'\w+ (al|ah|bl|bh|cl|ch|dl|dh),', txt) is not None
        if bpf:
            for m in re.finditer(r'\[(?:ss:)?bp\+(0x[0-9a-f]+|\d+)\]', txt):
                put(('bp', int(m.group(1), 0)), w); wid.setdefault(('bp', int(m.group(1), 0)), set()).add(bw)
        if bxsp:
            for m in re.finditer(r'\[(?:ss:)?bx\+(0x[0-9a-f]+|\d+)\]', txt):
                put(('bx', int(m.group(1), 0)), w); wid.setdefault(('bx', int(m.group(1), 0)), set()).add(bw)
        if t and t[0] == 'pop' and t[-1] == 'bp': prevw = prevw
        elif t and t[0] not in ('retf', 'ret'): prevw = txt
        if t and t[0] in ('retf', 'ret'):
            # a routine whose return is preceded by  mov al,X / mov ax,X  is a byte / word function
            if n is None and prevw:
                m = re.match(r'(?:mov|xor|sub|or) (al|ax),', prevw)
                if m: TAILFUNC[(key, ofs)] = {'al': 'byte', 'ax': 'word'}[m.group(1)]
            # the first return gives the parameter size; later exits of the same routine can still touch slots,
            # so keep scanning up to the next routine label
            if n is None:
                near = t[0] == 'ret'
                n = int(t[-1], 0) if len(t) > 1 and t[-1] not in ('retf', 'ret') else 0
                nxt = min([o for o in tail_labels(key) if o > ofs] + [len(code)])
            if off + ln >= nxt: break
            continue
        if n is not None and off >= nxt: break
        if t and t[0] in ('jmp',) and 'ptr' in txt: break
    # normalise to "far bx" numbering where the first slot is 4: far bp+6 / near bp+4 / far bx+4 / near bx+2
    adj = {('bp', False): -2, ('bp', True): 0, ('bx', False): 0, ('bx', True): 2}
    a2 = {}; bonly = set()
    for (kind, d), w in acc.items():
        dd = d + adj[(kind, near)]
        if dd >= 4: a2[dd] = max(a2.get(dd, 2), w)
        if dd >= 4 and wid.get((kind, d)) == {True}: bonly.add(dd)
    acc = a2
    if near and n is not None: TAILNEAR.add((key, ofs))
    r = None
    if n is not None and (n == 0 or acc):
        sl = []; o = 4
        while o < 4 + n:
            sz = 4 if acc.get(o) == 4 and o + 4 <= 4 + n else 2
            sl.append(sz); o += sz
        if o == 4 + n:
            r = list(reversed(sl))
            # Pascal index of each slot (offset 4 is the last parameter); slots read only as bytes are byte params
            o = 4; offs = []
            for sz in sl: offs.append(o); o += sz
            offs.reverse()
            TAILBYTE[(key, ofs)] = {i for i, (z, oo) in enumerate(zip(r, offs)) if z == 2 and oo in bonly}
            # the last slot never read: byte if every caller pushes it with  mov al,X; push ax
            if r and r[-1] == 2 and 4 not in acc and _last_arg_bytes(key, ofs, near):
                TAILBYTE[(key, ofs)].add(len(r) - 1)
    TAILSIG[(key, ofs)] = r
    return r

def _last_arg_bytes(key, ofs, near):
    code = open('out/u/%s.bin' % key, 'rb').read(); prev = []; seen = ok = 0
    for off, ln, txt in disasm(code, 0, len(code)):
        if txt.replace(' ', '') == 'call0x%x' % ofs:
            q = prev[:-1] if prev and prev[-1] == 'push cs' else prev
            seen += 1
            ok += len(q) >= 2 and q[-1] == 'push ax' and q[-2].startswith('mov al,')
        prev = (prev + [txt])[-4:]
    return seen > 0 and ok == seen

TAILPTR = {}
def tail_ptr(key, ofs):
    """4-byte slots of a near tail routine that its callers fill with push word/push word (a pointer value,
    not the address of a variable): then the slot is declared pointer rather than untyped var."""
    if (key, ofs) not in TAILPTR:
        code = open('out/u/%s.bin' % key, 'rb').read(); prev = []; r = False
        for off, ln, txt in disasm(code, 0, len(code)):
            if txt.replace(' ', '') == 'call0x%x' % ofs and prev and prev[-1].startswith('push word ['): r = True
            prev = (prev + [txt])[-3:]
        TAILPTR[(key, ofs)] = r
    return TAILPTR[(key, ofs)]

def slot_t(key, ofs, z, i=None):
    if z != 4: return 'byte' if i is not None and i in TAILBYTE.get((key, ofs), ()) else 'word'
    return 'pointer' if (key, ofs) in TAILNEAR and tail_ptr(key, ofs) else 'var'

def tail_decl(key, ofs, n):
    sg = tail_sig(key, ofs)
    if (key, ofs) in TAILFUNC: return tail_fdecl(key, ofs, n, sg)
    if not sg: return n
    # an les slot is an untyped var parameter: callers push ds:offset with  mov di,X; push ds; push di
    return '%s(%s)' % (n, '; '.join(('var a%d' % (i + 1)) if slot_t(key, ofs, z) == 'var' else 'a%d: %s' % (i + 1, slot_t(key, ofs, z, i)) for i, z in enumerate(sg)))

def tail_pdecl(key, ofs, n):
    """Procedure alias declaration of a function routine ('' for others)."""
    if (key, ofs) not in TAILFUNC: return None
    sg = tail_sig(key, ofs)
    ps = '; '.join(('var a%d' % (i + 1)) if slot_t(key, ofs, z) == 'var' else 'a%d: %s' % (i + 1, slot_t(key, ofs, z, i)) for i, z in enumerate(sg or []))
    return '%sP%s' % (n, '(%s)' % ps if ps else '')

def tail_fdecl(key, ofs, n, sg):
    ps = '; '.join(('var a%d' % (i + 1)) if slot_t(key, ofs, z) == 'var' else 'a%d: %s' % (i + 1, slot_t(key, ofs, z, i)) for i, z in enumerate(sg or []))
    return 'FUNC %s%s: %s' % (n, '(%s)' % ps if ps else '', TAILFUNC[(key, ofs)])

def tail_call(key, ofs, n):
    sg = tail_sig(key, ofs)
    if (key, ofs) in TAILFUNC:
        n = n + 'P'
        if not sg: return n
    if not sg: return n
    return '%s(%s)' % (n, ', '.join({'var': 'LV', 'pointer': 'nil', 'word': '0'}[slot_t(key, ofs, z)] for z in sg))

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

def body_asm_basm(key, code, a, b, fixups, nears):
    """BASM lines for code[a:b] (TP6, unused)."""
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

def sig_parts(key, p):
    """(keyword, name, ['a0: word', ...], ': result' or '', {type name: definition}) of a procedure's skeleton header."""
    global NEST
    if NEST is None: NEST = nesting()
    types = {}
    n = NAME[(key, p['entry'])]
    letter = chr(ord('a') + depth(key, p['entry']))
    nested = (key, p['entry']) in NEST
    if (key, p['entry']) in SIGS:
        pt, rtype = SIGS[(key, p['entry'])]
        for t in pt:
            if re.match(r'S\d+$', t): types[t] = 'string[%s]' % t[1:]
            if re.match(r'B\d+$', t): types[t] = 'array[1..%s] of byte' % t[1:]
        params = [('var %s%d' % (letter, i)) if t == 'var' else '%s%d: %s' % (letter, i, t) for i, t in enumerate(pt)]
        if (key, p['entry']) not in LIFTED and not params_ok(p, pt, nested):
            params = None
        if params is not None:
            kw = 'function' if p['result'] or (key, p['entry']) in STRFUNC else 'procedure'
            res = {'byte': ': byte', 'word': ': word', 'longint': ': longint', 'real': ': real', 'pointer': ': pointer', 'shortint': ': shortint', 'integer': ': integer'}.get(rtype, '')
            if (key, p['entry']) in STRFUNC: res = ': S%d' % STRRES[(key, p['entry'])] if (key, p['entry']) in STRRES else ': string'
            return kw, n, params, res, types
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
            if c['rtl'] == 0x644:
                t = 'string' if c['n'] == 255 else 'S%d' % c['n']
                if c['n'] != 255: types['S%d' % c['n']] = 'string[%d]' % c['n']
            else:
                t = 'B%d' % c['n']; types[t] = 'array[1..%d] of byte' % c['n']
            params.append('%s%d: %s' % (letter, idx, t)); o -= 4
        else:
            params.append('%s%d: word' % (letter, idx)); o -= 2
        idx += 1
    assert o == base, (key, hex(p['entry']), o, base)
    kw = 'function' if p['result'] else 'procedure'
    res = {'byte': ': byte', 'word': ': word', 'longint': ': longint', 'pointer': ': pointer', 'real': ': real'}.get(p['result'], '')
    return kw, n, params, res, types

DUMMY_RES = {': byte': 'LW', ': word': 'LW', ': shortint': 'LW', ': integer': 'LW', ': longint': 'LL', ': real': 'LR',
             ': pointer': 'LP'}

def dummy_call(key, p):
    """Skeleton call statement for procedure p of unit key: real Pascal call (keeps the callee linked), dummy args."""
    kw, n, params, res, types = sig_parts(key, p)
    args = []
    for prm in params:
        if prm.startswith('var '):
            args.append('LV'); continue
        t = prm.split(': ', 1)[1]
        if t in ('word', 'byte', 'integer', 'shortint', 'longint', 'boolean', 'char'): args.append('0' if t not in ('boolean', 'char') else ('false' if t == 'boolean' else "#0"))
        elif t == 'real': args.append('0.0')
        elif t == 'pointer': args.append('nil')
        elif t == 'string' or re.match(r'S\d+$', t): args.append('LV')
        else: args.append('P%s(LP)^' % t)
    c = n + ('(' + ', '.join(args) + ')' if args else '')
    if res:
        c = '%s := %s' % (DUMMY_RES.get(res, 'LV'), c)
    return c

def inline_lines(bs):
    """inline(...) statement lines for raw bytes."""
    out = []
    for i in range(0, len(bs), 24):
        out.append(('inline(' if i == 0 else '  ') + '/'.join('$%02X' % x for x in bs[i:i+24]) +
                   (');' if i + 24 >= len(bs) else '/'))
    return out

BYENTRY = {(k, p['entry']): p for k, v in P.items() for p in v['procs']}


def _ptr_results():
    """TP 5.5 returns longint and pointer results alike (les ax,[bp-4]; mov dx,es): a 4-byte function whose result a
    caller dereferences right after the call (mov di,ax; mov es,dx) returns a pointer."""
    import struct
    deref = (b'\x89\xc7\x8e\xc2', b'\x8b\xf8\x8e\xc2')
    for k, u in U.items():
        try:
            code = open('out/u/%s.bin' % k, 'rb').read()
        except OSError:
            continue
        fix = dict((f, sg) for f, sg in u.get('fixups', []))
        for d in deref:
            i = code.find(d)
            while i >= 0:
                tgt = None
                if i >= 5 and code[i - 5] == 0x9a and (i - 2) in fix:
                    t = SEG.get(fix[i - 2]); ofs = struct.unpack('<H', code[i - 4:i - 2])[0]
                    if t in U and 'entries' in U[t] and ofs >= 0x20 and (ofs - 0x20) % 5 == 0 and \
                            (ofs - 0x20) // 5 < len(U[t]['entries']):
                        ofs = U[t]['entries'][(ofs - 0x20) // 5]
                    tgt = (t, ofs)
                elif i >= 3 and code[i - 3] == 0xe8:
                    tgt = (k, (i + struct.unpack('<h', code[i - 2:i])[0]) & 0xFFFF)
                p = BYENTRY.get(tgt) if tgt else None
                if p is not None and p.get('result') == 'longint':
                    PTRRES.add(tgt)
                i = code.find(d, i + 1)


PTRRES = set()
_ptr_results()

def _tail_byte_results():
    """Asm-tail routines whose result the scan of their own code misses (e.g. a near helper call right before
    retf): a caller that stores or tests al right after the far call shows a byte function."""
    import struct
    for k, u in U.items():
        try:
            code = open('out/u/%s.bin' % k, 'rb').read()
        except OSError:
            continue
        for f, sg in u.get('fixups', []):
            i = f - 3
            if i < 0 or code[i] != 0x9a or i + 7 > len(code):
                continue
            nx = code[i + 5:i + 7]
            if not (nx[0] == 0xa2 or nx[0] == 0x3c or nx in (b'\x0a\xc0', b'\x08\xc0', b'\x84\xc0') or
                    nx[0] == 0x88 and nx[1] & 0xc7 in (0x46, 0x86, 0x06)):
                continue
            t = SEG.get(sg); ofs = struct.unpack('<H', code[i + 1:i + 3])[0]
            if t not in U or t not in P or 'entries' in U[t] or (t, ofs) in TAILFUNC:
                continue
            if ofs in tail_labels(t) and tail_sig(t, ofs) is not None:
                TAILFUNC[(t, ofs)] = 'byte'

_tail_byte_results()

def body_asm(key, code, a, b, fixups, nears):
    """TP 5.5 statement lines for code[a:b]: inline(...) for plain bytes, Pascal calls (dummy arguments) for
    calls to game procedures so smart linking keeps them. Not byte-exact at call sites (skeleton only)."""
    out = []; pend = []
    def flush():
        if pend: out.extend(inline_lines(bytes(pend))); del pend[:]
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
            k = SEG.get(seg)
            if k in TPL and k != 'System':
                stmt = TPLCALL[TPLNAMES[(k, ofs)]]
            elif k not in TPL and k != '@Data':
                if 'entries' in U[k]:
                    ofs = U[k]['entries'][(ofs - 0x20) // 5]
                p = BYENTRY.get((k, ofs))
                if p is not None and NAME.get((k, ofs)):
                    stmt = dummy_call(k, p)
                elif ofs in tail_labels(k):
                    stmt = tail_call(k, ofs, tail_labels(k)[ofs][0]) if tail_labels(k)[ofs][1] else tail_labels(k)[ofs][0]
        elif fx:
            f = fx[0]; seg = fixset[f]
            if raw[0] == 0xba and ln == 3 and i > 0 and code[ins[i-1][0]] == 0xb8 and SEG.get(seg) not in TPL + ('@Data',):
                try:
                    t = target(seg, struct.unpack('<H', code[ins[i-1][0]+1:ins[i-1][0]+3])[0])
                except KeyError:
                    t = None
                if t:
                    del pend[-3:]
                    stmt = 'LP := @' + t
        elif key == 'M' and raw[:2] in (b'\xff\x36', b'\x80\x3e') and DSREF.get('done', 0) < 2:
            a16 = struct.unpack('<H', raw[2:4])[0]
            area = 'c' if a16 < DS_CONST_END else 'v'
            if area not in DSREF:
                DSREF[area] = 1; DSREF['done'] = DSREF.get('done', 0) + 1
                n, kk = dsname(a16)
                pend.extend(raw); flush()
                out.append('LP := @%s;' % n)
                i += 1; continue
        elif raw[0] == 0xe8 and ln == 3:
            t = (off + 3 + struct.unpack('<h', raw[1:3])[0]) & 0xFFFF
            n = nears.get(t)
            if n:
                if n[1] and pend and pend[-1] == 0x0e: pend.pop()
                p = BYENTRY.get((key, t))
                if (key, t) in NEST and pend and pend[-1] == 0x55: pend.pop()
                stmt = dummy_call(key, p) if p is not None and NAME.get((key, t)) else \
                    tail_call(key, t, n[0]) if t in tail_labels(key) else n[0]
        if stmt:
            flush(); out.append(stmt + ';')
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

CALLERS = None
def callers():
    """{(key, entry): set of (caller key, caller entry)} from near calls inside units and far calls across them."""
    global CALLERS
    if CALLERS is not None: return CALLERS
    CALLERS = collections.defaultdict(set)
    for k, v in P.items():
        code = open('out/u/%s.bin' % k, 'rb').read()
        fixset = {f: s for f, s in U[k]['fixups']}
        for p in (v['procs'] if k != 'M' else [{'entry': MAIN_BODY[0], 'end': MAIN_BODY[1], 'body': 1}]):
            if 'body' not in p: continue
            for off, ln, txt in disasm(code, p['entry'], p['end']):
                if code[off] == 0xe8 and ln == 3:
                    t = (off + 3 + struct.unpack('<h', code[off+1:off+3])[0]) & 0xFFFF
                    CALLERS[(k, t)].add((k, p['entry']))
                elif code[off] == 0x9a and ln == 5 and (off + 3) in fixset:
                    tk = SEG.get(fixset[off + 3]); o = struct.unpack('<H', code[off+1:off+3])[0]
                    if tk in U and 'entries' in U[tk]: o = U[tk]['entries'][(o - 0x20) // 5]
                    if tk: CALLERS[(tk, o)].add((k, p['entry']))
                elif code[off] == 0xb8 and ln == 3 and code[off+3] == 0xba and (off + 4) in fixset:
                    tk = SEG.get(fixset[off + 4]); o = struct.unpack('<H', code[off+1:off+3])[0]
                    if tk in U and 'entries' in U[tk] and (o - 0x20) % 5 == 0 and 0 <= (o - 0x20) // 5 < len(U[tk]['entries']):
                        o = U[tk]['entries'][(o - 0x20) // 5]
                    if tk: CALLERS[(tk, o)].add((k, p['entry']))
    return CALLERS

def plan_decls(key):
    """Declaration plan reproducing an overlaid unit's stub entry order (entries are created at a far proc's first
    declaration: early (interface/forward) declarations in order, then directly defined procs in code order, each
    followed by its nested procs; procs dropped by smart linking keep a 0xFFFF slot).
    Returns (early: [entry or None for a dropped proc], drops_before: {entry or None(end): n})."""
    u = U[key]
    E = u['entries'][1:]
    assert u['entries'][0] == u['init'], key
    procs = [p for p in P[key]['procs'] if p['entry'] != u['init']]
    top = [p['entry'] for p in procs if (key, p['entry']) not in NEST]
    kids = collections.defaultdict(list)
    for p in procs:
        if (key, p['entry']) in NEST: kids[NEST[(key, p['entry'])]].append(p['entry'])
    def tree(e):
        out = [e]
        for c in kids[e]: out += tree(c)
        return out
    pos = {e: i for i, e in enumerate(top)}
    cl = callers()
    need = 0
    for j, e in enumerate(E):
        if e == 0xFFFF or (key, e) in NEST: continue
        ext = any(ck != key for ck, ce in cl.get((key, e), ()))
        # called from code defined before it (or from a nested proc of an earlier parent): must be declared early
        def toplevel(x):
            while (key, x) in NEST: x = NEST[(key, x)]
            return x
        early_use = any(ck == key and toplevel(ce) in pos and pos[toplevel(ce)] < pos[e] for ck, ce in cl.get((key, e), ()))
        if ext or early_use: need = j + 1
    for j in range(need, len(E) + 1):
        pre = E[:j]
        if any(x != 0xFFFF and (key, x) in NEST for x in pre): break
        seq = []
        for e in top:
            seq += tree(e) if e not in pre else tree(e)[1:]
        rest = E[j:]
        real = [x for x in rest if x != 0xFFFF]
        if real != seq: continue
        drops = collections.Counter()
        i = 0
        for x in rest:
            if x == 0xFFFF:
                # dropped proc defined just before the next real definition (nested ones inside their parent)
                nxt = real[i] if i < len(real) else None
                drops[nxt] += 1
            else:
                i += 1
        return [None if x == 0xFFFF else x for x in pre], dict(drops)
    raise ValueError('no declaration plan for %s' % key)

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
    drops = {}
    if ovl:
        iface, drops = plan_decls(key)    # None = a procedure the smart linker drops (keeps a 0xFFFF stub slot)
    else:
        iface = [p['entry'] for p in procs if p.get('far') and p['entry'] != u.get('init') and (key, p['entry']) not in NEST]
    byentry = {p['entry']: p for p in procs}
    types = {}
    def sig(p, forward=False):
        kw, n, params, res, tps = sig_parts(key, p)
        types.update(tps)
        ps = '(' + '; '.join(params) + ')' if params else ''
        if len(ps) > 90: ps = '\n  ' + '\n'.join(wrap(params, '(', 100, cont='   ')).replace(', ', '; ').replace(',\n', ';\n') + ')'
        return '%s %s%s%s;' % (kw, n, ps, res)
    def localsize(p):
        rs = {'byte': 1, 'word': 2, 'longint': 4, 'pointer': 4, 'real': 6, None: 0}[p['result']]
        cs = sum((c['n'] + 1) if c['rtl'] == 0x644 else c['n'] for c in p['copies'])
        return p['locals'] - rs - cs
    L = []
    L.append('{ %s: generated skeleton (original bytes in BASM) }' % key)
    L.append('{$A-,B-,D+,E-,F+,I-,L-,N-,O%s,R-,S-,V-}' % ('+' if ovl or key in OPLUS else '-'))
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
            m = re.match(r'\s*(?:\w+ := @?)?(\w+)', l)
            if m: callees.add(m.group(1))
        p['_asm'] = bl
    # types used in interface signatures must be declared there
    isigs = [sig(byentry[e]) if e is not None else 'procedure DROP%d;' % i for i, e in enumerate(iface)]
    for p in procs: sig(p)
    types = {t: d for t, d in types.items() if not re.match(r'[SB]\d+$', t)}
    if types:
        L.append('type')
        for t, d in sorted(types.items()): L.append('  %s = %s;' % (t, d))
        L.append('')
    L += isigs
    L += [('procedure %s;' % tail_decl(key, t, n)).replace('procedure FUNC ', 'function ') for t, (n, far) in sorted(tails.items()) if far]
    L += ['procedure %s;' % tail_pdecl(key, t, n) for t, (n, far) in sorted(tails.items()) if far and tail_pdecl(key, t, n)]
    L.append('')
    L.append('implementation')
    L.append('')
    deps = sorted({owner[c] for c in callees if c in owner and owner[c] != key})
    deps = [d for d in deps if d not in TPL]
    # extra (code-less) uses that reproduce the original unit order: a circular implementation-uses pair
    # completes the unit the main program lists second first (see NOTES.md, unit order)
    deps = sorted(set(deps) | set(EXTRA_USES.get(key, [])))
    tpl = [t for t in ('Crt', 'Dos', 'Overlay') if any(TPLNAMES.get((t, o)) in callees for (tt, o) in TPLNAMES if tt == t)]
    if 'Dos' not in tpl and any(re.search(r'\b(Registers|SearchRec|DateTime|PathStr)\b', x) for x in LIFT_DECLS.get(key, []) + LIFT_BODIES_TEXT(key)):
        tpl = sorted(tpl + ['Dos'], key=['Crt', 'Dos', 'Overlay'].index)
    L += wrap(['LIT'] + tpl + deps, 'uses ')
    L[-1] += ';'
    L.append('')
    if 'Dos' in tpl:
        L += [TPLTYPES, '']
    L += LIFT_DECLS.get(key, [])
    L.append('')
    if tails:
        gen_tail(key, code, tails)
        L.append('{$L %sA.OBJ}' % key)
        for t, (n, far) in sorted(tails.items()):
            L.append((('procedure %s; external;' % tail_decl(key, t, n)) if far else '{$F-}\nprocedure %s; external;\n{$F+}' % tail_decl(key, t, n)).replace('procedure FUNC ', 'function '))
            if tail_pdecl(key, t, n):
                L.append(('procedure %s; external;' % tail_pdecl(key, t, n)) if far else '{$F-}\nprocedure %s; external;\n{$F+}' % tail_pdecl(key, t, n))
        L.append('')
    for i, e in enumerate(iface):
        if e is None: L += ['procedure DROP%d; begin end;' % i, '']
    for p in procs:
        if ovl or p['entry'] in iface or p['entry'] == u.get('init') or (key, p['entry']) in NEST: continue
        L.append(sig(p).rstrip(';') + '; forward;' if p['far'] else '{$F-} ' + sig(p).rstrip(';') + '; forward; {$F+}')
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
                out += ['  ' + x if x else x for x in dropdefs(drops.get(c['entry'], 0)) + emit(c)]
            out.append('begin')
        items = lits(code, p['lit'], e)
        if items or (key, e) in DEAD_EXTRA:
            st = []
            for t, b in items:
                if t == 's' and not b: st.append("if Pos('', LV) = 0 then")
                elif t == 's': st.append('if LV = %s then' % pstr(b))
                else: st.append('if LSV = %s then' % setlit(b))
            out.append('  if false then begin')
            for s_ in st:
                if len(s_) <= 110: out.append('    ' + s_ + ';')
                elif s_.startswith('if LSV'): out.extend(wrap(s_[11:-6].split(', '), '    if LSV = [', cont='      ')); out[-1] += '] then;'
                else: out.extend(splitlit(s_))
            if (key, e) in DEAD_EXTRA: out.append('    ' + DEAD_EXTRA[(key, e)])
            out.append('  end;')
        if (key, e) in LIFTED:
            out += LIFTED[(key, e)]['body']
        else:
            out += ['  ' + x for x in p['_asm']]
        out.append('end.' if init else 'end;')
        out.append('')
        return out

    nd = [0]
    def dropdefs(n):
        out = []
        for _ in range(n):
            out += ['procedure DROPD%d; begin end;' % nd[0], '']; nd[0] += 1
        return out
    for p in procs:
        if (key, p['entry']) in NEST:
            continue
        L += dropdefs(drops.get(p['entry'], 0) + (drops.get(None, 0) if p['entry'] == u.get('init') else 0))
        if (key, p['entry']) in OPLUS_PROCS and not (ovl or key in OPLUS):
            L += ['{$O+}'] + emit(p) + ['{$O-}']      # overlay-safe code for this procedure only
        else:
            L += emit(p)
    if u.get('init') is None or key == 'M':
        L.append('end.')
    return L

def gen_tail(key, code, tails):
    """src/<key>A.OBJ (OMF via tools/omfw.py; TP 5.5 rejects nasm's): the original bytes of the unit's asm tail
    with public entry labels; segment words of the unit itself or of DS become fixups."""
    import omfw
    a, b = P[key]['obj']
    end = b
    while b > a and code[b-1] == 0: b -= 1     # paragraph padding
    if end % 16 == 0 and b <= end - 16:
        b = end - 15       # zeros reaching into the segment's last paragraph are tail data, not padding (R540)
    m = omfw.Module('%sA' % key)
    data = bytearray(code[a:b])
    cs = m.seg('CODE', 'CODE', 'byte', bytes(data))
    if any(SEG.get(s) == '@Data' for f, s in U[key]['fixups'] if a <= f < b):
        m.seg('DATA', 'DATA', 'word', None, 0)
    for f, s in U[key]['fixups']:
        if not a <= f < b: continue
        if SEG.get(s) == key: cs['fixups'].append((f - a, 'base', 'seg', ('CODE', None)))
        elif SEG.get(s) == '@Data': cs['fixups'].append((f - a, 'base', 'seg', ('DATA', None)))
        else: raise AssertionError((key, hex(f), hex(s)))
    for t, (n, far) in sorted(tails.items()):
        m.pubs.append((n.upper(), 'CODE', t - a))
        # a function routine also gets a procedure alias: raw (inline) callers read al themselves
        if tail_sig(key, t) is not None and (key, t) in TAILFUNC: m.pubs.append((n.upper() + 'P', 'CODE', t - a))
    open('src/%sA.OBJ' % key, 'wb').write(m.bytes())

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
for k in P:
    if P[k].get('obj'):
        for t, (n, far) in tail_labels(k).items(): owner.setdefault(n, k); owner.setdefault(n + "P", k)

DS_CONST_START = 2        # DS:0 holds a word TPC puts before all typed constants
DS_CONST_END = 0x5958      # game typed constants occupy DS[DS_CONST_START, DS_CONST_END)
DS_VAR_START = 0x59A2
DS_VAR_SIZE = int(os.environ.get('VARSIZE', '0x4D52'), 16)  # game vars, from 0x47F4 (refined by diffing)

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

MAIN_LITS = 0x8B           # main's literal pool [0, MAIN_LITS); unit init calls follow
MAIN_BODY = (0x191, 0x431)  # main block after its frame prologue, up to mov sp,bp

def gen_main():
    key = 'M'; u = U[key]
    code = open('out/u/M.bin', 'rb').read()
    o = open('orig/START.bin', 'rb').read()
    ds = o[0xDE20:]
    game = [k for k in UNITS if k not in TPL and k != 'M']
    usel = ['Overlay', 'Dos', 'GAMEDATA'] + list(reversed(game)) + ['LIT']
    for a, b in MAIN_SWAP:
        i, j = usel.index(a), usel.index(b); usel[i], usel[j] = usel[j], usel[i]
    L = ['{ START: main program (generated skeleton) }',
         # the original main was compiled {$O+}: literal args to overlaid/{$O+} callees are copied to temps
         '{$A-,B-,D+,E-,F+,I-,L-,N-,%s,R-,S-,V-}' % ('O+' if os.path.exists('data/main_body.pas') else 'O-'),
         '{$M 16384,0,655360}',
         'program START;', '']
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
    items = lits(code, 0, MAIN_LITS)
    L.append('  if false then begin')
    for t, b in items: L.append('    if LV = %s then;' % pstr(b))
    L.append('    if LV = FS then;')
    L.append('  end;')
    nears = {}
    DSREF.clear()
    L += ['  ' + x for x in body_asm(key, code, MAIN_BODY[0], MAIN_BODY[1], u['fixups'], nears)]
    L.append('end.')
    return L

if __name__ == '__main__':
    os.makedirs('src', exist_ok=True)
    if sys.argv[1:] == ['M']:
        open('src/START.PAS', 'w', newline='\r\n').write('\n'.join(gen_main()) + '\n'); sys.exit()
    keys = sys.argv[1:] or [k for k in UNITS if k not in TPL and k != 'M']
    for k in keys:
        if P[k].get('obj'): print('NOTE %s has an asm tail %X-%X (not generated)' % (k, *P[k]['obj']))
        L = gen_unit(k)
        open('src/%s.PAS' % k, 'w', newline='\r\n').write('\n'.join(L) + '\n')
    print('ok', len(keys))
