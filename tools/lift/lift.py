"""TP6 lifter driver: procedure bodies -> Pascal.

usage: lift.py show UNIT ENTRY      print the lifted Pascal of one procedure (or the reason it fails)
       lift.py stats [UNIT...]      try every procedure, print success rate and failure reasons
"""
import sys, os, collections, json, re
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import prog
from prog import PROCS, skel, code_of
from ir import *
import sim as simmod
from sim import Sim, TempRef
import rtl
from cfg import Body
from emit import Emitter, tname, pstr

Sim.rtl_dummy = None


class ProcCtx:
    def __init__(self, pr):
        self.pr = pr
        self.key = pr.key
        self.code = code_of(pr.key)
        self.link_offsets = {pr.link} if pr.nested else set()
        self.lits = {}
        lp = pr.p['lit']
        try:
            items = skel.lits(self.code, lp, pr.entry)
        except Exception:
            items = []
        o = lp
        for t, b in items:
            self.lits[o] = (t, b)
            o += (1 + len(b)) if t == 's' else 32
        self.localrefs = {}     # off -> {(size, type)}
        self.temps = []
        self.temps_for = []     # for-loop final-value temps
        self.allow_raw = RAW_OK
        self.cur_ins = None
        self.force_raw = FORCE_RAW.get((pr.key, pr.entry), set())
        self.keep_only = KEEP_ONLY.get((pr.key, pr.entry))     # minimal lift: only these call sites as Pascal
        self.raws = []

    def locals_end(self, pr):
        """Size of the declared locals: statement temps start right below them."""
        if getattr(self, 'keep_only', None) is not None:
            return self.kept_locals_end(pr)
        L = None
        raws = getattr(self, 'raw_ranges', [])
        if getattr(self, 'keep_only', None) is not None:
            raws = []          # minimal lift: the raw statements' temps still tell where the locals end
        for t in self.temps:
            if t.value is None:
                continue
            if any(a <= getattr(t, 'at', -1) < b for a, b in raws):
                continue
            from ir import Lit
            v = t.value
            sz = 256
            if getattr(t, 'set', False):
                sz = 32
            elif prog.is_oplus(pr):
                if isinstance(v, Lit):
                    sz = len(v.text) + 1
            elif isinstance(v, Lit):
                # $O-: a literal loaded into a temp for a concatenation is 256 bytes, but a temp whose 256 bytes
                # would reach into the parameter copies can only be the literal's size
                top = sum((c['n'] + 1) if c['rtl'] == 0xA89 else c['n'] for c in pr.p.get('copies', []))
                if -t.off - sz < top:
                    sz = len(v.text) + 1
            cand = -t.off - sz
            L = cand if L is None else min(L, cand)
        for t in self.temps_for:
            cand = -t.off - t.size
            L = cand if L is None else min(L, cand)
        return pr.p['locals'] if L is None else L

    def kept_locals_end(self, pr):
        """Minimal lift: the kept (Pascal) statements' temps sit right below the declared locals, so their
        original offsets give the locals' end; without temps the locals can fill the whole frame."""
        from ir import Lit
        rr = getattr(self, 'raw_ranges', [])
        live = lambda t: not any(a <= getattr(t, 'at', -1) < b for a, b in rr)
        oplus = prog.is_oplus(pr)
        cands = []
        for t in self.temps:
            if t.value is None or not live(t):
                continue
            if getattr(t, 'set', False):
                sz = 32
            elif isinstance(t.value, Lit) and oplus:
                sz = len(t.value.text) + 1
            else:
                sz = 256
            cands.append(-t.off - sz)
        lf = getattr(self, 'live_for', set())
        for t in self.temps_for:
            if live(t) or t.off in lf:
                cands.append(-t.off - t.size)
        if not cands:
            return pr.p['locals']
        return max(min(cands), self.direct_locals_end(pr) if False else 0)

    def direct_locals_end(self, pr):
        """Minimal lift: the locals reach down to the deepest [bp-X] variable access (temps are reached with
        lea and live below the locals)."""
        from capstone import x86
        from sim import md, R
        a, b = pr.p['body']
        deep = sum((c['n'] + 1) if c['rtl'] == 0xA89 else c['n'] for c in pr.p.get('copies', []))
        deep += {'byte': 1, 'word': 2, 'longint': 4, 'real': 6, None: 0}[pr.result]
        temps = {t.off for t in self.temps if t.value is not None}
        tregions = [(t.off, t.off + t.size) for t in self.temps_for]
        for ins in md.disasm(code_of(pr.key)[a:b], a):
            if ins.mnemonic == 'lea' and ins.operands[1].mem.disp in temps:
                continue
            for o in ins.operands:
                if o.type == x86.X86_OP_MEM and R.get(o.mem.base) == 'bp' and o.mem.index == 0 and o.mem.disp < 0:
                    if any(lo <= o.mem.disp < hi for lo, hi in tregions):
                        continue
                    deep = max(deep, -o.mem.disp)
        # the outermost with/for temp sits right below the locals
        if self.temps_for:
            deep = max(deep, min(-t.off - t.size for t in self.temps_for))
        return min(deep, pr.p['locals'])

    def fixup_in(self, a, n):
        fx = getattr(self, '_fx', None)
        if fx is None:
            fx = self._fx = {f: sg for f, sg in skel.U[self.key]['fixups']}
        for f in range(a, a + n):
            if f in fx:
                return fx[f]
        return None

    def proc_at(self, seg, ofs):
        k = skel.SEG.get(seg)
        if k is None or k in skel.TPL or k == '@Data':
            raise LiftError('address of non-procedure')
        if 'entries' in skel.U[k]:
            if (ofs - 0x20) % 5:
                raise LiftError('stub offset')
            ofs = skel.U[k]['entries'][(ofs - 0x20) // 5]
        p = PROCS.get((k, ofs))
        if p is None:
            raise LiftError('procedure address %s:%04X' % (k, ofs))
        return p

    def strparam(self, off, depth=0):
        pr = self.pr
        for _ in range(depth):
            pr = pr.parent
        for p in pr.params:
            if p.copy and p.copy['dst'] == off and p.copy['rtl'] == 0xA89:
                return '%s%d' % (chr(ord('a') + skel.depth(pr.key, pr.entry)), pr.params.index(p))
        return None

    def is_result(self, l):
        rs = {'byte': 1, 'word': 2, 'longint': 4, 'real': 6, None: 0}[self.pr.result]
        return rs and l.off == -rs and l.size == rs

    # -- sim callbacks
    def literal(self, off):
        it = self.lits.get(off)
        if it is None:
            # a pointer into the middle of a pool item: TP shares string tails ('' is the final 0 byte)
            c = code_of(self.key)
            pr = self.pr
            if pr.p.get('lit') is not None and pr.p['lit'] <= off < pr.entry and off + c[off] < pr.entry:
                return Lit(off, bytes(c[off + 1:off + 1 + c[off]]))
            raise LiftError('literal %x not in pool' % off)
        t, b = it
        return Lit(off, b) if t == 's' else SetLit(off, b)

    def local_addr(self, off):
        t = TempRef(off)
        t.at = self.cur_ins
        self.temps.append(t)
        return t

    def far(self, at):
        return prog.far_target(self.key, at)

    def near(self, t):
        p = PROCS.get((self.key, t)) or prog.tail(self.key, t)
        if p is None:
            raise LiftError('near target %x' % t)
        return p

    def rtl_call(self, sim, name):
        return rtl.rtl_call(sim, name)

    def tpl_call(self, sim, name):
        return rtl.tpl_call(sim, name)


def lift(pr):
    """Lift one procedure. Returns (ctx, stmts)."""
    if pr.key == 'M':
        raise LiftError('main block')
    ctx = ProcCtx(pr)
    a, b = pr.p['body']
    if a == b:
        return ctx, []
    body = Body(ctx, ctx.code, a, b)
    stmts = body.structure(a, b)
    return ctx, stmts


def fix_args(stmts):
    """User-call arguments that are local addresses without a value are var parameters."""
    pass


FRAMES = {}


def frame_of(pr):
    """Shared frame object of a procedure (lifted or skeleton): named locals requested by itself or nested children."""
    f = FRAMES.get(pr)
    if f is None:
        f = FRAMES[pr] = Frame(pr, ProcCtx(pr), None)
    return f


class Frame:
    """Declared locals of a procedure."""

    def __init__(self, pr, ctx, em):
        self.pr, self.ctx, self.em = pr, ctx, em
        self.refs = {}
        self.depth = skel.depth(pr.key, pr.entry)
        self.pl = chr(ord('a') + self.depth)      # parameter prefix
        self.vl = 'vwxyz'[self.depth]             # local prefix

    def name(self, l, signed, t=None):
        pr = self.pr
        if l.kind == 'up':
            par = pr
            for _ in range(l.depth):
                par = par.parent
            ll = Loc('l', l.off, l.size)
            fr = frame_of(par)
            if fr.ctx.is_result(ll):
                raise LiftError('parent result via link')
            return fr.name(ll, signed, t)
        off = l.off
        if off > 0:
            for p in pr.params:
                if p.off == off:
                    try:
                        return self.pname(p, l, signed, t)
                    except LiftError as ex:
                        if 'access size' not in str(ex):
                            raise
                        return self.pview(p, l, signed, t)
            for p in pr.params:
                if p.off < off < p.off + p.size:
                    return self.pview(p, l, signed, t)
            raise LiftError('param slot %d' % off)
        for p in pr.params:
            if p.copy and p.copy['dst'] == off:
                nm = '%s%d' % (self.pl, pr.params.index(p))
                if p.copy['rtl'] == 0xA89 and t is None and l.size == 1:
                    return 'Length(%s)' % nm          # s[0]
                return nm
            if p.copy and p.copy['rtl'] == 0xA89 and p.copy['dst'] < off <= p.copy['dst'] + p.copy['n'] and \
                    l.size == 1 and l.index is None:
                # a character of a copied string value parameter
                nm = '%s%d[%d]' % (self.pl, pr.params.index(p), off - p.copy['dst'])
                return nm if t == 'char' else 'Byte(%s)' % nm
        rs = {'byte': 1, 'word': 2, 'longint': 4, 'real': 6, None: 0}[pr.result]
        if rs and off == -rs:
            raise LiftError('function result read/written as variable')
        typ = t or tname(l.size, signed)
        k = (off, typ)
        if pr.init:
            raise LiftError('local variable in an init block')
        if k not in self.refs:
            n = self.vl + '%d%s' % (-off, {'byte': 'b', 'shortint': 'sb', 'word': 'w', 'integer': 'i', 'longint': 'l',
                                        'pointer': 'p', 'real': 'r'}.get(typ, 'a'))
            used = {v.lower() for v in self.refs.values()}
            base, j = n, 1
            while n.lower() in used:
                j += 1
                n = '%s%d' % (base, j)
            self.refs[k] = n
        return self.refs[k]

    def pview(self, p, l, signed, t):
        """Part of a parameter (a word of a longint/pointer, the low byte of a word): a variable typecast to a
        record of the parameter's size."""
        typ = t or tname(l.size, signed)
        sz = {'byte': 1, 'shortint': 1, 'char': 1, 'boolean': 1, 'word': 2, 'integer': 2, 'longint': 4,
              'pointer': 4, 'real': 6}.get(typ)
        d = l.off - p.off
        if sz is None or d + sz > p.size or getattr(p, 'copy', None):
            raise LiftError('param view')
        n = 'PV%d_%d_%s' % (p.size, d, typ)
        pre = '_p: array[1..%d] of byte; ' % d if d else ''
        post = '; _r: array[1..%d] of byte' % (p.size - d - sz) if p.size - d - sz else ''
        CUR_EM.types[n] = 'record %sv: %s%s end' % (pre, typ, post)
        i = self.pr.params.index(p)
        if getattr(p, 'ptype', None) is None:
            p.ptype = {2: 'word', 4: 'longint'}.get(p.size)
        return '%s(%s%d).v' % (n, self.pl, i)

    def pname(self, p, l, signed, t):
        i = self.pr.params.index(p)
        typ = t or tname(l.size, signed)
        want = {1: 2}.get(l.size, l.size)
        if p.size == 2 and want == 4 and any(q.off == p.off + 2 and q.size == 2 for q in self.pr.params) and \
                (self.pr.key, self.pr.entry, p.off) not in prog.NOMERGE:
            prog.MERGE_REQ.add((self.pr.key, self.pr.entry, p.off))
            raise LiftError('param merge requested')
        if p.size != want and not (p.size == 4 and typ == 'pointer'):
            raise LiftError('param access size')
        p.ptype = getattr(p, 'ptype', None) or typ
        if p.ptype != typ:
            if {p.ptype, typ} <= {'byte', 'word'} or {p.ptype, typ} <= {'shortint', 'integer'}:
                pass
            elif {p.ptype, typ} in ({'byte', 'shortint'}, {'word', 'integer'}, {'longint', 'pointer'}):
                # same size, other view: a variable typecast generates no code
                return '%s(%s%d)' % (typ, self.pl, i)
            elif p.ptype in ('byte', 'shortint') and typ in ('word', 'integer'):
                # accessed as a word too: declare the wider type (the next render pass uses views for the bytes)
                p.ptype = typ
                return '%s%d' % (self.pl, i)
            elif p.ptype in ('word', 'integer') and typ in ('byte', 'shortint'):
                return self.pview(p, l, signed, t)
            else:
                raise LiftError('param type conflict %s/%s' % (p.ptype, typ))
        return '%s%d' % (self.pl, i)


LAST_STMTS = None
RAW_OK = True
FORCE_RAW = {}     # (key, entry) -> {(a, b)} statement ranges kept as bytes
KEEP_ONLY = {}     # (key, entry) -> {call addresses}: every statement not containing one stays bytes


def walk(x, f, seen=None):
    """Call f on every IR node below x (expressions and statements)."""
    if seen is None:
        seen = set()
    if id(x) in seen or isinstance(x, prog.Proc):
        return
    seen.add(id(x))
    f(x)
    if isinstance(x, (list, tuple)):
        for y in x:
            walk(y, f, seen)
    elif hasattr(x, '__dict__'):
        for v in vars(x).values():
            if isinstance(v, (list, tuple, E, S)) or (hasattr(v, '__dict__') and not isinstance(v, prog.Proc)):
                walk(v, f, seen)


def lkey(l):
    if l.kind == 'deref':
        return ('deref', l.off, lkey(l.ptr) if isinstance(l.ptr, Loc) else None, repr(l.index))
    if l.kind == 'idx':
        return ('idx', l.off, l.scale, repr(l.index))
    return (l.kind, l.off, l.depth)


def pointer_locs(stmts):
    """Keys of 4-byte locations used as pointers."""
    from rtl import Builtin
    ptr = set()
    pairs = []

    def f(n):
        if isinstance(n, Loc) and n.kind == 'deref' and isinstance(n.ptr, Loc):
            ptr.add(lkey(n.ptr))
        if isinstance(n, Builtin) and n.name in ('FreeMem',) and isinstance(n.args[0], Loc) and n.args[0].size == 4:
            ptr.add(lkey(n.args[0]))
        if isinstance(n, Assign) and type(n.src).__name__ == 'ProcAddr' and isinstance(n.dst, Loc):
            ptr.add(lkey(n.dst))
        if isinstance(n, Assign) and isinstance(n.src, Builtin) and n.src.name == 'GetMem' and isinstance(n.dst, Loc):
            ptr.add(lkey(n.dst))
        if isinstance(n, Call):
            for a, p in zip(n.args, n.target.params):
                if isinstance(a, Loc) and a.size == 4 and p.size == 4 and ('les' in p.access or getattr(p, 'ptype', None) == 'pointer'):
                    ptr.add(lkey(a))
        if isinstance(n, Assign) and isinstance(n.dst, Loc) and isinstance(n.src, Loc) and n.dst.size == 4 == n.src.size:
            pairs.append((lkey(n.dst), lkey(n.src)))
        if isinstance(n, Op) and n.op == 'rel' and all(isinstance(a, Loc) and a.size == 4 for a in n.args):
            pairs.append((lkey(n.args[0]), lkey(n.args[1])))
    walk(stmts, f)
    changed = True
    while changed:
        changed = False
        for a, b in pairs:
            if (a in ptr) != (b in ptr):
                ptr |= {a, b}
                changed = True
    return ptr


def render(pr):
    global LAST_STMTS
    ctx, stmts = lift(pr)
    LAST_STMTS = stmts
    global CUR_EM
    em = CUR_EM = Emitter(ctx)
    em.ptrs = pointer_locs(stmts)
    fr = Frame(pr, ctx, em)
    old = FRAMES.get(pr)
    if old is not None:
        fr.refs.update(old.refs)        # names nested children asked for
    FRAMES[pr] = fr
    ctx.local_name = fr.name
    body = em.stmts(stmts, 1)
    out = []
    for l in body:
        out += wrapline(l)
    return ctx, em, fr, out


def wrapline(l, maxlen=110):
    """Split a long Pascal line at ', ' / ' and ' / ' or ' / ' + ' outside string literals."""
    if '\n' in l:
        return [w for x in l.split('\n') for w in wrapline(x, maxlen)]
    if len(l) <= maxlen:
        return [l]
    ind = len(l) - len(l.lstrip()) + 4
    cuts = []
    q = False
    for i, ch in enumerate(l):
        if ch == "'":
            q = not q
        elif not q and (l.startswith(', ', i) or l.startswith('; ', i)):
            cuts.append(i + 2)
        elif not q and (l.startswith(' and ', i) or l.startswith(' or ', i) or l.startswith(' + ', i)):
            cuts.append(i + 1)
    out = []
    start = 0
    while len(l) - start > maxlen - (ind if out else 0):
        room = maxlen - (ind if out else 0)
        fit = [c for c in cuts if start < c <= start + room]
        if not fit:
            fit = [c for c in cuts if c > start][:1]
            if not fit:
                break
        out.append((' ' * ind if out else '') + l[start:fit[-1]].strip())
        start = fit[-1]
    out.append((' ' * ind if out else '') + l[start:].strip())
    if any(len(x) > 126 for x in out):
        raise LiftError('line too long')
    return out


ARGEV = None
SIGNED_RESULTS = set()


def arg_evidence():
    """Argument kinds at every call site that the simulator can follow (lifted or not): {(proc, i): {kinds}}."""
    global ARGEV
    if ARGEV is not None:
        return ARGEV
    ev = collections.defaultdict(set)
    orig = Sim.do_call
    orig_cbw = Sim.i_cwde

    def spy_cbw(self, ins, ops):
        v = self.r.get('al')
        if isinstance(v, Call):
            SIGNED_RESULTS.add(v.target)
        return orig_cbw(self, ins, ops)
    Sim.i_cwde = spy_cbw

    def spy(self, callee, at):
        n = len(callee.params)
        st = list(self.stack)
        try:
            args = self.pop_args([p.size for p in callee.params], None)
            for i, a in enumerate(args):
                ev[(callee, i)].add(kind_of(a))
        finally:
            self.stack = st
        return orig(self, callee, at)
    Sim.do_call = spy
    try:
        for pr in PROCS.values():
            ctx = ProcCtx(pr)
            a, b = pr.p['body']
            if a == b:
                continue
            try:
                body = Body(ctx, ctx.code, a, b)
            except LiftError:
                continue
            for blk in body.order:
                sim = Sim(ctx)
                for ins in blk.ins:
                    try:
                        sim.step(ins)
                    except LiftError:
                        break
                    except Exception:
                        break
    finally:
        Sim.do_call = orig
        Sim.i_cwde = orig_cbw
    ARGEV = ev
    return ev


def kind_of(a):
    if isinstance(a, Addr) or (isinstance(a, TempRef) and a.value is None):
        return 'addr'
    if isinstance(a, Const) and a.size == 4 and a.v:
        return 'const'
    s = getattr(a, 'size', None)
    return {1: 'byte', 2: 'word', 4: 'long'}.get(s, 'other')


def save_merges():
    if prog.MERGE_REQ - prog.MERGE or prog.UNMERGE:
        nom = sorted(prog.NOMERGE | prog.UNMERGE)
        json.dump([list(x) for x in nom], open('data/param_nomerge.json', 'w'))
        allm = sorted((prog.MERGE | prog.MERGE_REQ) - prog.UNMERGE - prog.NOMERGE)
        json.dump([list(x) for x in allm], open('data/param_merge.json', 'w'))
        print('param merges requested:', len(prog.MERGE_REQ - prog.MERGE))


def report(keys=None):
    reasons = collections.Counter()
    ok = 0; tot = 0
    for (k, e), pr in sorted(PROCS.items()):
        if keys and k not in keys:
            continue
        tot += 1
        try:
            render(pr)
            ok += 1
        except LiftError as ex:
            reasons[re.sub(r'[0-9a-f]{2,}', 'N', str(ex))[:60]] += 1
        except Exception as ex:
            reasons['CRASH ' + type(ex).__name__ + ' ' + str(ex)[:40]] += 1
    print('lifted %d/%d' % (ok, tot))
    save_merges()
    for r, n in reasons.most_common(40):
        print('%5d %s' % (n, r))


if __name__ == '__main__':
    if sys.argv[1] == 'show':
        k, e = sys.argv[2], int(sys.argv[3], 16)
        pr = PROCS[(k, e)]
        try:
            ctx, em, fr, body = render(pr)
            print('\n'.join(body))
            print(em.globals, fr.refs, em.types)
        except LiftError as ex:
            print('FAIL', ex)
    elif sys.argv[1] == 'stats':
        report(sys.argv[2:] or None)
