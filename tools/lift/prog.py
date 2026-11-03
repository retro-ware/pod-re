"""Program-wide context for the lifter: units, procedures, names, signatures, call resolution."""
import json, os, re, struct, sys, collections
from capstone import x86

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.abspath(os.path.join(HERE, '..', '..'))
sys.path.insert(0, os.path.join(ROOT, 'tools'))
os.chdir(ROOT)
import skel                      # names, literal parsing, unit data
from sim import md, R, decode
from ir import LiftError

U = skel.U
P = skel.P
SEG = skel.SEG

# System RTL entry points (offset in System) -> name
RTL = {}
for l in open('names.tsv'):
    k, off, kind, n = l.rstrip('\n').split('\t')
    if k == 'System':
        RTL[int(off, 16)] = n


class Param:
    def __init__(self, off, size):
        self.off, self.size = off, size
        self.access = set()      # sizes / 'les' / 'copy'
        self.copy = None         # value-param copy info
        self.kind = None         # 'var' (address pushed), 'val'
        self.signed = None

    def __repr__(self):
        return 'Param(%d,%d,%s,%s)' % (self.off, self.size, sorted(map(str, self.access)), self.kind)


class Proc:
    def __init__(self, key, p):
        self.key, self.p = key, p
        self.entry = p['entry']
        self.name = skel.NAME.get((key, p['entry']))
        self.far = p.get('far')
        self.retn = p.get('retn', 0)
        self.init = U[key].get('init') == p['entry'] and key != 'M'
        self.nested = False
        self.callers = []
        self.params = []
        self.strfunc = False
        self.result = p.get('result')

    @property
    def base(self):
        return 6 if self.far else 4

    def __repr__(self):
        return 'Proc(%s:%04X %s)' % (self.key, self.entry, self.name)


PROCS = {}
for k, v in P.items():
    for p in v['procs']:
        if 'body' in p:
            PROCS[(k, p['entry'])] = Proc(k, p)


def code_of(key, _cache={}):
    if key not in _cache:
        c = bytearray(open('out/u/%s.bin' % key, 'rb').read())
        # bytes the shipped game patched after linking (jcc -> jmp): lift and verify the compiler's original byte
        pp = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', '..', 'data', 'unit_patches.json')
        if os.path.exists(pp):
            for off, orig, shipped in json.load(open(pp)).get(key, []):
                assert c[off] == int(shipped, 16), 'unit patch %s %04X' % (key, off)
                c[off] = int(orig, 16)
        _cache[key] = bytes(c)
    return _cache[key]


TAILPROCS = {}
def tail_proc(k, ofs):
    """A far routine in a unit's asm tail, declared external with word/pointer params (skel.tail_sig)."""
    if (k, ofs) in TAILPROCS: return TAILPROCS[(k, ofs)]
    lab = skel.tail_labels(k).get(ofs)
    sg = skel.tail_sig(k, ofs) if lab else None
    pr = None
    if sg is not None and bool(lab[1]) == ((k, ofs) not in skel.TAILNEAR):
        pr = Proc(k, {'entry': ofs, 'far': bool(lab[1]), 'retn': sum(sg), 'result': skel.TAILFUNC.get((k, ofs))})
        pr.name = lab[0]
        pr.tail = True
        o = 6 if lab[1] else 4; sl = []
        for j, z in enumerate(reversed(sg)):
            t = skel.slot_t(k, ofs, z, len(sg) - 1 - j); q = Param(o, z); q.kind = 'var' if t == 'var' else 'val'; q.ptype = t; sl.append(q); o += z
        pr.params = list(reversed(sl))
        pr.link = None
    TAILPROCS[(k, ofs)] = pr
    return pr


