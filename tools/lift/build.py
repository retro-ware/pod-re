"""Lift procedures into the sources, compile, verify byte-exactness per procedure, demote failures.

usage: build.py [--units U1,U2] [--max-rounds N]
State: data/lift_status.json  {"KEY:ENTRY": "ok" | "fail: reason"}
"""
import sys, os, json, re, subprocess, struct, collections
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import lift
from lift import PROCS, skel, render
from ir import LiftError
import emit
import prog

ROOT = lift.prog.ROOT
STATUS = os.path.join(ROOT, 'data', 'lift_status.json')


def load_status():
    try:
        return json.load(open(STATUS))
    except Exception:
        return {}


def save_status(st):
    json.dump(st, open(STATUS, 'w'), indent=0, sort_keys=True)


def pkey(pr):
    return '%s:%04X' % (pr.key, pr.entry)


# ---------------- parameter types
def infer_sigs(results):
    """Pascal parameter types for every procedure from lifted call sites and callee bodies."""
    ev = collections.defaultdict(set)       # (proc, param index) -> evidence
    for k, v in lift.arg_evidence().items():
        ev[k] |= v
    for pr, (ctx, em, fr, body, stmts) in results.items():
        for call in calls_in(stmts):
            for i, a in enumerate(call.args):
                ev[(call.target, i)].add(arg_kind(a))
    # 4-byte function results used as pointers
    rptr = set()
    rsigned = set()
    # signed results seen at any call site (cbw / cwd right after the call)
    for k, v in lift.arg_evidence().items():
        pass
    for pr, (ctx, em, fr, body, stmts) in results.items():
        from ir import Assign, Call, Loc, Const, Op
        def f(n):
            if isinstance(n, Assign) and isinstance(n.src, Call) and isinstance(n.dst, Loc) and em.isptr(n.dst):
                rptr.add(n.src.target)
            if isinstance(n, Assign) and isinstance(n.dst, Loc) and n.dst.kind == 'l' and ctx.is_result(n.dst) and pr.result == 'longint':
                if isinstance(n.src, Loc) and em.isptr(n.src) or isinstance(n.src, Const) and False:
                    rptr.add(pr)
            if isinstance(n, Loc) and n.kind == 'deref' and isinstance(n.ptr, Call):
                rptr.add(n.ptr.target)
            if isinstance(n, Op) and n.op in ('sext', 'sext32') and isinstance(n.args[0], Call):
                rsigned.add(n.args[0].target)
        lift.walk(stmts, f)
    sigs = {}
    for pr in list(PROCS.values()) + list(lift.prog.TAILS.values()):
        types = []
        for i, p in enumerate(pr.params):
            if p.copy:
                c = p.copy
                if c['rtl'] == 0xA89:
                    types.append('string' if c['n'] == 255 else 'S%d' % c['n'])
                else:
                    types.append('B%d' % c['n'])
                continue
            pt = getattr(p, 'ptype', None)
            e = ev.get((pr, i), set())
            if p.size == 6:
                types.append('real')
            elif p.size == 4:
                if 'const' in e:
                    types.append('longint')
                else:
                    types.append('pointer' if ('addr' in e or 'les' in p.access or pt == 'pointer') else 'longint')
            elif 'byte' in e or (pt in ('byte', 'shortint')):
                types.append('shortint' if pt == 'shortint' else 'byte')
            else:
                types.append('integer' if pt == 'integer' else 'word')
        res = 'pointer' if (pr.result == 'longint' and pr in rptr) else pr.result
        if pr in rsigned or pr in lift.SIGNED_RESULTS:
            res = {'byte': 'shortint', 'word': 'integer'}.get(res, res)
        sigs[pr] = (types, res)
    # hand-checked parameter types (e.g. a word parameter only tested with a byte set)
    if os.path.exists('data/sig_override.json'):
        for k, ts in json.load(open('data/sig_override.json')).items():
            u, e = k.split(':')
            pr = PROCS.get((u, int(e, 16)))
            if pr in sigs:
                sigs[pr] = (ts, sigs[pr][1])
    return sigs


def arg_kind(a):
    from ir import Addr
    from sim import TempRef
    if isinstance(a, Addr) or (isinstance(a, TempRef) and a.value is None):
        return 'addr'
    s = getattr(a, 'size', None)
    return {1: 'byte', 2: 'word', 4: 'long'}.get(s, 'other')


def calls_in(stmts):
    from ir import Call, If, While, Repeat, Assign, CallS, Op
    out = []

    def ex(e):
        if isinstance(e, Call):
            out.append(e)
        for v in vars(e).values() if hasattr(e, '__dict__') else []:
            if isinstance(v, list):
                for x in v:
                    if hasattr(x, '__dict__'):
                        ex(x)
            elif hasattr(v, '__dict__') and not isinstance(v, lift.prog.Proc):
                ex(v)

    for s in stmts:
        ex(s)
    return out


# ---------------- generation
def generate(results, sigs):
    """Write src/*.PAS with lifted procedures replacing their skeletons."""
    skel.SIGS = {(pr.key, pr.entry): sigs[pr] for pr in sigs}
    skel.STRFUNC = {(pr.key, pr.entry) for pr in PROCS.values() if pr.strfunc}
    skel.LIFTED = {}
    decls = collections.defaultdict(list)
    galias = collections.defaultdict(dict)
    gtypes = collections.defaultdict(dict)
    absmem = collections.defaultdict(dict)
    cuts = set()
    for pr, (ctx, em, fr, body, stmts) in results.items():
        loc = fr.decls
        for f in [lift.FRAMES.get(q) for q in [pr] + ancestors(pr)]:
            if f is not None and getattr(f, 'renames', None):
                rx = re.compile(r'\b(%s)\b' % '|'.join(map(re.escape, f.renames)))
                body = [w for l in body for w in lift.wrapline(rx.sub(lambda m: f.renames[m.group(1)], l))]
        skel.LIFTED[(pr.key, pr.entry)] = {'decl': loc, 'body': body}
        for n, (a, t) in em.globals.items():
            galias[pr.key][n] = (a, t)
            cuts.add(a)
        gtypes[pr.key].update(em.types)
        absmem[pr.key].update(getattr(em, 'absmem', {}))
    for (k, e), (decl, body) in HAND.items():
        skel.LIFTED[(k, e)] = {'decl': decl, 'body': body, 'hand': True}
    # GAMEDATA item cuts so every alias starts on an item
    os.makedirs('data', exist_ok=True)
    old = set()
    if os.path.exists('data/cuts.txt'):
        old = {int(x, 16) for x in open('data/cuts.txt').read().split()}
    allc = sorted(old | {c for c in cuts if 2 <= c < 0xFB76})
    open('data/cuts.txt', 'w').write('\n'.join('%04X' % c for c in allc) + '\n')
    subprocess.run([sys.executable, '-I', 'tools/gendata.py'], check=True, capture_output=True)
    skel.DSITEMS = None
    for key in set(galias) | set(gtypes) | set(absmem):
        L = []
        if gtypes[key]:
            L.append('type')
            for t, d in type_order(gtypes[key]):
                L += lift.wrapline('  %s = %s;' % (t, d))
        if galias[key] or absmem[key]:
            L.append('var')
        for n, d in sorted(absmem[key].items()):
            L.append('  %s: %s;' % (n, d))
        for n, (a, t) in sorted(galias[key].items()):
            item, k = skel.dsname(a)
            if k:
                raise RuntimeError('alias %04X not on an item' % a)
            L.append('  %s: %s absolute %s;' % (n, t, item))
        decls[key] = L
    skel.LIFT_DECLS = decls
    for k in [k for k in skel.UNITS if k not in skel.TPL and k != 'M']:
        L = skel.gen_unit(k)
        open('src/%s.PAS' % k, 'w', newline='\r\n').write('\n'.join(L) + '\n')
    open('src/GAME.PAS', 'w', newline='\r\n').write('\n'.join(skel.gen_main()) + '\n')
    # base variant: same interfaces, skeleton bodies (always compiles) -> TPUs for per-unit error hunting
    keep = skel.LIFTED, skel.SKEL_FRAMES, skel.DEAD_EXTRA
    skel.LIFTED, skel.SKEL_FRAMES = {}, {}
    # frame fillers belong to lifted bodies (they may use filler variables the skeleton doesn't declare)
    skel.DEAD_EXTRA = {k_: v for k_, v in skel.DEAD_EXTRA.items() if not getattr(v, 'auto', False)}
    os.makedirs('build/src_base', exist_ok=True)
    for k in [k for k in skel.UNITS if k not in skel.TPL and k != 'M']:
        L = skel.gen_unit(k)
        open('build/src_base/%s.PAS' % k, 'w', newline='\r\n').write('\n'.join(L) + '\n')
    skel.LIFTED, skel.SKEL_FRAMES, skel.DEAD_EXTRA = keep


SIZE = {'byte': 1, 'shortint': 1, 'char': 1, 'boolean': 1, 'word': 2, 'integer': 2, 'longint': 4, 'pointer': 4, 'real': 6,
        'file': 128, 'text': 256, 'SearchRec': 43, 'Registers': 20}


def type_order(types):
    """Type declarations with every referenced type declared first (pointer types last)."""
    names = sorted(types)
    done, out = set(), []
    def visit(n, stack=()):
        if n in done or n in stack:
            return
        d = types[n]
        if not d.startswith('^'):
            for m in re.findall(r'\b\w+\b', d):
                if m in types and m != n:
                    visit(m, stack + (n,))
        done.add(n)
        out.append((n, d))
    for n in names:
        if not types[n].startswith('^'):
            visit(n)
    out += [(n, types[n]) for n in names if types[n].startswith('^')]
    return out


def ancestors(pr):
    out = []
    while getattr(pr, 'parent', None) is not None and pr.nested:
        pr = pr.parent
        out.append(pr)
    return out