def far_target(key, at):
    """Resolve the far call at offset `at` (9A) in unit key -> ('proc', Proc) | ('rtl', name) | ('tpl', name)."""
    code = code_of(key)
    fix = {f: s for f, s in U[key]['fixups']}
    seg = fix.get(at + 3)
    if seg is None:
        raise LiftError('far call without fixup')
    ofs = struct.unpack('<H', code[at+1:at+3])[0]
    k = SEG.get(seg)
    if k == 'System':
        return ('rtl', RTL.get(ofs, 'rtl_%04X' % ofs), ofs)
    if k in ('Crt', 'Dos', 'Overlay'):
        return ('tpl', skel.TPLNAMES[(k, ofs)], None)
    if 'entries' in U[k]:
        ofs = U[k]['entries'][(ofs - 0x20) // 5]
    p = PROCS.get((k, ofs))
    if p is None:
        p = tail_proc(k, ofs)
    if p is None:
        raise LiftError('far target %s:%04X' % (k, ofs))
    return ('proc', p, None)


MERGE = set()
if os.path.exists('data/param_merge.json'):
    MERGE = {tuple(x) for x in json.load(open('data/param_merge.json'))}
MERGE_REQ = set()
UNMERGE = set()
NOMERGE = set()      # slots callers pass as two separate words: never merge
if os.path.exists('data/param_nomerge.json'):
    NOMERGE = {tuple(x) for x in json.load(open('data/param_nomerge.json'))}
MERGE -= NOMERGE


def analyse():
    """Signatures: nested procs, parameter slots and access sizes."""
    # nested: callers push bp before the near call
    for (k, e), pr in PROCS.items():
        code = code_of(k)
        a, b = pr.p['body']
        L = list(md.disasm(code[a:b], a))
        for j, ins in enumerate(L):
            if ins.mnemonic == 'call' and ins.operands[0].type == x86.X86_OP_IMM:
                t = ins.operands[0].imm
                callee = PROCS.get((k, t))
                if callee is None:
                    continue
                callee.callers.append((k, ins.address))
    skel.NEST = skel.nesting()
    for (k, c), par in skel.NEST.items():
        PROCS[(k, c)].nested = True
        PROCS[(k, c)].parent = PROCS[(k, par)]
    for pr in PROCS.values():
        code = code_of(pr.key)
        a, b = pr.p['body']
        acc = collections.defaultdict(set)
        insl = list(md.disasm(code[a:b], a))
        pair = set()
        for i1, i2 in zip(insl, insl[1:]):
            m1 = [o for o in i1.operands if o.type == x86.X86_OP_MEM and R.get(o.mem.base) == 'bp']
            m2 = [o for o in i2.operands if o.type == x86.X86_OP_MEM and R.get(o.mem.base) == 'bp']
            if not m1 or not m2:
                continue
            d1, d2 = m1[0].mem.disp, m2[0].mem.disp
            if i1.mnemonic == 'mov' and i2.mnemonic == 'mov' and i1.op_str.startswith('ax,') and i2.op_str.startswith('dx,') and d2 == d1 + 2:
                pair.add(d1)
        triple = set()
        for i1, i2, i3 in zip(insl, insl[1:], insl[2:]):
            ms = []
            for ii in (i1, i2, i3):
                m = [o for o in ii.operands if o.type == x86.X86_OP_MEM and R.get(o.mem.base) == 'bp']
                ms.append(m[0].mem.disp if m and ii.mnemonic == 'mov' else None)
            regs = tuple(ii.op_str.split(',')[0] for ii in (i1, i2, i3))
            if None not in ms and ms[1] == ms[0] + 2 and ms[2] == ms[0] + 4 and regs in (('ax', 'bx', 'dx'), ('cx', 'si', 'di')):
                triple.add(ms[0])      # a real (6 bytes) loaded into dx:bx:ax or di:si:cx
        for ins in insl:
            for o in ins.operands:
                if o.type == x86.X86_OP_MEM and R.get(o.mem.base) == 'bp' and o.mem.disp >= pr.base and \
                        R.get(o.mem.segment) in (None, 'ss'):
                    acc[o.mem.disp].add('les' if ins.mnemonic == 'les' else o.size)
        lo = pr.base + (2 if pr.nested else 0)
        hi = pr.base + pr.retn
        if any(d >= hi for d in acc):
            pr.strfunc = True
        copies = {c['src']: c for c in pr.p.get('copies', [])}
        slots = []
        o = lo
        while o < hi:
            if o in copies:
                s = Param(o, 4); s.copy = copies[o]; s.access.add('copy')
            elif o in triple and o + 6 <= hi:
                s = Param(o, 6); s.access |= acc.get(o, set()); s.access.add('real')
            elif ('les' in acc.get(o, ()) or o in pair or (pr.key, pr.entry, o) in MERGE) and o + 4 <= hi:
                s = Param(o, 4); s.access |= acc.get(o, set())
            else:
                s = Param(o, 2); s.access |= acc.get(o, set())
            slots.append(s)
            o += s.size
        if o != hi:
            raise RuntimeError('param layout %r' % pr)
        pr.params = list(reversed(slots))     # Pascal order: first param = highest offset
        pr.link = pr.base if pr.nested else None


analyse()


def detect_var_params():
    """TP 5.5 pushes an address argument for a var parameter as  lea/mov di,X; push ss|ds; push di  but a pointer
    value @X as  mov ax,X; mov dx,ss|ds; push dx; push ax.  A 4-byte slot fed with the first form at any call site is
    an untyped var parameter."""
    for (k, e), pr in list(PROCS.items()):
        code = code_of(k)
        a, b = pr.p['body']
        L = list(md.disasm(code[a:b], a))
        for j, ins in enumerate(L):
            callee = None
            if ins.mnemonic == 'call' and ins.operands[0].type == x86.X86_OP_IMM:
                callee = PROCS.get((k, ins.operands[0].imm))
            elif ins.mnemonic == 'lcall' and ins.operands[0].type == x86.X86_OP_IMM:
                try:
                    t = far_target(k, ins.address)
                except LiftError:
                    continue
                callee = t[1] if t[0] == 'proc' else None
            if callee is None or not callee.params:
                continue
            # pushes before the call, last pushed first; skip the static link / push cs of near calls to far procs
            pushes = []
            i = j - 1
            while i >= 0 and len(pushes) < 2 * len(callee.params) + 2:
                x = L[i]
                if x.mnemonic in ('call', 'lcall', 'ret', 'retf', 'jmp') or x.mnemonic.startswith('j') or x.mnemonic.startswith('loop'):
                    break
                if x.mnemonic == 'push':
                    pushes.append(i)
                i -= 1
            if ins.mnemonic == 'call' and callee.far and pushes and L[pushes[0]].op_str == 'cs':
                pushes = pushes[1:]
            if callee.nested and pushes:
                pushes = pushes[1:]
            q = 0
            for prm in reversed(callee.params):        # last parameter is pushed last
                if prm.size == 4:
                    if q + 1 >= len(pushes):
                        break
                    po, ps = L[pushes[q]], L[pushes[q + 1]]
                    if po.op_str == 'di' and ps.op_str in ('ss', 'ds') and pushes[q + 1] == pushes[q] - 1 and pushes[q] >= 2:
                        ld = L[pushes[q + 1] - 1]
                        if not prm.copy and ld.mnemonic in ("lea", "mov") and ld.op_str.startswith("di,") and \
                                (ld.mnemonic == 'lea' or ld.operands[1].type == x86.X86_OP_IMM):
                            prm.var = True
                    elif po.op_str == 'di' and ps.op_str == 'es' and pushes[q + 1] == pushes[q] - 1 and pushes[q] >= 2:
                        # les di,p; push es; push di: p^ (or an element reached through it) passed as a var argument
                        ld = L[pushes[q + 1] - 1]
                        if not prm.copy and ld.mnemonic == 'les' and ld.op_str.startswith('di,'):
                            prm.var = True
                    q += 2
                else:
                    q += 1


detect_var_params()


def detect_oplus():
    """TP 5.5: a code literal passed to a procedure of a unit compiled {$O+} is first copied into a stack temp
    (StrLoad), because that unit's code may be overlaid (TP6 decided this per caller). Resident units seen
    receiving such copies are compiled {$O+}."""
    for (k, e), pr in PROCS.items():
        code = code_of(k)
        a, b = pr.p['body']
        L = list(md.disasm(code[a:b], a))
        for j in range(len(L) - 4):
            if not (L[j].mnemonic == 'mov' and L[j].op_str.startswith('di,') and L[j + 1].op_str == 'cs' and
                    L[j + 2].op_str == 'di' and L[j + 3].mnemonic == 'lcall'):
                continue
            try:
                t = far_target(k, L[j + 3].address)
            except LiftError:
                continue
            if t[1] != '@$basg$qm6Stringt1':
                continue
            # the call that receives the temp: the next far call after the remaining argument pushes
            for x in L[j + 4:j + 40]:
                if x.mnemonic in ('call', 'lcall'):
                    break
                if x.mnemonic.startswith('j') or x.mnemonic in ('ret', 'retf'):
                    x = None
                    break
            else:
                x = None
            if x is None or x.mnemonic != 'lcall':
                continue
            try:
                t2 = far_target(k, x.address)
            except LiftError:
                continue
            if t2[0] == 'proc' and 'entries' not in U[t2[1].key]:
                skel.OPLUS.add(t2[1].key)
            elif t2[0] == 'tpl' and ('Dos', t2[1]) in {(u, n) for (u, _), n in skel.TPLNAMES.items()} and 'entries' not in U[k]:
                # the library Dos unit is {$O+}-capable, so the copy is the caller's {$O+} (Overlay is never copied
                # for); TP5.5 only takes $O at the top of a unit, so the whole unit
                skel.OPLUS.add(k)


detect_oplus()


def is_oplus(pr):
    return pr.key in skel.OPLUS or 'entries' in U[pr.key] or (pr.key, pr.entry) in skel.OPLUS_PROCS