def frame_decls(pr, fr):
    """var section placing referenced locals at their exact bp offsets (TP allocates downwards in order)."""
    rs = {'byte': 1, 'word': 2, 'longint': 4, 'real': 6, None: 0}[pr.result]
    top = rs + sum((c['n'] + 1) if c['rtl'] == 0xA89 else c['n'] for c in pr.p.get('copies', []))
    L = pr.p['locals'] if getattr(fr.ctx, 'full_frame', False) else fr.ctx.locals_end(pr)
    fr.renames = {}
    refs = [(off, t, n) for (off, t), n in fr.refs.items()]
    # an indexed byte array based on a for-loop temp slot is really array[1..] starting one byte higher
    tslots = {getattr(t_, 'off', None) for t_ in getattr(fr.ctx, 'temps_for', [])}
    refs = [(off + 1, 'ARRAY1 byte', n) if t == 'ARRAY byte' and off in tslots and
            any(o_ == off + 1 for o_, t2, n2 in refs) else (off, t, n) for off, t, n in refs]
    if refs:
        # a 'temp' that overlaps referenced locals was really a local: the locals reach at least that deep
        L = min(max(L, max(-off for off, t, n in refs)), pr.p['locals'])
    if not refs:
        fv = getattr(fr.ctx, 'filler_vars', [])
        base = [] if L <= top else ['  _f1: array[1..%d] of byte;' % (L - top)]
        return ['var'] + base + fv if base or fv else []
    starts = sorted({off for off, t, n in refs})
    sized, views = [], []
    for off, t, n in refs:
        m = re.match(r'string(?:\[(\d+)\])?$', t)
        if m and off < 0:
            ln = int(m.group(1) or 255)
            if not m.group(1) and ln + 1 > -off - top:
                # read-only use of a shorter string variable: cap it at the frame top
                ln = -off - top - 1
                if ln < 1:
                    raise LiftError('string local above frame')
                t = 'string[%d]' % ln
            sized.append((off, ln + 1, t, n))
        elif t in SIZE:
            sized.append((off, SIZE[t], t, n))
        elif t.startswith('ARRAY ') or t.startswith('ARRAY1 '):
            low = 1 if t.startswith('ARRAY1 ') else 0
            el = t.split(' ', 1)[1]
            m2 = re.match(r'string\[(\d+)\]$', el)
            m3 = re.match(r'E(\d+)_', el)
            m4 = re.match(r'AS(\d+)_\d+$', el) or re.match(r'X(\d+)$', el)
            esz = int(m2.group(1)) + 1 if m2 else (int(m3.group(1)) if m3 else (int(m4.group(1)) if m4 else SIZE[el]))
            if off < -L:
                # base below the frame: the array's low bound is above 0 (array[1..] of string at [bp+di-0x818])
                k_ = (-L - off + esz - 1) // esz
                if off + k_ * esz > -top:
                    raise LiftError('array base below frame')
                off += k_ * esz; low += k_
            above = [o for o in starts if o > off]
            lim = min(above) if above else -top
            cnt = max(1, (lim - off) // esz)
            sized.append((off, cnt * esz, 'array[%d..%d] of %s' % (low, low + cnt - 1, el), n))
        else:
            views.append((off, t, n))
    # views (types without a layout size) need a real variable at their start
    for off, t, n in views:
        if not any(x[0] == off for x in sized):
            sized.append((off, 1, 'byte', '_v%d' % -off))
    # cluster overlapping variables
    sized.sort(key=lambda x: (x[0], -x[1]))
    clusters = []
    for v in sized:
        if clusters and v[0] < clusters[-1][1]:
            clusters[-1][0].append(v)
            clusters[-1][1] = max(clusters[-1][1], v[0] + v[1])
        else:
            clusters.append([[v], v[0] + v[1]])
    placed, aliases = [], []
    for grp, hi in clusters:
        lo = grp[0][0]
        if all(x[0] == lo for x in grp):
            base = max(grp, key=lambda x: x[1])
            placed.append(base)
            for x in grp:
                if x is not base:
                    aliases.append((x[3], x[2], base[3]))
            continue
        cn = 'c%d' % -lo
        fields = []
        for i, (off, sz, t, n) in enumerate(grp):
            pad = '_p%d: array[1..%d] of byte; ' % (i, off - lo) if off > lo else ''
            fields.append('%d: (%s%s: %s)' % (i, pad, n, t))
            fr.renames[n] = cn + '.' + n
        placed.append((lo, hi - lo, fields, cn))
    for off, t, n in views:
        base = [x for x in sized if x[0] == off][0]
        b = fr.renames.get(base[3], base[3])
        if '.' in b:
            # view of a variable inside an overlap record: one more variant
            cn = b.split('.')[0]
            pl = [x for x in placed if x[3] == cn][0]
            i = len(pl[2])
            pad = '_p%d: array[1..%d] of byte; ' % (i, off - pl[0]) if off > pl[0] else ''
            pl[2].append('%d: (%s%s: %s)' % (i, pad, n, t))
            fr.renames[n] = cn + '.' + n
            continue
        aliases.append((n, t, b))
    placed = [(o, sz, 'record case byte of %s end' % '; '.join(t) if isinstance(t, list) else t, n)
              for o, sz, t, n in placed]
    placed.sort(key=lambda x: -x[0])
    out = ['var']
    cur = -top
    for n, t, b in list(aliases):
        if '.' in b:
            raise LiftError('alias of overlapped local')
    fill = 0
    for off, sz, t, n in placed:
        if off + sz > cur:
            raise LiftError('local overlap at %d' % off)
        gap = cur - (off + sz)
        if gap:
            fill += 1
            out.append('  _f%d: array[1..%d] of byte;' % (fill, gap))
        out.append('  %s: %s;' % (n, t))
        cur = off
    gap = cur - (-L)
    if gap > 0:
        fill += 1
        out.append('  _f%d: array[1..%d] of byte;' % (fill, gap))
    elif gap < 0:
        raise LiftError('locals below frame (%d < %d)' % (cur, -L))
    for n, t, base in aliases:
        out.append('  %s: %s absolute %s;' % (n, t, base))
    out += getattr(fr.ctx, 'filler_vars', [])
    if out == ['var']:
        return []
    return [w for l in out for w in lift.wrapline(l)]


# ---------------- compile + verify
def run_dos(d, bat):
    subprocess.run(['tools/dosrun.sh', d, bat], capture_output=True)


def unit_errors():
    """Compile the base (skeleton bodies) once, then every unit's lifted source alone against the base TPUs,
    in parallel. Returns {unit: (line, message)} for units with a compile error."""
    import shutil, glob
    from concurrent.futures import ThreadPoolExecutor
    shutil.rmtree('build/base', ignore_errors=True)
    os.makedirs('build/base')
    for f in glob.glob('build/src_base/*.PAS') + ['src/LIT.PAS', 'src/GAMEDATA.PAS', 'src/GAME.PAS']:
        t = open(f, encoding='latin-1', newline='').read().replace('{$A-,B-,D+', '{$A-,B-,D-')
        open('build/base/' + os.path.basename(f), 'w', encoding='latin-1', newline='').write(t)
    for f in glob.glob('src/*.OBJ'):
        shutil.copy(f, 'build/base/')
    open('build/base/B.BAT', 'w').write('TPC /B /L GAME.PAS > OUT.TXT\r\n')
    run_dos('build/base', 'B.BAT')
    out = open('build/base/OUT.TXT', encoding='latin-1').read().replace('\r', '\n')
    if 'Error' in out:
        raise SystemExit('base build failed: ' + out[-400:])
    units = [k for k in skel.UNITS if k not in skel.TPL and k != 'M' and open('src/%s.PAS' % k).read() !=
             open('build/src_base/%s.PAS' % k).read()]
    def one(k):
        d = 'build/u/%s' % k
        shutil.rmtree(d, ignore_errors=True)
        os.makedirs(d)
        for f in glob.glob('build/base/*.TPU') + glob.glob('src/*.OBJ'):
            shutil.copy(f, d)
        shutil.copy('src/%s.PAS' % k, d)
        open(d + '/B.BAT', 'w').write('TPC %s.PAS > OUT.TXT\r\n' % k)
        run_dos(d, 'B.BAT')
        o = open(d + '/OUT.TXT', encoding='latin-1').read().replace('\r', '\n')
        m = re.search(r'(\w+)\.PAS\((\d+)\): Error (\d+): ([^\n]*)', o)
        return k, (m.group(1), int(m.group(2)), m.group(4)) if m else None
    errs = {}
    with ThreadPoolExecutor(8) as ex:
        for k, e in ex.map(one, units):
            if e:
                errs[k] = e
    return errs


def compile_all():
    r = subprocess.run(['tools/build.sh'], capture_output=True, text=True)
    out = open('build/full/OUT.TXT', encoding='latin-1').read().replace('\r', '\n') if os.path.exists('build/full/OUT.TXT') else ''
    m = re.search(r'(\w+)\.PAS\((\d+)\): Error (\d+): ([^\n]*)', out)
    if m:
        return ('error', m.group(1), int(m.group(2)), m.group(4))
    if not os.path.exists('build/full/GAME.EXE'):
        return ('error', None, 0, out[-300:])
    return ('ok',)


def stmt_mark(unit, line):
    """Innermost {@a-b} statement marker at or above the line, within the same procedure."""
    lines = open('src/%s.PAS' % unit, encoding='latin-1').read().split('\n')
    for i in range(min(line, len(lines)) - 1, -1, -1):
        m = re.match(r'\s*\{@([0-9A-F]{4})-([0-9A-F]{4})\}', lines[i])
        if m:
            return int(m.group(1), 16), int(m.group(2), 16)
        if re.match(r'\s*\{ [0-9A-F]{4} \}', lines[i]):
            return None
    return None


def proc_at_line(unit, line):
    lines = open('src/%s.PAS' % unit, encoding='latin-1').read().split('\n')
    for i in range(min(line, len(lines)) - 1, -1, -1):
        m = re.match(r'\s*\{ ([0-9A-F]{4}) \}', lines[i])
        if m:
            return PROCS.get((unit, int(m.group(1), 16)))
    return None


def built_units():
    sys.argv = ['cmp.py']
    g = {}
    src = open('tools/cmp.py').read().split('tot = 0')[0]
    exec(compile(src, 'cmp.py', 'exec'), g)
    return g['built']


MAPLINES = None


def map_lines():
    """{unit: sorted [(line, offset)]} from the $D+ detailed map."""
    global MAPLINES
    txt = open('build/full/GAME.MAP', encoding='latin-1').read().replace('\r', '\n')
    out = {}
    for m in re.finditer(r'Line numbers for (\w+)\(\w+\.PAS\) segment \w+\s*\n(.*?)(?=\n\s*\n\s*(?:Line numbers|Program entry))', txt, re.S):
        out[m.group(1)] = sorted((int(a), int(c, 16)) for a, b, c in re.findall(r'(\d+) ([0-9A-F]{4}):([0-9A-F]{4})', m.group(2)))
    MAPLINES = out
    return out


def locate(key, built):
    """Map each procedure entry to its offset delta in the build: {entry: delta}, from map line numbers."""
    ml = (MAPLINES or map_lines()).get(key)
    if ml:
        lines = open('src/%s.PAS' % key, encoding='latin-1').read().split('\n')
        pos = {}
        import bisect
        for i, l in enumerate(lines):
            m = re.match(r'\s*\{ ([0-9A-F]{4}) \}', l)
            if m:
                e = int(m.group(1), 16)
                # code starts at the body's own 'begin' (nested procedures come first)
                k = i + 1
                ind = len(lines[k]) - len(lines[k].lstrip()) if k < len(lines) else 0
                while k < len(lines) and not (lines[k].strip() == 'begin' and len(lines[k]) - len(lines[k].lstrip()) == ind):
                    k += 1
                k = i if k >= len(lines) else k
                j = bisect.bisect_right(ml, (k if k > i else i + 1, 1 << 30))
                pos[e] = ml[j][1] - e if j < len(ml) else None
        return pos
    return locate_search(key, built)


def locate_search(key, built):
    """Map each procedure's lit start to its position in the build: {entry: delta}."""
    oc = lift.code_of(key)
    bc = built[key][0]
    order = sorted((p for p in skel.P[key]['procs'] if 'body' in p), key=lambda p: p['entry'])
    pos = {}
    delta = 0
    for p in order:
        want = oc[p['lit']:p['entry'] + 3]
        at = p['lit'] + delta
        if bc[at:at + len(want)] != want:
            hits = []
            i = bc.find(want)
            while i >= 0 and len(hits) < 50:
                hits.append(i)
                i = bc.find(want, i + 1)
            if not hits:
                pos[p['entry']] = None
                continue
            at = min(hits, key=lambda h: abs(h - at))
            delta = at - p['lit']
        pos[p['entry']] = delta
    return pos


def verify(results):
    """Per-procedure byte comparison of lifted procs. Returns {proc: reason} for mismatches."""
    global MAPLINES
    MAPLINES = None
    built = built_units()
    bad = {}
    by_unit = collections.defaultdict(list)
    for pr in results:
        by_unit[pr.key].append(pr)
    for key, prs in by_unit.items():
        oc = lift.code_of(key)
        bc = built[key][0]
        pos = locate(key, built)
        order = sorted((p for p in skel.P[key]['procs'] if 'body' in p), key=lambda p: p['entry'])
        nxt = {order[i]['entry']: order[i + 1]['entry'] for i in range(len(order) - 1)}
        for pr in prs:
            d = pos.get(pr.entry)
            if d is None:
                bad[pr] = 'pool/prologue not found'
                continue
            n = nxt.get(pr.entry)
            sized = n is not None and pos.get(n) is not None and pos[n] != d
            a, b = pr.entry, pr.p['end']
            ob = bytearray(oc[a:b]); bb = bytearray(bc[a + d:b + d + 64])
            mask_fixups(key, ob, bb, a, d, built)
            normalize(key, ob, bb, a, d, pos)
            if sized or ob != bb[:len(ob)]:
                off = first_diff(ob, bb)
                bad[pr] = ('size differs by %d' % (pos[n] - d)) if sized else 'bytes differ at +%X' % off
                DIFFAT[pr] = a + d + off      # build offset of the first differing instruction
    return bad


DIFFAT = {}


def first_diff(ob, bb):
    """Offset of the first differing instruction, ignoring jump displacements."""
    from sim import md
    xs = list(md.disasm(bytes(ob), 0))
    ys = list(md.disasm(bytes(bb), 0))
    for x, y in zip(xs, ys):
        if x.mnemonic != y.mnemonic:
            return x.address
        if x.mnemonic.startswith('j') or x.mnemonic == 'loop':
            continue
        if ob[x.address:x.address + x.size] != bb[y.address:y.address + y.size]:
            return x.address
    return min(len(xs), len(ys)) and xs[min(len(xs), len(ys)) - 1].address


def line_at(unit, off):
    ml = (MAPLINES or map_lines()).get(unit, [])
    best = None
    for ln, o in ml:
        if o <= off and (best is None or o >= best[1]):
            best = (ln, o)
    return best[0] if best else None


def normalize(key, ob, bb, a, d, pos):
    """Undo the layout shift d in the build copy: literal addresses (mov di,X; push cs) and near call targets."""
    import struct
    from sim import md
    inv = {}
    for e, dd in pos.items():
        if dd is not None:
            inv[e + dd] = e
    for ins in md.disasm(bytes(bb), a):
        i = ins.address - a
        if ins.mnemonic == 'mov' and bb[i] == 0xbf and i + 3 < len(bb) and bb[i + 3] == 0x0e:
            v = struct.unpack('<H', bb[i+1:i+3])[0]
            bb[i+1:i+3] = struct.pack('<H', (v - d) & 0xFFFF)
        elif ins.mnemonic == 'call' and bb[i] == 0xe8 and ins.size == 3:
            t_build = (ins.address + d + 3 + struct.unpack('<h', bb[i+1:i+3])[0]) & 0xFFFF
            t = inv.get(t_build)
            if t is not None:
                bb[i+1:i+3] = struct.pack('<h', t - (ins.address + 3))
        elif ins.mnemonic == 'mov' and bb[i] == 0xb8 and i + 3 < len(bb) and bb[i + 3] == 0xba:
            pass


def mask_fixups(key, ob, bb, a, delta, built):
    """Blank far-call offset+segment words and segment fixup words (targets differ only by layout)."""
    for f, sg in skel.U[key]['fixups']:
        i = f - a
        if not 0 <= i < len(ob):
            continue
        lo = i - 2 if i >= 3 and ob[i - 3] == 0x9a else i
        for j in range(lo, i + 2):
            if 0 <= j < len(ob):
                ob[j] = 0
            if 0 <= j < len(bb):
                bb[j] = 0


def live_temps(ctx):
    rr = getattr(ctx, 'raw_ranges', [])
    ts = [t for t in ctx.temps if t.value is not None and not any(a <= getattr(t, 'at', -1) < b for a, b in rr)]
    tf = [t for t in ctx.temps_for if not any(a <= getattr(t, 'at', -1) < b for a, b in rr)
          or t.off in getattr(ctx, 'live_for', set())]
    return bool(ts or tf)


def filler(pr, ctx, n):
    r = filler1(pr, ctx, n)
    return r if r or n <= 0 else filler_combo(pr, ctx, n)


def filler_combo(pr, ctx, n):
    import itertools
    """n = 256*k + 32*m + literal copies: one LMa_b call with k FS / literal string args and m [LB] set args."""
    import itertools
    oplus = prog.is_oplus(pr)
    lits = {}
    if oplus:
        for t, b in ctx.lits.values():
            if t == 's' and all(32 <= c < 127 for c in b):
                lits.setdefault(len(b) + 1, b)
    sizes = sorted(lits)
    # for-loop final values (word 2 / byte 1) live in temps around the loop body
    # control variables must be locals: use the procedure's own ordinal value parameters
    sig = skel.SIGS.get((pr.key, pr.entry))
    pl = chr(ord('a') + skel.depth(pr.key, pr.entry))
    ords = []
    if sig:
        for i, t in enumerate(sig[0]):
            if t in ('byte', 'shortint', 'char', 'boolean'):
                ords.append(('%s%d' % (pl, i), 1))
            elif t in ('word', 'integer'):
                ords.append(('%s%d' % (pl, i), 2))
    plain = [i for i, p_ in enumerate(pr.params) if p_.size >= 2]
    if plain:
        # loop control variables as absolute aliases of a parameter (no new frame bytes)
        i_ = plain[0]
        ords = ords + [('_fb', 1), ('_fw', 2)]
        ctx.filler_vars = ['  _fb: byte absolute %s%d;' % (pl, i_), '  _fw: word absolute %s%d;' % (pl, i_)]
    wraps = [('', 0), ('with LPR^ do ', 4), ('with LPR^ do with LPR^ do ', 8)]
    for v, sz in ords:
        wraps.append(('for %s := %s to %s do ' % (v, v, v), sz))
    for (v1, s1), (v2, s2) in itertools.combinations(ords, 2):
        wraps.append(('for %s := %s to %s do for %s := %s to %s do ' % (v1, v1, v1, v2, v2, v2), s1 + s2))
    for v, sz in ords:
        wraps.append(('with LPR^ do for %s := %s to %s do ' % (v, v, v), 4 + sz))
        wraps.append(('with LPR^ do with LPR^ do for %s := %s to %s do ' % (v, v, v), 8 + sz))
    for (v1, s1), (v2, s2) in itertools.combinations(ords, 2):
        wraps.append(('with LPR^ do for %s := %s to %s do for %s := %s to %s do ' % (v1, v1, v1, v2, v2, v2), 4 + s1 + s2))
    for wrap, extra in wraps:
        if not wrap and extra == 0 and n == 0:
            continue
        r = combo_call(n - extra, lits, sizes)
        if r:
            return '\n'.join(lift.wrapline(wrap + r, 90))
    return None


def combo_call(n, lits, sizes):
    import itertools
    if n == 0:
        return ';'
    if n < 0:
        return None
    for k in range(0, min(4, n // 256) + 1):
        for m in range(0, 9):
            rest = n - 256 * k - 32 * m
            if rest < 0:
                break
            for nl in range(0, 5 - k):
                for combo in itertools.combinations_with_replacement(sizes, nl):
                    if sum(combo) != rest:
                        continue
                    args = ['FS'] * k + ["'" + lits[c].decode('latin-1').replace("'", "''") + "'" for c in combo]
                    if not args and not m:
                        return None
                    args += ['[LB]'] * m
                    return 'LM%d_%d(%s);' % (k + nl, m, ', '.join(args))
    return None


def filler1(pr, ctx, n):
    """Dead statement whose temps reserve n bytes (the temps of statements kept as raw bytes)."""
    if n <= 0:
        return None
    lits = [b for t, b in ctx.lits.values() if t == 's']
    oplus = prog.is_oplus(pr)
    k, r = divmod(n, 256)
    parts = ['FS'] * k
    if r:
        if not oplus:
            return None
        cand = [b for b in lits if ((len(b) + 1 + 1) & ~1) == r]
        if not cand:
            return None
        lit = "'" + cand[0].decode('latin-1').replace("'", "''") + "'"
        if any(ord(c) < 32 or ord(c) > 126 for c in cand[0].decode('latin-1')):
            return None
        if k == 0:
            return 'LP1(%s);' % lit
        if k == 1:
            return 'if F2(FS, %s) then;' % lit
        return None
    if k == 1:
        return 'if LV = FS then;'
    if k == 2:
        return 'if FS = FS then;'
    return None


class AutoStr(str):
    auto = True


def produce(st):
    """Render all non-failed procedures (two passes so arguments follow the final signatures) and write sources."""
    lift.FRAMES.clear()
    lift.FORCE_RAW.clear()
    lift.KEEP_ONLY.clear()
    for k, v in st.items():
        if k.startswith('min:'):
            _, key, e = k.split(':')
            lift.KEEP_ONLY[(key, int(e, 16))] = {int(x, 16) for x in v}
        if k.startswith('raw:'):
            _, key, e = k.split(':')
            lift.FORCE_RAW[(key, int(e, 16))] = {tuple(int(x, 16) for x in r.split('-')) for r in v}
    results = {}
    for pr in PROCS.values():
        k = pkey(pr)
        if st.get(k, 'ok').startswith('fail') or (pr.key, pr.entry) in HAND:
            continue
        try:
            ctx, em, fr, body = render(pr)
            fr.decls = frame_decls(pr, fr)
            results[pr] = (ctx, em, fr, body, lift.LAST_STMTS)
        except LiftError as ex:
            st[k] = 'fail: ' + str(ex)[:80]
        except Exception as ex:
            st[k] = 'fail: crash ' + type(ex).__name__ + ' ' + str(ex)[:60]
    sigs = infer_sigs(results)
    skel.SIGS = {(p.key, p.entry): sigs[p] for p in sigs}
    # string functions returning string[n]: their result type (a shared S<n> in GAMEDATA)
    if emit.STRRES_SEEN:
        old_ = {}
        if os.path.exists('data/strfunc_types.json'):
            old_ = json.load(open('data/strfunc_types.json'))
        new_ = dict(old_)
        new_.update({'%s:%04X' % k: n for k, n in emit.STRRES_SEEN.items()})
        if new_ != old_:
            json.dump(new_, open('data/strfunc_types.json', 'w'), indent=0)
            subprocess.run([sys.executable, '-I', 'tools/gendata.py'], check=True, capture_output=True)
    if os.path.exists('data/strfunc_types.json'):
        skel.STRRES = {(k.split(':')[0], int(k.split(':')[1], 16)): n for k, n in json.load(open('data/strfunc_types.json')).items()}
    lift.FRAMES.clear()
    # children first, so a lifted parent's frame includes the names its nested procedures use
    for pr in sorted(results, key=lambda q: -skel.depth(q.key, q.entry)):
        try:
            ctx, em, fr, body = render(pr)
            results[pr] = (ctx, em, fr, body, lift.LAST_STMTS)
        except LiftError as ex:
            st[pkey(pr)] = 'fail: ' + str(ex)[:80]
            del results[pr]
    skel.SKEL_FRAMES = {}
    skel.DEAD_EXTRA = {k: v for k, v in skel.DEAD_EXTRA.items() if not getattr(v, 'auto', False)}
    for pr in list(results):
        ctx = results[pr][0]
        if ctx.raws and not pr.init:
            n = pr.p['locals'] - ctx.locals_end(pr)
            line = filler(pr, ctx, n)
            if line:
                skel.DEAD_EXTRA[(pr.key, pr.entry)] = AutoStr(line)
            elif n > 0 and not live_temps(ctx):
                # no Pascal statement uses temporaries: the locals may simply cover the whole frame
                ctx.full_frame = True
    for pr in list(results):
        try:
            results[pr][2].decls = frame_decls(pr, lift.FRAMES[pr])
        except LiftError as ex:
            st[pkey(pr)] = 'fail: ' + str(ex)[:80]
            del results[pr]
    for pr, fr in lift.FRAMES.items():
        if pr not in results and fr.refs:
            try:
                skel.SKEL_FRAMES[(pr.key, pr.entry)] = frame_decls(pr, fr)
            except LiftError as ex:
                raise SystemExit('skeleton frame for %r: %s' % (pr, ex))
    generate(results, sigs)
    lift.save_merges()
    return results


STRIKES = {}     # verify mismatches per procedure in this run


def load_hand():
    """data/hand/KEY_ENTRY.pas: hand-written procedures (declarations, a line '{BODY}', then begin..end;)."""
    out = {}
    import glob
    for f in sorted(glob.glob(os.path.join(ROOT, 'data', 'hand', '*.pas'))):
        k, e = os.path.basename(f)[:-4].split('_')
        L = open(f).read().rstrip('\n').split('\n')
        i = L.index('{BODY}')
        out[(k, int(e, 16))] = (L[:i], L[i + 1:])
    return out


HAND = load_hand()


def sys_calls(pr):
    """Offsets of far calls into System in a procedure body."""
    c = lift.code_of(pr.key)
    a, b = pr.p['body']
    return sorted(f - 3 for f, sg in skel.U[pr.key]['fixups'] if a < f < b and sg == 0x825 and c[f - 3] == 0x9A)


def main():
    st = load_status()
    if '--gen' in sys.argv:
        results = produce(st)
        print('generated', len(results))
        return
    rounds = 0
    while True:
        rounds += 1
        results = produce(st)
        errs = unit_errors()
        if errs:
            n = 0
            for k, (unit, line, msg) in errs.items():
                pr = proc_at_line(unit, line)
                mk = stmt_mark(unit, line)
                if mk:
                    cand = [q for q in results if q.key == unit and q.entry <= mk[0] < q.p['end']]
                    if cand:
                        pr = max(cand, key=lambda q: q.entry)
                if pr is None or pr not in results:
                    print('unattributed error', unit, line, msg)
                    continue
                rk = 'raw:%s:%04X' % (pr.key, pr.entry)
                if mk and '%04X-%04X' % mk not in st.get(rk, []):
                    st.setdefault(rk, []).append('%04X-%04X' % mk)
                else:
                    st[pkey(pr)] = 'fail: compile ' + msg
                n += 1
            save_status(st)
            print('round %d: %d unit errors' % (rounds, n), flush=True)
            if n:
                continue
        r = compile_all()
        if r[0] == 'error':
            unit, line, msg = r[1], r[2], r[3]
            pr = proc_at_line(unit, line) if unit else None
            ctxl = open('build/full/OUT.TXT', encoding='latin-1').read().replace('\r', '\n').strip().split('\n')[-3:]
            print('round %d: compile error %s(%d): %s -> %s | %s' % (rounds, unit, line, msg, pr, ctxl[0].strip()[:90]))
            if pr is None or pr not in results:
                save_status(st)
                raise SystemExit('cannot attribute compile error')
            mk = stmt_mark(unit, line)
            rk = 'raw:%s:%04X' % (pr.key, pr.entry)
            if mk and '%04X-%04X' % mk not in st.get(rk, []):
                st.setdefault(rk, []).append('%04X-%04X' % mk)
            else:
                st[pkey(pr)] = 'fail: compile ' + msg + ' | ' + ctxl[0].strip()[:60]
            save_status(st)
            continue
        DIFFAT.clear()
        bad = verify(results)
        for pr, why in bad.items():
            ln = line_at(pr.key, DIFFAT[pr]) if pr in DIFFAT else None
            mk = stmt_mark(pr.key, ln) if ln else None
            rk = 'raw:%s:%04X' % (pr.key, pr.entry)
            STRIKES[pr] = STRIKES.get(pr, 0) + 1
            if mk and pr.entry <= mk[0] < pr.p['end'] and '%04X-%04X' % mk not in st.get(rk, []) and STRIKES[pr] <= 4:
                st.setdefault(rk, []).append('%04X-%04X' % mk)
                continue
            mk_ = 'min:' + pkey(pr)
            if mk_ not in st:
                # keep only the statements with System calls as Pascal (their relocations need real code)
                sc = sys_calls(pr)
                if sc:
                    st[mk_] = ['%04X' % a for a in sc]
                    st.pop('raw:' + pkey(pr), None)
                    STRIKES[pr] = 0
                    continue
            st[pkey(pr)] = 'fail: verify ' + why
        for pr in results:
            if pr not in bad:
                st[pkey(pr)] = 'ok'
        save_status(st)
        print('round %d: lifted %d, mismatches %d' % (rounds, len(results), len(bad)), flush=True)
        if not bad:
            break
    print('ok procedures:', sum(1 for v in st.values() if v == 'ok'))
    print('raw statement ranges:', sum(len(v) for k, v in st.items() if k.startswith('raw:')))


if __name__ == '__main__':
    main()
