import re
"""Render lifted IR as Pascal, collecting the declarations it needs."""
from ir import *
from sim import Half, TempRef
from rtl import Builtin, StrVal, CharStr, SetCons
from sim import IncOp

import types
import json as _json
CHARSETS = set()
try:
    import skel as _skel
    for _l in open('data/types.tsv'):
        _p = _l.rstrip('\n').split('\t')
        if len(_p) > 2 and _p[2].startswith('set of #'):
            CHARSETS.add(_p[1])
except FileNotFoundError:
    pass
STRRES_SEEN = {}    # (key, entry) -> n of string[n] function results found while rendering
SIZED_ITEMS = []
try:
    for _l in open('data/types.tsv'):
        _p = _l.rstrip('\n').split('\t')
        if len(_p) > 4 and not _l.startswith('#'):
            SIZED_ITEMS.append((int(_p[0], 16), int(_p[4])))
except FileNotFoundError:
    pass
TPLVARS = {int(k, 16): v.capitalize() for k, v in _json.load(open('data/tplvars.json')).items()}
TPLTYPES = {'Doserror': 'integer', 'Heapend': 'pointer', 'Ovrresult': 'integer', 'Checkeof': 'boolean',
            'Checksnow': 'boolean', 'Windmin': 'word', 'Windmax': 'word', 'Inoutres': 'integer', 'Errorr': 'pointer',
            'Erroraddr': 'pointer', 'Stacklimit': 'word', 'Test8087': 'byte', 'Ovrheapsize': 'word',
            'Ovrheaporg': 'word', 'Ovrheapptr': 'word', 'Ovrheapend': 'word', 'Ovrtrapcount': 'word',
            'Ovrloadcount': 'word', 'Ovrfilemode': 'byte', 'Ovremspages': 'word', 'Input': 'text', 'Output': 'text', 'Heaperror': 'pointer', 'Exitproc': 'pointer', 'Exitcode': 'integer', 'Randseed': 'longint',
            'Filemode': 'byte', 'Textattr': 'byte', 'Checkbreak': 'boolean', 'Directvideo': 'boolean',
            'Lastmode': 'word', 'Prefixseg': 'word', 'Heaporg': 'pointer', 'Heapptr': 'pointer', 'Freelist': 'pointer',
            'Freeptr': 'pointer', 'Freemin': 'word', 'Ovrreadbuf': 'ovrfunc', 'Ovrdebugptr': 'pointer',
            'Ovrcodelist': 'word', 'Ovrloadlist': 'word', 'Ovrdoshandle': 'word', 'Ovremshandle': 'word'}
BTYPES = {'Ptr': ['word', 'word'], 'Abs': ['integer'], 'Intr': [None, 'Registers'], 'FindFirst': [None, None, 'SearchRec'], 'FindNext': ['SearchRec'],
          'Insert': [None, 'string'], 'Delete': ['string'], 'UpCase': ['char'], 'Copy': ['string'],
          'MkDir': ['string'], 'Pos': ['string', 'string']}
BOOLB = {'KeyPressed', 'Eof', 'Eoln'}
CHARB = {'ReadKey', 'UpCase'}
PREC = {'or': 1, 'xor': 1, '+': 1, '-': 1, 'and': 2, '*': 2, 'div': 2, 'mod': 2, 'shl': 2, 'shr': 2}
RELS = {'=': '=', '<>': '<>', '<u': '<', '>=u': '>=', '<=u': '<=', '>u': '>', '<s': '<', '>=s': '>=', '<=s': '<=', '>s': '>'}


def tname(size, signed):
    if size == 1:
        return 'shortint' if signed else 'byte'
    if size == 2:
        return 'integer' if signed else 'word'
    if size == 4:
        return 'longint'
    if size == 6:
        return 'real'
    raise LiftError('type of size %r' % (size,))


class Emitter:
    def __init__(self, ctx):
        self.ctx = ctx
        self.globals = {}     # alias name -> (addr, type)
        self.types = {}       # type name -> definition
        self.locals = {}      # bp offset -> (name, type, size)

    # ---------------- locations
    def isptr(self, l):
        if isinstance(l, Builtin) and l.name == 'Ptr':
            return True
        if isinstance(l, Call) and l.size == 'longint':
            import skel
            if (l.target.key, l.target.entry) in skel.PTRRES:
                return True
            sig = skel.SIGS.get((l.target.key, l.target.entry))
            return bool(sig) and sig[1] == 'pointer'
        if not (isinstance(l, Loc) and l.size == 4):
            return False
        import lift
        if lift.lkey(l) in getattr(self, 'ptrs', ()):
            return True
        if l.kind == 'l' and l.off > 0 and l.depth == 0 and l.index is None:
            # a parameter declared pointer
            import skel
            pr = self.ctx.pr
            sig = skel.SIGS.get((pr.key, pr.entry))
            for i, p in enumerate(pr.params):
                if p.off == l.off and p.size == 4:
                    if sig and i < len(sig[0]):
                        return sig[0][i] == 'pointer'
                    return getattr(p, 'ptype', None) == 'pointer' or 'les' in p.access   # as build.sigs decides
        return False

    def with_tmp(self, l):
        p = getattr(l, 'ptr', None)
        if l.kind == 'deref' and isinstance(p, Loc) and p.kind == 'l' and p.size == 4 and \
                p.off not in getattr(self.ctx, 'withs', {}) and any(t.off == p.off and type(t).__name__ == 'Loc'
                                                                   for t in self.ctx.temps_for):
            raise LiftError('with temp outside its with')
        if l.kind == 'deref' and isinstance(p, Loc) and p.kind == 'l' and p.size == 4 and \
                p.off in getattr(self.ctx, 'withs', {}):
            return p.off
        return None

    def with_field(self, l, t):
        """Field of the record a with statement opened: one variant per (offset, type)."""
        flds = self.ctx.withs[l.ptr.off]
        if isinstance(l.index, Op) and l.index.op == '+' and isinstance(l.index.args[1], Const) and \
                getattr(l.index, 'disp_after', False):
            l = Loc('deref', (l.off + l.index.args[1].v) & 0xFFFF, l.size, index=l.index.args[0], scale=l.scale, ptr=l.ptr)
        if isinstance(l.index, Const) and l.scale in (None, 1):
            l = Loc('deref', (l.off + l.index.v) & 0xFFFF, l.size, ptr=l.ptr)
        if l.index is not None and type(l.index).__name__ == 'MulK' and l.scale in (None, 1) and l.size is None and \
                t in (None, 'byte'):
            l = Loc('deref', l.off, 1, index=l.index, scale=l.scale, ptr=l.ptr)     # address of an element field
            t = 'byte'
        if l.index is not None and type(l.index).__name__ == 'MulK' and l.scale in (None, 1) and l.size:
            # array of k-byte records: disp = start - low*k (+ field offset 0); pick the smallest low >= 0
            k, d = l.index.k, l.off - (0x10000 if l.off >= 0x8000 else 0)
            if l.size > k:
                raise LiftError('with record field overflow')
            lo = max(0, -(d // k))
            start = d + lo * k
            rn = 'WE%d_%s' % (k, re.sub(r'\W', '', t))
            if rn not in self.types:
                post = '; _r: array[1..%d] of byte' % (k - l.size) if k - l.size else ''
                self.types[rn] = 'record f: %s%s end' % (t, post)
            n = '_w%d_%dr%d_%d' % (-l.ptr.off, start, k, lo)
            flds[n] = (start, 'array[%d..%d] of %s' % (lo, lo + max(1, 32000 // k), rn))
            return '%s[%s].f' % (n, self.expr(l.index.x))
        if l.index is not None:
            d = l.off & 0xFFFF
            if l.scale is None and l.size in (None, 1):
                l = Loc('deref', l.off, 1, index=l.index, scale=1, ptr=l.ptr)
                t = 'byte' if t in (None, 'byte') else t
            sz = l.size or l.scale
            if sz is None or l.scale != sz or d >= 0x8000:
                raise LiftError('indexed with field')
            if l.size is None:
                t = tname(sz, None)
            at = 'array[0..%d] of %s' % (32000 // sz, t)
            n = '_w%d_%da%s' % (-l.ptr.off, d, re.sub(r'\W', '', t))
            flds[n] = (d, at)
            return '%s[%s]' % (n, self.expr(l.index))
        n = '_w%d_%d%s' % (-l.ptr.off, l.off, re.sub(r'\W', '', t))
        flds[n] = (l.off, t)
        return n

    def loc(self, l, signed=None, force=None):
        s = l.signed if l.signed is not None else signed
        if self.with_tmp(l) is not None:
            if getattr(l, 'strmax', None) is not None and l.size is None:
                return self.with_field(l, 'string' if l.strmax == 255 else 'string[%d]' % l.strmax)
            return self.with_field(l, force or ('pointer' if self.isptr(l) else tname(l.size, s)))
        if getattr(l, 'strmax', None) is not None and l.size is None:
            t = 'string' if l.strmax == 255 else 'string[%d]' % l.strmax
            return self.loc_view(l, t) if l.kind not in ('g', 'l', 'up') else (
                self.galias(l.off, t) if l.kind == 'g' else self.ctx.local_name(l, None, t))
        if (force == 'pointer' or self.isptr(l)) and l.kind in ('g', 'l', 'up'):
            return self.loc_typed(l, 'pointer')
        if l.kind == 'g':
            if l.size == 1 and l.off in getattr(self, 'str_addrs', ()) and s is None:
                return 'Length(%s)' % self.galias(l.off, 'string')      # s[0] of a string variable
            return self.galias(l.off, tname(l.size, s))
        if l.kind in ('l', 'up'):
            return self.ctx.local_name(l, s)
        if l.kind == 'port':
            return 'Port[%s]' % self.expr(l.index)
        if l.kind == 'mem' and l.ptr is not None:
            arr = {1: 'Mem', 2: 'MemW', 4: 'MemL'}[l.size or 1]
            o_ = l.ptr
            sg = '$%X' % l.index.v if isinstance(l.index, Const) else self.expr(l.index)
            if type(o_).__name__ == 'AddrOf' and o_.kind == 'imm':
                return '%s[%s:$%X]' % (arr, sg, o_.off)
            return '%s[%s:%s]' % (arr, sg, self.expr(o_))
        if l.kind == 'mem':
            # mov si,SEG; mov es,si; [es:OFS]: a variable declared absolute SEG:OFS
            if not hasattr(self, 'absmem'):
                self.absmem = {}
            tn = force or tname(l.size, s)
            n = 'V%04X_%04X_%s' % (l.index.v, l.off, re.sub(r'\W', '_', tn))
            self.absmem[n] = '%s absolute $%X:$%X' % (tn, l.index.v, l.off)
            return n
        if l.kind == 'upidx':
            # array in a parent frame (same shapes as local arrays)
            if self.ctx.strparam(l.off, l.depth) and l.size == 1 and l.scale == 1:
                return 'Ord(%s[%s])' % (self.ctx.strparam(l.off, l.depth), self.expr(l.index))
            if l.scale and l.size and l.scale > l.size:
                rt = self.elemrec(l.scale, force or tname(l.size, s))
                n = self.ctx.local_name(Loc('up', l.off, l.scale, depth=l.depth), s, 'ARRAY ' + rt)
                return '%s[%s].f' % (n, self.expr(l.index))
            if l.scale == l.size:
                n = self.ctx.local_name(Loc('up', l.off, l.size, depth=l.depth), s, 'ARRAY ' + tname(l.size, s))
                return '%s[%s]' % (n, self.expr(l.index))
            raise LiftError('parent array element size')
        if l.kind == 'lidx' and self.ctx.strparam(l.off) and l.size == 1 and l.scale == 1:
            return 'Ord(%s[%s])' % (self.ctx.strparam(l.off), self.expr(l.index))
        cp_ = None
        if l.kind == 'lidx' and l.scale and l.size and l.scale >= l.size:
            for p_ in self.ctx.pr.params:
                c_ = p_.copy
                if c_ and c_['rtl'] != 0x644 and c_['dst'] - l.scale < l.off < c_['dst'] + c_['n'] and l.off != c_['dst']:
                    cp_ = c_
        if cp_ is not None:
            # an array inside a value-copied parameter (the displacement folds the low bound): a same-size
            # typecast of the parameter to a record holding the array
            D, n_, k = cp_['dst'], cp_['n'], l.scale
            lb = max(0, -((l.off - D) // k))
            pad = l.off + k * lb - D
            cnt = (n_ - pad) // k
            tail = n_ - pad - cnt * k
            rt = self.elemrec(k, force or tname(l.size, s)) if k > l.size else (force or tname(l.size, s))
            tn = 'TC%d_%d_%d_%s' % (n_, pad, lb, re.sub(r'\W', '_', rt))
            self.types[tn] = 'record %sa: array[%d..%d] of %s;%s end' % (
                '_p: array[1..%d] of byte; ' % pad if pad else '', lb, lb + cnt - 1, rt,
                ' _q: array[1..%d] of byte;' % tail if tail else '')
            nm = self.ctx.local_name(Loc('l', D, 1), None)
            return '%s(%s).a[%s]%s' % (tn, nm, self.expr(l.index), '.f' if k > l.size else '')
        if l.kind == 'lidx' and l.scale and l.size and l.scale > l.size and not self.ctx.strparam(l.off):
            # local array of records: the accessed field first in a scale-byte element record
            rt = self.elemrec(l.scale, force or tname(l.size, s))
            n = self.ctx.local_name(Loc('l', l.off, l.scale), s, 'ARRAY ' + rt)
            return '%s[%s].f' % (n, self.expr(l.index))
        if l.kind == 'lidx' and l.scale == l.size and l.size in (2, 4):
            # a value-copied array parameter (declared as bytes) indexed with wider elements: same-size typecast
            for p_ in self.ctx.pr.params:
                if p_.copy and p_.copy['dst'] == l.off and p_.copy['rtl'] != 0x644 and p_.copy['n'] % l.size == 0:
                    elem = tname(l.size, s)
                    tn = 'TA%d_%s' % (p_.copy['n'], elem)
                    self.types[tn] = 'array[0..%d] of %s' % (p_.copy['n'] // l.size - 1, elem)
                    nm = self.ctx.local_name(Loc('l', l.off, 1), None)
                    return '%s(%s)[%s]' % (tn, nm, self.expr(l.index))
        if l.kind == 'lidx':
            elem = tname(l.size, s)
            if l.scale != l.size:
                raise LiftError('local array element size')
            n = self.ctx.local_name(Loc('l', l.off, l.size), s, 'ARRAY ' + elem)
            return '%s[%s]' % (n, self.expr(l.index))
        nd = self.ndim_index(l) if l.kind == 'idx' and l.scale in (None, 1) else None
        if nd is not None:
            # a[i, j, k, ...]: three or more index terms, each scaled by TP (mov dx,K; mul dx)
            terms, esz = nd
            elem = force or tname(esz, s)
            dims = ['0..%d' % (terms[i][1] // terms[i + 1][1] - 1) for i in range(len(terms) - 1)]
            t = 'array[0..%d, %s] of %s' % (max(0, 32760 // terms[0][1] - 1), ', '.join(dims), elem)
            return '%s[%s]' % (self.galias(l.off, t, 'a'), ', '.join(self.expr(x) for x, k in terms) + '')
        if l.kind == 'idx' and l.size and l.size > 1 and l.scale in (None, 1) and isinstance(l.index, Op) and \
                l.index.op == '+' and len(l.index.args) == 2:
            # i*rowbytes + j*elemsize (both terms already scaled): a two-dimensional array of elements
            def km(t):
                if type(t).__name__ == 'MulK':
                    return t.x, t.k
                if type(t).__name__ == 'Scaled':
                    return t.index, t.scale
                if isinstance(t, Op) and t.op == '*' and isinstance(t.args[1], Const):
                    return t.args[0], t.args[1].v
                return None
            r0, c0 = km(l.index.args[0]), km(l.index.args[1])
            if r0 and c0 and c0[1] == l.size and r0[1] % l.size != 0 and r0[1] > l.size:
                # rows of records (rowbytes not a multiple of the element): a[i].f[j]
                elem = force or tname(l.size, s)
                k = r0[1]
                cols = k // l.size
                rn = 'RR%d_%s' % (k, re.sub(r'\W', '_', elem))
                pad = k - cols * l.size
                self.types[rn] = 'record f: array[0..%d] of %s%s end' % (
                    cols - 1, elem, '; _r: array[1..%d] of byte' % pad if pad else '')
                t = 'array[0..%d] of %s' % (max(0, 32760 // k - 1), rn)
                return '%s[%s].f[%s]' % (self.galias(l.off, t, 'a'), self.expr(r0[0]), self.expr(c0[0]))
            if r0 and c0 and c0[1] == l.size and r0[1] % l.size == 0:
                elem = force or tname(l.size, s)
                cols = r0[1] // l.size
                t = 'array[0..%d, 0..%d] of %s' % (max(0, 32760 // r0[1] - 1), cols - 1, elem)
                return '%s[%s, %s]' % (self.galias(l.off, t, 'a'), self.expr(r0[0]), self.expr(c0[0]))
        if l.kind == 'idx' and l.size and l.scale == l.size and isinstance(l.index, Op) and l.index.op == '+' and \
                (type(l.index.args[0]).__name__ in ('Scaled', 'MulK') or isinstance(l.index.args[0], Op) and
                 l.index.args[0].op == '*' and isinstance(l.index.args[0].args[1], Const)):
            # two-dimensional array a[i, j]: i*rowsize + j*elemsize
            sc = l.index.args[0]
            if isinstance(sc, Op):
                x, k = sc.args[0], sc.args[1].v
            else:
                x, k = (sc.index, sc.scale) if type(sc).__name__ == 'Scaled' else (sc.x, sc.k)
            y = l.index.args[1]
            if k % l.size == 0:
                elem = force or tname(l.size, s)
                cols = k // l.size
                t = 'array[0..%d, 0..%d] of %s' % (max(0, 32760 // k - 1), cols - 1, elem)
                return '%s[%s, %s]' % (self.galias(l.off, t, 'a'), self.expr(x), self.expr(y))
        if l.kind == 'idx' and l.scale == l.size and any(o < l.off < o + sz and l.off + l.size == o + sz for o, sz in SIZED_ITEMS):
            # an array with low bound 1 starting right after a typed item: its base folds into the item's last bytes
            elem = force or tname(l.size, s)
            t = 'array[1..%d] of %s' % (max(1, 32760 // l.size), elem)
            return '%s[%s]' % (self.galias(l.off + l.size, t, 'a'), self.expr(l.index))
        if l.kind == 'idx':
            elem = force or ('pointer' if l.size == 4 and self.isptr(l) else tname(l.size, s))
            if l.scale == l.size and l.off < 2 and (2 - l.off) % l.size == 0:
                # array at the very start of the game data: its low bound folds the base below DS:0002
                lb = (2 - l.off) // l.size
                t = 'array[%d..%d] of %s' % (lb, lb + 32760 // l.size - 1, elem)
                return '%s[%s]' % (self.galias(2, t, 'a'), self.expr(l.index))
            if l.scale == l.size:
                t = 'array[0..%d] of %s' % (max(0, 32760 // l.scale - 1), elem)
                return '%s[%s]' % (self.galias(l.off, t, 'a'), self.expr(l.index))
            if l.scale and l.size and l.scale > l.size:
                rt = self.elemrec(l.scale, elem)
                t = 'array[0..%d] of %s' % (max(0, 32760 // l.scale - 1), rt)
                return '%s[%s].f' % (self.galias(l.off, t, 'a'), self.expr(l.index))
            raise LiftError('array element size %s != access %s' % (l.scale, l.size))
        if l.kind == 'deref' and isinstance(l.index, Op) and l.index.op == '+' and isinstance(l.index.args[1], Const) \
                and getattr(l.index, 'disp_after', False):
            # a constant added to the index belongs to the displacement (array start inside the record)
            c_ = l.index.args[1].v
            l = Loc('deref', (l.off + c_) & 0xFFFF, l.size, index=l.index.args[0], scale=l.scale, ptr=l.ptr)
        nd = self.ndim_index(l, True) if l.kind == 'deref' and l.index is not None and l.scale in (None, 1) else None
        if nd is not None:
            # pointer to an N-dimensional byte array; the displacement folds -(lb1*K1 + lb2*K2 + ...)
            terms, esz = nd
            so = (l.off & 0xFFFF) - (0x10000 if l.off & 0x8000 else 0)
            if so <= 0:
                rem, lbs = -so, []
                for x_, k_ in terms:
                    lbs.append(rem // k_)
                    rem %= k_
                ok = all(lbs[i] < terms[i - 1][1] // terms[i][1] for i in range(1, len(terms)))
                if ok:
                    elem = force or tname(1, s)
                    dims = ['%d..%d' % (lbs[0], lbs[0] + 60000 // terms[0][1] - 1)]
                    dims += ['%d..%d' % (lbs[i], lbs[i] + terms[i - 1][1] // terms[i][1] - 1) for i in range(1, len(terms))]
                    rec = 'RN_%s_%s' % ('_'.join('%d' % k for x, k in terms[:-1]), '_'.join('%d' % b for b in lbs))
                    rec += '_' + re.sub(r'\W', '_', elem)
                    if rec not in self.types:
                        self.types[rec] = 'record a: array[%s] of %s end' % (', '.join(dims), elem)
                        self.types['P' + rec] = '^' + rec
                    return '%s.a[%s]' % (self.pd(rec, l.ptr), ', '.join(self.expr(x) for x, k in terms))
        if l.kind == 'deref' and l.index is not None:
            # pointer to an array: es:[di + index + disp]; disp folds the low bound (or a leading pad)
            elem = force or tname(l.size, s)
            sc = l.index
            if type(sc).__name__ == 'MulK':
                k_, x_ = sc.k, sc.x
            elif type(sc).__name__ == 'Scaled':
                k_, x_ = sc.scale, sc.index
            elif isinstance(sc, Op) and sc.op == '*' and isinstance(sc.args[1], Const):
                k_, x_ = sc.args[1].v, sc.args[0]
            else:
                k_, x_ = 1, sc
            if isinstance(sc, Op) and sc.op == '+' and k_ == 1 and len(sc.args) == 2:
                r0 = sc.args[0]
                if type(r0).__name__ == 'MulK' or (isinstance(r0, Op) and r0.op == '*' and isinstance(r0.args[1], Const)):
                    rx, rk = (r0.x, r0.k) if type(r0).__name__ == 'MulK' else (r0.args[0], r0.args[1].v)
                    sz_ = l.size or 1
                    so2 = (l.off & 0xFFFF) - (0x10000 if l.off & 0x8000 else 0)
                    if getattr(r0, 'bycl', False) and rk % sz_ == 0 and so2 < 0 and so2 % rk == 0 and -so2 <= 8 * rk:
                        # rows from lb > 0 (displacement folds -lb*k), variable column
                        elem2 = force or tname(sz_, s)
                        lb = -so2 // rk
                        rec = 'RB%d_%d_%s' % (lb, rk, re.sub(r'\W', '_', elem2))
                        if rec not in self.types:
                            self.types[rec] = 'record a: array[%d..%d, 0..%d] of %s end' % (
                                lb, lb + 60000 // rk - 1, rk // sz_ - 1, elem2)
                            self.types['P' + rec] = '^' + rec
                        return '%s.a[%s, %s]' % (self.pd(rec, l.ptr), self.expr(rx), self.expr(sc.args[1]))
                    if rk % sz_ == 0 and (l.off & 0xFFFF) < 0x8000:
                        elem2 = force or tname(sz_, s)
                        d = l.off & 0xFFFF
                        rec = 'RB%d_%d_%s' % (d, rk, re.sub(r'\W', '_', elem2))
                        if rec not in self.types:
                            pad = '_p: array[1..%d] of byte; ' % d if d else ''
                            self.types[rec] = 'record %sa: array[0..%d, 0..%d] of %s end' % (
                                pad, max(0, (60000 - d) // rk - 1), rk // sz_ - 1, elem2)
                            self.types['P' + rec] = '^' + rec
                        return '%s.a[%s, %s]' % (self.pd(rec, l.ptr), self.expr(rx), self.expr(sc.args[1]))
            so = (l.off & 0xFFFF) - (0x10000 if l.off & 0x8000 else 0)
            if type(sc).__name__ in ('MulK', 'Op') and getattr(sc, 'bycl', False) and k_ > (l.size or 1) and \
                    k_ % (l.size or 1) == 0 and -8 * k_ <= so < k_ * 8:
                # row index scaled by TP itself (mov cl,k / mov dx,k; mul dx): an array of k-byte rows starting at
                # row lb (the displacement folds -lb*k), element d of row x
                sz_ = l.size or 1
                elem2 = force or tname(sz_, s)
                lb = -(so // k_); col = so % k_
                if col % sz_:
                    raise LiftError('row element misaligned')
                rec = 'RB%s_%d_%s' % (('m%d' % -lb) if lb < 0 else lb, k_, re.sub(r'\W', '_', elem2))
                if rec not in self.types:
                    self.types[rec] = 'record a: array[%d..%d, 0..%d] of %s end' % (lb, lb + 60000 // k_ - 1, k_ // sz_ - 1, elem2)
                    self.types['P' + rec] = '^' + rec
                return '%s.a[%s, %d]' % (self.pd(rec, l.ptr), self.expr(x_), col // sz_)
            if l.size and l.size > 1:
                if k_ != l.size:
                    raise LiftError('pointer array index scale %s for %s-byte elements' % (k_, l.size))
                l = Loc('deref', l.off, l.size, index=x_, scale=l.scale, ptr=l.ptr)
            d = l.off & 0xFFFF
            if d < 0x8000:
                rec = 'RA%d_%s' % (d, re.sub(r'\W', '_', elem))
                if rec not in self.types:
                    pad = '_p: array[1..%d] of byte; ' % d if d else ''
                    self.types[rec] = 'record %sa: array[0..%d] of %s end' % (pad, max(0, 32000 // l.size), elem)
                    self.types['P' + rec] = '^' + rec
                return '%s.a[%s]' % (self.pd(rec, l.ptr), self.expr(l.index))
            low = 0x10000 - d
            at = 'AL%d_%s' % (low, re.sub(r'\W', '_', elem))
            if at not in self.types:
                self.types[at] = 'array[%d..%d] of %s' % (low, min(65519, low + 32000), elem)
                self.types['P' + at] = '^' + at
            return '%s[%s]' % (self.pd(at, l.ptr), self.expr(l.index))
        if l.kind == 'deref':
            ft = force or ('pointer' if self.isptr(l) else tname(l.size, s))
            rec = 'R%d_%s' % (l.off, re.sub(r'\W', '_', ft))
            if rec not in self.types:
                pad = '_p: array[1..%d] of byte; ' % l.off if l.off else ''
                self.types[rec] = 'record %sv: %s end' % (pad, ft)
                self.types['P' + rec] = '^' + rec
            return '%s.v' % self.pd(rec, l.ptr)
        raise LiftError('loc kind ' + l.kind)

    def u7(self, x):
        """Dividend whose byte operand is a 0..127 subrange (TP: cbw load, unsigned div)."""
        inner = x.args[0] if isinstance(x, Op) and x.op == 'sext' else x
        def L(l):
            return isinstance(l, Loc) and l.size == 1 and l.kind == 'deref'
        if inner is not x and L(inner):
            self.types['U7'] = '0..127'
            return '(%s)' % self.loc(inner, force='U7') if inner is x else self.loc(inner, force='U7')
        if isinstance(x, Op) and x.op in ('+', '-') and len(x.args) == 2:
            l = x.args[0].args[0] if isinstance(x.args[0], Op) and x.args[0].op == 'sext' else None
            if L(l):
                self.types['U7'] = '0..127'
                return '(%s %s %s)' % (self.loc(l, force='U7'), x.op, self.expr(x.args[1], PREC[x.op] + 1))
        return None

    def strexpr(self, e):
        if isinstance(e, CharStr):
            return self.charexpr(e.c)
        return self.expr(e)

    def charexpr(self, e):
        """Expression in a char context (casts are free in TP: Chr/Ord generate no code)."""
        if isinstance(e, Builtin) and e.name in CHARB:
            v = self.expr(e)
            return v[4:-1]
        if isinstance(e, Loc) and e.size == 1 and e.index is None and (e.kind == 'g' or e.kind == 'l' and e.off < 0):
            # a char-typed view of a plain variable
            try:
                return self.loc_typed(e, 'char')
            except LiftError:
                pass
        return 'Chr(%s)' % self.expr(e)

    def barg(self, a, t=None):
        """Argument of a standard procedure: addresses are untyped var parameters (any variable) unless typed."""
        if type(a).__name__ == 'Width':
            if getattr(a, 'kind', None) == 'char':
                v = self.charexpr(a.v)
            elif t == 'string' and isinstance(a.v, Loc) and a.v.size is None:
                v = self.loc_view(a.v, 'string')
            else:
                v = self.barg(a.v, t)
            if a.w is not None and not (isinstance(a.w, Const) and a.w.v == 0):
                v += ':' + self.expr(a.w)
            return v
        if isinstance(a, Addr):
            if t is None and a.loc.kind == 'g' and a.loc.index is None:
                try:
                    return self.loc_view(a.loc, 'byte')
                except LiftError as ex:
                    m = re.match(r'(\w+) used as byte$', str(ex))
                    if not m:
                        raise
                    return m.group(1)     # untyped var argument: a Text/file/record variable as itself
            return self.loc_view(a.loc, t or 'byte')
        if isinstance(a, TempRef) and a.value is None:
            return self.loc_view(Loc('l', a.off, None), t or 'byte')
        if t == 'char':
            return self.charexpr(a)
        if t == 'integer' and getattr(a, 'size', None) == 2:
            return self.expr(a, 0, True)     # Abs(word expr) would be widened to longint
        return self.expr(a)

    def elemrec(self, size, field):
        n = 'E%d_%s' % (size, field)
        if n not in self.types:
            fs = {'byte': 1, 'shortint': 1, 'word': 2, 'integer': 2, 'longint': 4, 'pointer': 4}[field]
            self.types[n] = 'record f: %s; _r: array[1..%d] of byte end' % (field, size - fs)
        return n

    def varparam(self, p):
        """Index of the untyped var parameter whose address p is (None: an ordinary pointer)."""
        self.vp_owner = self.ctx.pr
        if isinstance(p, Loc) and p.kind in ('l', 'up') and p.off > 0 and p.index is None:
            pr = self.ctx.pr
            if p.kind == 'up':
                # a var parameter of an enclosing procedure (reached through the static link)
                for _ in range(p.depth or 0):
                    pr = pr.parent
            for i, q in enumerate(pr.params):
                if q.off == p.off and getattr(q, 'var', False):
                    self.vp_owner = pr
                    return i
        return None

    def pd(self, t, p):
        """The variable of type t that pointer p points to: PT(p)^, or the typecast T(a) of an untyped var param."""
        i = self.varparam(p)
        if i is not None:
            import skel
            o_ = self.vp_owner
            pl = chr(ord('a') + skel.depth(o_.key, o_.entry))
            return '%s(%s%d)' % (t, pl, i)
        return 'P%s(%s)^' % (t, self.ptr(p))

    def ptr(self, p):
        if self.varparam(p) is not None:
            raise LiftError('address of an untyped var parameter')
        if isinstance(p, Loc) and p.size == 4:
            p2 = Loc(p.kind, p.off, 4, index=p.index, scale=p.scale, ptr=p.ptr, depth=p.depth)
            if p.kind in ('g', 'l', 'up'):
                return self.loc_typed(p2, 'pointer')
            return self.loc(p2, force='pointer')
        if isinstance(p, Call) and p.size == 'longint':
            # a pointer function dereferenced directly; a longint typecast to pointer goes through a 4-byte temp
            import skel
            if (p.target.key, p.target.entry) in skel.PTRRES or self.isptr(p):
                return self.expr(p)
            return 'pointer(%s)' % self.expr(p)
        raise LiftError('pointer expr %r' % (p,))

    def loc_typed(self, l, t):
        if l.kind == 'g':
            return self.galias(l.off, t)
        if l.kind in ('l', 'up'):
            return self.ctx.local_name(l, None, t)
        raise LiftError('typed loc ' + l.kind)

    def ndim_index(self, l, need_bycl=False):
        # flatten i*K1 + j*K2 + ... + z (z unscaled = element index of a byte array); needs 3+ terms
        if not (isinstance(l.index, Op) and l.index.op == '+') or (l.size or 1) != 1:
            return None
        flat, st = [], [l.index]
        while st:
            t = st.pop()
            if isinstance(t, Op) and t.op == '+':
                st.extend(reversed(t.args))
            else:
                flat.append(t)
        terms, plain = [], []
        for t in flat:
            if need_bycl and type(t).__name__ in ('MulK', 'Op') and not getattr(t, 'bycl', False):
                plain.append(t)
            elif type(t).__name__ == 'MulK':
                terms.append((t.x, t.k))
            elif isinstance(t, Op) and t.op == '*' and isinstance(t.args[1], Const):
                terms.append((t.args[0], t.args[1].v))
            else:
                plain.append(t)
        if len(plain) != 1 or len(terms) < 2:
            return None
        terms.sort(key=lambda x: -x[1])
        terms.append((plain[0], 1))
        for i in range(len(terms) - 1):
            if terms[i][1] % terms[i + 1][1] or terms[i][1] == terms[i + 1][1]:
                return None
        return terms, 1

    def galias(self, addr, t, prefix='g'):
        if not (2 <= addr < 0x5958 or 0x59A2 <= addr < 0xA6EC):
            n = TPLVARS.get(addr)
            if n is None:
                # inside a TPL variable: a record view at the offset
                for d in (1, 2, 3):
                    base = TPLVARS.get(addr - d)
                    bt = TPLTYPES.get(base) if base else None
                    SZ = {'byte': 1, 'word': 2, 'integer': 2, 'longint': 4, 'pointer': 4}
                    if bt in ('longint', 'pointer') and t in SZ and d + SZ[t] <= 4:
                        vn = 'PV4_%d_%s' % (d, t)
                        post = '; _r: array[1..%d] of byte' % (4 - d - SZ[t]) if 4 - d - SZ[t] else ''
                        self.types[vn] = 'record _p: array[1..%d] of byte; v: %s%s end' % (d, t, post)
                        return '%s(%s).v' % (vn, base)
                raise LiftError('DS %04X outside game data' % addr)
            have = TPLTYPES.get(n)
            if have == t:
                return n
            if have == 'ovrfunc' and t == 'pointer':
                return '@' + n                        # TP5.5: @procvar is its value, also assignable
            SZ = {'byte': 1, 'shortint': 1, 'boolean': 1, 'char': 1, 'word': 2, 'integer': 2, 'longint': 4, 'pointer': 4, 'ovrfunc': 4}
            if have in SZ and t in SZ:
                if SZ[have] == SZ[t]:
                    return '%s(%s)' % (t, n)          # same-size variable typecast
                if SZ[t] < SZ[have]:
                    vn = 'PV%d_0_%s' % (SZ[have], t)
                    self.types[vn] = 'record v: %s; _r: array[1..%d] of byte end' % (t, SZ[have] - SZ[t])
                    return '%s(%s).v' % (vn, n)
            raise LiftError('%s used as %s' % (n, t))
        for o, sz in SIZED_ITEMS:
            if o < addr < o + sz:
                raise LiftError('DS %04X inside a typed item' % addr)
        if t == 'string':
            if not hasattr(self, 'str_addrs'):
                self.str_addrs = set()
            self.str_addrs.add(addr)
        key = (addr, t)
        for n, (a, tt) in self.globals.items():
            if (a, tt) == key:
                return n
        base = {'byte': 'b', 'shortint': 'sb', 'word': 'w', 'integer': 'i', 'longint': 'l', 'pointer': 'p',
                'real': 'r', 'string': 's'}.get(t, prefix)
        n = '%s%04X' % (base, addr)
        if base == prefix:
            # structured views: the name must identify the type (aliases of all procs share one unit scope)
            import zlib
            n += '_%04x' % (zlib.crc32(t.encode()) & 0xFFFF)
        k = 1
        while n in self.globals:
            k += 1
            n = '%s%04X_%d' % (base, addr, k)
        self.globals[n] = (addr, t)
        return n

    # ---------------- expressions
    def expr(self, e, prec=0, signed=None):
        if isinstance(e, Const) and e.size == 6:
            return real48(e.v)
        if isinstance(e, Const):
            v = e.v
            sg = e.signed or signed is True
            if sg and e.size == 2 and v >= 0x8000:
                v -= 0x10000
            if sg and e.size == 1 and v >= 0x80:
                v -= 0x100
            if e.size == 4 and v >= 0x80000000:
                v -= 0x100000000            # longint is signed: a mask like $FFFF0000
            return str(v)
        if isinstance(e, Loc):
            return self.loc(e, signed)
        if isinstance(e, Lit):
            return pstr(e.text)
        if isinstance(e, SetLit):
            return setlit(e.data)
        if isinstance(e, TempRef):
            if e.value is None:
                # address of a string variable used in place (s := s + ...)
                if e.off >= 0 or e.off < -self.ctx.pr.p['locals']:
                    raise LiftError('empty temp')
                l = Loc('l', e.off, None)
                l.strmax = 255
                return self.loc(l)
            return self.expr(e.value, prec)
        if isinstance(e, Half) and isinstance(e.v, Op) and e.v.op == 'zext32':
            return '0' if e.part == 'hi' else self.expr(e.v.args[0], prec, signed)
        if isinstance(e, Half):
            v = e.v
            if isinstance(v, Loc) and v.kind in ('g', 'l', 'up', 'deref', 'idx') and v.size == 4:
                d = 2 if e.part == 'hi' else 0
                return self.loc(Loc(v.kind, (v.off + d) & 0xFFFF if v.kind != 'l' and v.kind != 'up' else v.off + d, 2,
                                    index=v.index, scale=v.scale, ptr=v.ptr, depth=v.depth), signed)
            if e.part == 'lo':
                return 'Word(%s)' % self.expr(v)
            raise LiftError('high word of an expression')
        if isinstance(e, StrVal):
            return self.expr(e.v, prec)
        if isinstance(e, CharStr):
            return self.charexpr(e.c)
        if isinstance(e, Addr):
            if e.loc.size is None and getattr(e.loc, 'strmax', None) is None:
                # a string operand passed by address
                return self.loc_view(e.loc, 'string')
            return self.loc(e.loc)
        if isinstance(e, Call):
            args = [self.arg(a, p, e.target) for a, p in zip(e.args, e.target.params)]
            n = e.target.name
            return n + ('(%s)' % ', '.join(args) if args else '')
        if type(e).__name__ == 'MulK':
            p = PREC['*']
            r = '%s * %d' % (self.expr(e.x, p, signed), e.k)
            return '(%s)' % r if prec > p else r
        if type(e).__name__ == 'ProcAddr':
            return '@' + e.p.name
        if type(e).__name__ == 'ProcVarCall':
            ps, args = [], []
            for i, a in enumerate(e.args):
                if isinstance(a, Addr) or (isinstance(a, TempRef) and a.value is None):
                    ps.append('var p%d' % i)
                    args.append(self.barg(a, 'byte'))
                else:
                    sz = getattr(a, 'size', 2)
                    t_ = {1: 'byte', 2: 'word', 4: 'longint'}.get(sz)
                    if t_ is None:
                        raise LiftError('proc var argument size')
                    ps.append('p%d: %s' % (i, t_))
                    args.append(self.expr(a))
            tn = 'TPV_' + '_'.join(re.sub(r'\W', '', p_.split(':')[-1] if ':' in p_ else 'var') for p_ in ps)
            rt = {1: 'byte', 2: 'word', 4: 'longint'}.get(e.size)
            if rt:
                tn = 'TFV_%s_' % rt + tn[4:]
                self.types[tn] = 'function(%s): %s' % ('; '.join(ps), rt) if ps else 'function: %s' % rt
            else:
                self.types[tn] = 'procedure(%s)' % '; '.join(ps) if ps else 'procedure'
            fn = self.loc_typed(e.var, tn) if e.var.kind in ('g', 'l', 'up') else self.loc(e.var, force=tn)
            return '%s(%s)' % (fn, ', '.join(args)) if args else fn
        if isinstance(e, Builtin):
            at = getattr(e, 'types', None) or BTYPES.get(e.name, [])
            args = [self.barg(a, at[i] if i < len(at) else None) for i, a in enumerate(e.args)]
            r = e.name + ('(%s)' % ', '.join(args) if args else '')
            return 'Ord(%s)' % r if e.name in CHARB else r
        if isinstance(e, Op):
            op = e.op
            if op in ('sext', 'zext') and isinstance(e.args[0], Op) and e.args[0].op in ('+', '-') and \
                    e.args[0].size == 1 and isinstance(e.args[0].args[1], Const) and e.args[0].args[1].v == 1:
                # inc al / dec al before the extension: arithmetic in the byte type
                x = e.args[0]
                return '%s(%s)' % ('Succ' if x.op == '+' else 'Pred', self.expr(x.args[0], 0, op == 'sext'))
            if op in ('+', '-') and e.size == 1 and getattr(e, 'incs', False) and isinstance(e.args[1], Const) and \
                    e.args[1].v == 1 and getattr(e.args[0], 'size', None) == 1:
                # inc al / dec al: byte arithmetic (x - 1 would be computed in integer: xor ah,ah; dec ax)
                return '%s(%s)' % ('Succ' if op == '+' else 'Pred', self.expr(e.args[0], 0, signed))
            if op == 'toreal':
                return self.expr(e.args[0], prec, signed)
            if op == '/':
                r = '%s / %s' % (self.expr(e.args[0], 2), self.expr(e.args[1], 3))
                return '(%s)' % r if prec > 2 else r
            if op == 'lo8' and isinstance(e.args[0], Op) and getattr(e.args[0], 'u7', False):
                return 'Byte(%s)' % self.expr(e.args[0])      # byte view of an unsigned div/mod result
            if op == 'lo8' and getattr(e.args[0], 'size', None) == 4 and not isinstance(e.args[0], Loc):
                return 'Lo(%s)' % self.expr(e.args[0])        # byte test of a longint expr (or al,al after 32-bit and)
            if op == 'lo8' and isinstance(e.args[0], Op) and e.args[0].size == 2 and e.args[0].op in ('and', 'or', 'xor', 'div', 'mod'):
                return 'Lo(%s)' % self.expr(e.args[0])        # byte test of a word and/or (or al,al after and ax)
            if op in ('zext', 'sext', 'zext32', 'sext32', 'lo8', 'lo16'):
                return self.expr(e.args[0], prec, signed=(op.startswith('s') or None))
            if op == 'rel' and e.signed in ('=z', '<>z') and isinstance(e.args[0], Builtin) and e.args[0].name in BOOLB:
                v = self.expr(e.args[0], 4)
                return v if e.signed == '<>z' else 'not ' + v
            if op == 'rel' and any(self.isptr(a) for a in e.args):
                a, b = e.args
                bs = 'nil' if isinstance(b, Const) and b.v == 0 else self.expr(b, 3)
                as_ = self.loc(a, force='pointer') if isinstance(a, Loc) and a.kind not in ('g', 'l', 'up') else self.expr(a, 3)
                r = '%s %s %s' % (as_, '=' if e.signed.startswith('=') else '<>', bs)
                return '(%s)' % r if prec > 0 else r
            if op == 'rel':
                rel = e.signed
                z = rel.endswith('z')
                r = RELS[rel[:-1] if z else rel]
                sg = None if z else ('s' in rel[-1:] and True or ('u' in rel[-1:] and False or None))
                a = self.expr(e.args[0], 3, signed=sg)
                b = self.expr(e.args[1], 3, signed=sg)
                # byte compares: a byte function result must have the other side's type (else TP widens to word)
                xa, xb = e.args
                for i_, (c_, o_) in enumerate(((xa, xb), (xb, xa))):
                    if isinstance(c_, Call) and c_.size in ('byte', 'shortint') and getattr(o_, 'size', None) == 1 \
                            and not isinstance(o_, Const):
                        want = 'shortint' if (sg or getattr(o_, 'signed', None)) else 'byte'
                        cast = '%s(%s)' % ('ShortInt' if want == 'shortint' else 'Byte', self.expr(c_))
                        if i_ == 0:
                            a = cast
                        else:
                            b = cast
                s = '%s %s %s' % (a, r, b)
                return '(%s)' % s if prec > 0 else s
            if op == 'in':
                sv = self.setv(e.args[1])
                x = e.args[0]
                if sv in CHARSETS:
                    # a set of characters: the element must be a char
                    lv = self.expr(x, 3)
                    lv = lv[4:-1] if lv.startswith('Ord(') and lv.endswith(')') else self.charexpr(x)
                elif isinstance(x, Op) and x.op == 'lo8' and getattr(x.args[0], 'size', None) == 2:
                    lv = 'Byte(%s)' % self.expr(x.args[0])     # word tested against a byte set: mov al,[w]
                else:
                    lv = self.expr(x, 3)
                s = '%s in %s' % (lv, sv)
                return '(%s)' % s if prec > 0 else s
            if op == 'ptr':
                return 'Ptr($%X, %s)' % (e.args[0].v, self.expr(e.args[1]))
            if op == 'odd':
                return 'Odd(%s)' % self.expr(e.args[0])
            if op == 'not':
                return 'not ' + self.expr(e.args[0], 4)
            if op == 'neg':
                x = e.args[0]
                if e.size == 4 and isinstance(x, Op) and x.op in ('zext32', 'sext32'):
                    return '-LongInt(%s)' % self.expr(x.args[0], 0, x.op == 'sext32')
                return '-' + self.expr(x, 4)
            if op == '+' and e.size == 'str' and getattr(e, 'concat', False):
                parts = []
                x = e
                while isinstance(x, Op) and x.op == '+' and x.size == 'str' and getattr(x, 'concat', False):
                    parts.insert(0, x.args[1])
                    x = x.args[0]
                parts.insert(0, x)
                return 'Concat(%s)' % ', '.join(self.strexpr(p_) for p_ in parts)
            if op in ('and', 'or') and e.size == 1 and all(isinstance(a, Op) and a.op in ('rel', 'in', 'and', 'or', 'not', 'odd') or
                                                         isinstance(a, Builtin) and a.name == 'Boolean' for a in e.args):
                p = PREC[op]
                s = (' %s ' % op).join(self.expr(a, p + 1) for a in e.args)
                return '(%s)' % s if prec > p or prec == 0 and False else s
            p = PREC.get(op)
            if p is None:
                raise LiftError('op ' + op)
            if len(e.args) > 2:
                raise LiftError('n-ary ' + op)
            if op in ('div', 'mod') and e.signed is True and signed is None and e.size == 2:
                signed = True       # idiv: integer operands (a word view would compile to xor dx,dx; div)
            a = self.expr(e.args[0], p, signed)
            b = self.expr(e.args[1], p + 1, signed)
            if op in ('div', 'mod') and getattr(e, 'u7', False):
                a = self.u7(e.args[0]) or a
            elif e.signed is False and e.size == 2 and isinstance(e.args[1], Const) and isinstance(e.args[0], Op) and \
                    (op in ('div', 'mod') and e.args[0].op == 'zext' or op == '*' and e.args[0].op == 'sext') and \
                    not getattr(e, 'bycl', False):
                # byte div K / shortint * K: TP computes in integer (idiv/imul); the original's div/mul = a word operand
                a = 'Word(%s)' % self.expr(e.args[0], 0, e.args[0].op == 'sext' or None)
            if e.size == 4:
                # pointer operands of longint arithmetic: LongInt(p) (a same-size typecast, no code)
                if self.isptr(e.args[0]):
                    a = 'LongInt(%s)' % self.expr(e.args[0])
                if self.isptr(e.args[1]):
                    b = 'LongInt(%s)' % self.expr(e.args[1])
            if e.size == 4 and op in ('+', '-', '*', 'div', 'mod'):
                # word/integer operands extended to longint: TP needs the cast to compute in 32 bits
                ext = lambda x: isinstance(x, Op) and x.op in ('zext32', 'sext32')
                sg_ = lambda x: True if x.op == 'sext32' else False
                if ext(e.args[0]):
                    a = 'LongInt(%s)' % self.expr(e.args[0].args[0], 0, sg_(e.args[0]))
                if ext(e.args[1]):
                    b = 'LongInt(%s)' % self.expr(e.args[1].args[0], 0, sg_(e.args[1]))
            if op in ('+', '-', 'and', 'or', 'xor') and e.size == 2:
                # shortint/integer mixed with word arithmetic: TP would widen to longint; cast the word side
                def sx(x, d=0):
                    if type(x).__name__ == 'MulK':
                        return isinstance(x.x, Op) and x.x.op == 'sext'
                    return isinstance(x, Op) and (x.op == 'sext' or x.op in ('*', 'div', 'mod') and x.signed is True or
                                                  x.op == '*' and isinstance(x.args[0], Op) and x.args[0].op == 'sext' and
                                                  isinstance(x.args[1], Const) or
                                                  d < 3 and op in ('and', 'or', 'xor') and
                                                  x.op in ('+', '-') and any(sx(y, d + 1) for y in x.args))
                sa = sx(e.args[0])
                sb = sx(e.args[1])
                def unsigned_word(x):
                    return isinstance(x, Op) and x.op in ('+', '-', '*') and x.size == 2 and not x.signed or \
                        isinstance(x, Loc) and x.size == 2 and not x.signed
                if sa and unsigned_word(e.args[1]):
                    b = 'Integer(%s)' % self.expr(e.args[1])
                elif sb and unsigned_word(e.args[0]):
                    a = 'Integer(%s)' % self.expr(e.args[0])
            s = '%s %s %s' % (a, op, b)
            return '(%s)' % s if prec > p else s
        raise LiftError('expr %r' % (e,))

    def setv(self, s):
        if isinstance(s, SetLit):
            return setlit(s.data)
        if isinstance(s, TempRef) and s.value is not None:
            return self.setv(s.value)
        if isinstance(s, SetCons):
            return '[%s]' % ', '.join('%s..%s' % (self.expr(x[0]), self.expr(x[1])) if isinstance(x, tuple)
                                      else self.expr(x) for x in s.items)
        if isinstance(s, Loc) and s.kind == 'g':
            import skel
            item, k = skel.dsname(s.off)
            if k == 0:
                w = getattr(s, 'setsize', None)
                if w:
                    # declared as bytes (cuts may be shorter than the set): an absolute alias of the set type;
                    # $bctr width word = first byte << 8 | byte count
                    lo, n = w >> 8, w & 0xFF
                    tn = 'TS%d_%d' % (lo, n)
                    self.types[tn] = 'set of %d..%d' % (8 * lo, 8 * (lo + n) - 1)
                    return self.galias(s.off, tn)
                return item           # a typed set constant/variable by its own name
            return self.loc(s)
        raise LiftError('set value')

    def arg(self, a, p, callee=None):
        t = self.ptype(callee, p)
        isaddr = isinstance(a, Addr) or (isinstance(a, TempRef) and a.value is None)
        if not isaddr and t == 'var':
            raise LiftError('value for an untyped var parameter')
        if not isaddr:
            sv = a.value if isinstance(a, TempRef) and a.value is not None else a
            if (t == 'string' or t.startswith('S')) and isinstance(sv, SetLit) and sv.data[:1] in (b'\x00', [0]):
                return "''"          # a pooled constant shared by a set literal and the empty string
            if t in ('shortint', 'integer') and isinstance(a, Const):
                return self.expr(a, 0, True)
            if t == 'pointer' and isinstance(a, Const) and a.v == 0:
                return 'nil'
            if t == 'pointer' and isinstance(a, Const):
                return 'Ptr(%d, %d)' % (a.v >> 16, a.v & 0xFFFF)
            if t in ('pointer', 'longint') and isinstance(a, Loc) and a.size == 4 and a.kind in ('g', 'l', 'up'):
                if a.kind == 'g' or (a.kind == 'l' and a.off < 0):
                    return self.loc_typed(a, t)
                return '%s(%s)' % (t, self.expr(a))
            if t in ('pointer', 'longint') and getattr(a, 'size', None) in (4, 'longint', 'pointer') and not isinstance(a, Const):
                return '%s(%s)' % (t, self.expr(a))
            return self.expr(a)
        loc = a.loc if isinstance(a, Addr) else Loc('l', a.off, None)
        if t == 'var':
            return self.barg(a) if isinstance(a, Addr) else self.loc_view(loc, 'byte')
        if t == 'pointer':
            return '@' + self.loc_view(loc, 'byte')
        if t == 'string' or t.startswith('S'):
            return self.loc_view(loc, 'string')
        if t.startswith('B'):
            return self.loc_view(loc, t)
        raise LiftError('address argument for %s' % t)

    def param_is(self, a, t):
        for p in self.ctx.pr.params:
            if p.off == a.off:
                import skel
                sig = skel.SIGS.get((self.ctx.pr.key, self.ctx.pr.entry))
                return sig and sig[0][self.ctx.pr.params.index(p)] == t
        return False

    def ptype(self, callee, p):
        import skel
        if getattr(callee, 'tail', False):
            return p.ptype
        sig = skel.SIGS.get((callee.key, callee.entry)) if callee else None
        if sig:
            return sig[0][callee.params.index(p)]
        if p.copy:
            return 'string' if p.copy['rtl'] == 0x644 else 'B%d' % p.copy['n']
        if p.size == 4 and getattr(p, 'var', False):
            return 'var'
        if p.size == 4:
            return 'pointer' if 'les' in p.access else 'longint'
        return 'word'

    def loc_view(self, l, t):
        """Location rendered as a variable of type t (for @ and typed references)."""
        if l.kind == 'g':
            return self.galias(l.off, t)
        if l.kind in ('l', 'up'):
            return self.ctx.local_name(l, None, t)
        if l.kind == 'lidx' and l.index is not None and l.scale and l.scale > 1 and t.startswith('string'):
            el = 'string[%d]' % (l.scale - 1)
            n = self.ctx.local_name(Loc('l', l.off, l.scale), None, 'ARRAY ' + el)
            return '%s[%s]' % (n, self.expr(l.index))
        if l.kind == 'lidx' and l.scale in (None, 1) and t.startswith('string') and isinstance(l.index, Op) and \
                l.index.op == '+' and len(l.index.args) == 2:
            # i*rowbytes + j*k: a local two-dimensional array of string[k-1]
            r_, c_ = l.index.args
            if isinstance(c_, Op) and c_.op == '*' and isinstance(c_.args[1], Const):
                c_ = types.SimpleNamespace(k=c_.args[1].v, x=c_.args[0], mulk=True)
            if (type(c_).__name__ == 'MulK' or getattr(c_, 'mulk', False)) and isinstance(r_, Op) and r_.op == '*' and \
                    isinstance(r_.args[1], Const) and r_.args[1].v % c_.k == 0:
                R, k = r_.args[1].v, c_.k
                rt = 'AS%d_%d' % (R, k)
                self.types[rt] = 'array[0..%d] of string[%d]' % (R // k - 1, k - 1)
                # the rows start at index 1 when row 0 would overlap the locals declared below them
                n = self.ctx.local_name(Loc('l', l.off + R, R), None, 'ARRAY1 ' + rt)
                return '%s[%s, %s]' % (n, self.expr(r_.args[0]), self.expr(c_.x))
        if l.kind in ('lidx', 'upidx') and l.index is not None and l.scale and l.scale > 1 and t in self.types \
                and t.startswith('X') and int(t[1:]) == l.scale:
            # element of a local / parent-frame array of k-byte buffers
            base = Loc('l', l.off, l.scale) if l.kind == 'lidx' else Loc('up', l.off, l.scale, depth=l.depth)
            n = self.ctx.local_name(base, None, 'ARRAY ' + t)
            return '%s[%s]' % (n, self.expr(l.index))
        if l.kind == 'idx' and l.index is not None and l.scale and l.scale > 1:
            # element of an array of strings / records / buffers
            k = l.scale
            if t == 'string':
                el = 'string[%d]' % (k - 1) if k <= 256 else None
            elif t == 'byte':
                el = 'array[0..%d] of byte' % (k - 1)
            elif t in self.types and t.startswith('X') and int(t[1:]) == k:
                el = t
            else:
                el = None
            if el:
                at = 'array[0..%d] of %s' % (max(0, 32760 // k - 1), el)
                return '%s[%s]' % (self.galias(l.off, at, 'a'), self.expr(l.index))
        if l.kind in ('idx', 'lidx') and l.scale in (1, 2, 4):
            el = {1: 'byte', 2: 'word', 4: 'longint'}[l.scale]
            if t == 'byte' or {1: 'byte', 2: 'word', 4: 'longint'}.get(l.scale) == t:
                ll = Loc(l.kind, l.off, l.scale, index=l.index, scale=l.scale)
                return self.loc(ll)
        if self.with_tmp(l) is not None:
            return self.with_field(l, t)
        if l.kind == 'mem' and t == 'byte' and isinstance(l.index, Const) and l.ptr is not None and \
                not getattr(l, 'memform', False):
            # a byte array declared absolute at seg:0 (TP computes the index before pushing the segment)
            if not hasattr(self, 'absmem'):
                self.absmem = {}
            o_ = l.ptr
            if type(o_).__name__ == 'AddrOf' and o_.kind == 'imm':
                n = 'M%04X' % l.index.v
                self.absmem[n] = 'array[0..65519] of byte absolute $%X:0' % l.index.v
                return '%s[%d]' % (n, o_.off)
            if isinstance(o_, Op) and o_.op == '+' and len(o_.args) == 2:
                r0 = o_.args[0]
                rk = None
                if isinstance(r0, Op) and r0.op == '*' and isinstance(r0.args[1], Const):
                    rx, rk = r0.args[0], r0.args[1].v
                elif isinstance(r0, Op) and r0.op == '*' and isinstance(r0.args[0], Const):
                    rx, rk = r0.args[1], r0.args[0].v
                elif type(r0).__name__ == 'MulK':
                    rx, rk = r0.x, r0.k
                c1 = o_.args[1]
                if rk and type(c1).__name__ == 'MulK' and c1.k in (2, 4) and rk % c1.k == 0 and not c1.bycl:
                    # rows of rk bytes with TP-scaled k-byte elements (shl): a two-dimensional absolute word array
                    et = {2: 'word', 4: 'longint'}[c1.k]
                    n = 'M%04X_%d_%s' % (l.index.v, rk, et)
                    self.absmem[n] = 'array[0..%d, 0..%d] of %s absolute $%X:0' % (65000 // rk - 1, rk // c1.k - 1, et, l.index.v)
                    return '%s[%s, %s]' % (n, self.expr(rx), self.expr(c1.x))
                if rk:
                    # rows of rk bytes: a two-dimensional absolute array
                    n = 'M%04X_%d' % (l.index.v, rk)
                    self.absmem[n] = 'array[0..%d, 0..%d] of byte absolute $%X:0' % (65000 // rk - 1, rk - 1, l.index.v)
                    return '%s[%s, %s]' % (n, self.expr(rx), self.expr(o_.args[1]))
            n = 'M%04X' % l.index.v
            self.absmem[n] = 'array[0..65519] of byte absolute $%X:0' % l.index.v
            return '%s[%s]' % (n, self.expr(o_))
        if l.kind == 'mem' and t == 'byte':
            return self.loc(Loc('mem', l.off, 1, index=l.index, ptr=l.ptr))
        if l.kind == 'deref' and isinstance(l.index, Const) and l.scale in (None, 1):
            # constant index: a plain displacement
            l = Loc('deref', (l.off + l.index.v) & 0xFFFF, l.size, ptr=l.ptr)
        if l.kind == 'deref' and (l.index is None or t == 'byte'):
            ll = Loc('deref', l.off, 1, ptr=l.ptr, index=l.index, scale=l.scale)
            return self.loc(ll, force=None if t == 'byte' else t)
        raise LiftError('address of %s as %s' % (l.kind, t))

    # ---------------- statements
    def with_index(self, add):
        """Split 'x*k1 [+ y*k2] + c' into ([(x, k), ...], c)."""
        terms, c = [], 0
        stack = [add]
        while stack:
            e = stack.pop()
            if isinstance(e, Op) and e.op == '+':
                stack += e.args[::-1]
            elif isinstance(e, Const):
                c += e.v
            elif isinstance(e, Op) and e.op == '*' and isinstance(e.args[1], Const):
                terms.append((e.args[0], e.args[1].v))
            elif type(e).__name__ == 'MulK':
                terms.append((e.x, e.k))
            elif type(e).__name__ == 'Scaled':
                terms.append((e.index, e.scale))
            else:
                terms.append((e, 1))
        c &= 0xFFFF
        if c >= 0x8000:
            c -= 0x10000
        return terms, c

    def with_target(self, s, tn):
        """Pascal designator the with statement opens: P(p)^ or P(p)^[i] / [i, j] (k-byte elements)."""
        if s.ptr.add is None:
            return self.pd(tn, s.ptr.v), None
        terms, c = self.with_index(s.ptr.add)
        if type(s.ptr.v).__name__ == 'DSBase':
            # a DS array element: an absolute array alias at the constant part (row/element 0 there)
            # (TP5.5 rejects a variable typecast of another size, so an absolute alias of the array type)
            c &= 0xFFFF
            if len(terms) == 1:
                (x, k), = terms
                t = 'array[0..%d] of %s' % (max(1, 32000 // k), tn)
                return '%s[%s]' % (self.galias(c, t, 'a'), self.expr(x)), k
            if len(terms) == 2:
                (x, k1), (y, k) = sorted(terms, key=lambda t: -t[1])
                if k1 % k:
                    raise LiftError('with 2d shape')
                t = 'array[0..%d, 0..%d] of %s' % (max(1, 32000 // k1), k1 // k - 1, tn)
                return '%s[%s, %s]' % (self.galias(c, t, 'a'), self.expr(x), self.expr(y)), k
            raise LiftError('with DS element')
        if len(terms) == 1:
            (x, k), = terms
            if -c % k:
                raise LiftError('with element offset')
            lo = -c // k
            if lo < 0:
                raise LiftError('with element low bound')
            dims = [(lo, lo + max(1, 32000 // k))]
            idx = [x]
        elif len(terms) == 2:
            (x, k1), (y, k) = sorted(terms, key=lambda t: -t[1])
            if k1 % k:
                raise LiftError('with 2d shape')
            cols = k1 // k
            for l1 in range(0, 4):
                rem = -c - l1 * k1
                if rem >= 0 and rem % k == 0 and rem // k < cols:
                    l2 = rem // k
                    break
            else:
                raise LiftError('with 2d bounds')
            dims = [(l1, l1 + max(1, 32000 // k1)), (l2, l2 + cols - 1)]
            idx = [x, y]
        else:
            raise LiftError('with pointer')
        an = 'A' + tn
        self.types[an] = 'array[%s] of %s' % (', '.join('%d..%d' % d for d in dims), tn)
        self.types['P' + an] = '^' + an
        return '%s[%s]' % (self.pd(an, s.ptr.v), ', '.join(self.expr(i) for i in idx)), k

    def with_stmt(self, s, rest, ind):
        from sim import Ptr
        pad = '  ' * ind
        if not isinstance(s.ptr, Ptr):
            raise LiftError('with pointer')
        if not hasattr(self.ctx, 'withs'):
            self.ctx.withs = {}
        saved = self.ctx.withs.get(s.tmp.off)
        self.ctx.withs[s.tmp.off] = {}
        try:
            body = self.stmts(rest, ind + 1)
        finally:
            flds = self.ctx.withs.pop(s.tmp.off, {})
            if saved is not None:
                self.ctx.withs[s.tmp.off] = saved
        tn = 'W%d_%d_%04X' % (len(self.types), -s.tmp.off, self.ctx.pr.entry)
        target, esize = self.with_target(s, tn)
        vs = []
        if esize:
            # open-ended array fields stop at the element's end
            SZ = {'byte': 1, 'shortint': 1, 'word': 2, 'integer': 2, 'longint': 4, 'pointer': 4}
            for n, (off, t) in list(flds.items()):
                m = re.match(r'array\[0\.\.\d+\] of (\w+)$', t)
                if m and m.group(1) in SZ:
                    cnt = (esize - off) // SZ[m.group(1)]
                    if cnt < 1:
                        raise LiftError('with field beyond element')
                    flds[n] = (off, 'array[0..%d] of %s' % (cnt - 1, m.group(1)))
        for i, (n, (off, t)) in enumerate(sorted(flds.items(), key=lambda x: x[1][0])):
            pad_ = '_p%d: array[1..%d] of byte; ' % (i, off) if off else ''
            vs.append('%d: (%s%s: %s)' % (i, pad_, n, t))
        if esize:
            # array elements: the record must have the element's exact size
            vs.append('%d: (_sz: array[1..%d] of byte)' % (len(vs), esize))
        self.types[tn] = 'record case byte of %s end' % '; '.join(vs) if vs else 'record end'
        self.types['P' + tn] = '^' + tn
        hdr = pad + 'with %s do' % target
        return [hdr, pad + 'begin'] + body + [pad + 'end']

    def reopens_tmp(self, st, off):
        """A statement that opens a new with on the same temp (possibly nested inside it)."""
        found = []
        def f(x):
            if type(x).__name__ == 'WithSave' and x.tmp.off == off:
                found.append(x)
        import lift
        lift.walk(st, f)
        return bool(found)

    def saves_tmp(self, st, off):
        """Raw bytes that store a new with pointer into the temp (mov [bp+off],di)."""
        from sim import md
        from capstone import x86
        for ins in md.disasm(self.ctx.code[st.a:st.b], st.a):
            if ins.mnemonic == 'mov' and ins.operands[0].type == x86.X86_OP_MEM and \
                    ins.operands[0].mem.base and ins.reg_name(ins.operands[0].mem.base) == 'bp' and \
                    ins.operands[0].mem.disp == off and ins.op_str.endswith('di'):
                return True
        return False

    def uses_tmp(self, st, off):
        """Does a statement (Pascal IR or raw bytes) use the with temp at bp+off?"""
        if isinstance(st, Raw):
            from sim import md
            from capstone import x86
            code = self.ctx.code
            for ins in md.disasm(code[st.a:st.b], st.a):
                for o in ins.operands:
                    if o.type == x86.X86_OP_MEM and o.mem.base and ins.reg_name(o.mem.base) == 'bp' and \
                            o.mem.disp == off and ins.mnemonic == 'les':
                        return True
            return False
        found = []
        def f(x):
            if isinstance(x, Loc) and (x.kind == 'l' and x.off == off and x.size == 4 or
                                       isinstance(x.ptr, Loc) and x.ptr.kind == 'l' and x.ptr.off == off):
                found.append(x)
        import lift
        lift.walk(st, f)
        return bool(found)

    def stmts(self, ss, ind):
        out = []
        fl = self.flat(ss)
        for i, s in enumerate(fl):
            if type(s).__name__ == 'WithSave':
                rest = fl[i + 1:]
                # the with statement ends with the last statement that still uses its temp (before the temp
                # is opened again by another with)
                stop = next((j for j, x in enumerate(rest) if self.reopens_tmp(x, s.tmp.off)
                             or isinstance(x, Raw) and self.saves_tmp(x, s.tmp.off)), len(rest))
                last = max((j for j, x in enumerate(rest[:stop]) if self.uses_tmp(x, s.tmp.off)), default=-1)
                body, after = rest[:last + 1], rest[last + 1:]
                ls = self.with_stmt(s, body, ind)
                m = getattr(s, 'mark', None)
                if m:
                    out.append('%s{@%04X-%04X}' % ('  ' * ind, m[0], m[1]))
                ls[-1] += ';'
                out += ls
                if after:
                    out += self.stmts(after, ind)
                break
            ls = self.stmt(s, ind)
            ls[-1] += ';'
            m = getattr(s, 'mark', None)
            if m:
                out.append('%s{@%04X-%04X}' % ('  ' * ind, m[0], m[1]))
            out += ls
        return out

    def flat(self, ss):
        """Expand Seq nodes; a Seq whose rendering fails becomes Raw (when it covers a closed byte range)."""
        res = []
        if not hasattr(self.ctx, 'withs'):
            self.ctx.withs = {}
        opened = []
        try:
            self.flat1(ss, res, opened)
        finally:
            for o in opened:
                self.ctx.withs.pop(o, None)
        return res

    def flat1(self, ss, res, opened):
        for s in ss:
            if type(s).__name__ == 'WithSave' and s.tmp.off not in self.ctx.withs:
                self.ctx.withs[s.tmp.off] = {}
                opened.append(s.tmp.off)
            ko = getattr(self.ctx, 'keep_only', None)
            if ko is not None and isinstance(s, Seq) and s.a is not None and not any(s.a <= x < s.b for x in ko):
                self.ctx.raws.append('minimal lift')
                res.append(Raw(s.a, s.b))
                continue
            if isinstance(s, Seq) and s.a is not None and (s.a, s.b) in getattr(self.ctx, 'force_raw', ()):
                res.append(Raw(s.a, s.b))
                continue
            if isinstance(s, Seq):
                n_open = len(opened)
                try:
                    inner = []
                    self.flat1(s.stmts, inner, opened)
                    for x in inner:
                        self.stmt(x, 0)
                    if inner and s.a is not None:
                        inner[0].mark = (s.a, s.b)
                    res += inner
                except LiftError as ex:
                    if s.a is None or not getattr(self.ctx, 'allow_raw', False):
                        raise
                    self.ctx.raws.append('emit: ' + str(ex))
                    for o in opened[n_open:]:
                        self.ctx.withs.pop(o, None)
                    del opened[n_open:]
                    res.append(Raw(s.a, s.b))
            else:
                res.append(s)

    def block(self, ss, ind):
        ss = self.flat(ss)
        if len(ss) == 1 and not isinstance(ss[0], If) and type(ss[0]).__name__ != 'WithSave':
            return self.stmt(ss[0], ind + 1)
        body = self.stmts(ss, ind + 1)
        return [ind * '  ' + 'begin'] + [l for l in sep(body)] + [ind * '  ' + 'end']

    def stmt(self, s, ind):
        pad = '  ' * ind
        if type(s).__name__ == 'WithSave':
            from sim import Ptr
            if not isinstance(s.ptr, Ptr):
                raise LiftError('with pointer')
            if self.varparam(s.ptr.v) is None and type(s.ptr.v).__name__ != 'DSBase':
                self.ptr(s.ptr.v)
            if s.ptr.add is not None:
                t = dict(self.types); g = dict(self.globals)
                try:
                    self.with_target(s, 'WTEST')
                finally:
                    self.types = t; self.globals = g
            return [pad + '{with}']
        if isinstance(s, Assign):
            if isinstance(s.dst, Loc) and s.dst.kind == 'l' and self.ctx.is_result(s.dst):
                import skel
                sig = skel.SIGS.get((self.ctx.pr.key, self.ctx.pr.entry))
                signed = True if sig and sig[1] in ('shortint', 'integer') else None
                rv = self.expr(s.src, 0, signed)
                if sig and sig[1] == 'pointer':
                    if isinstance(s.src, Const) and s.src.v == 0:
                        rv = 'nil'
                    elif not (isinstance(s.src, Loc) and self.isptr(s.src)) and not rv.startswith(('pointer(', 'Ptr(', 'nil', '@')):
                        rv = 'pointer(%s)' % rv
                return [pad + '%s := %s' % (self.ctx.pr.name, rv)]
            pr = self.ctx.pr
            d = s.dst
            if pr.strfunc and isinstance(d, Loc) and d.kind == 'deref' and d.off == 0 and d.index is None and \
                    isinstance(d.ptr, Loc) and d.ptr.kind == 'l' and d.ptr.off == pr.base + pr.retn and \
                    getattr(d, 'strmax', None) is not None:
                if d.strmax != 255:
                    import skel
                    have = STRRES_SEEN.get((pr.key, pr.entry))
                    if have not in (None, d.strmax):
                        raise LiftError('string function result length conflict')
                    STRRES_SEEN[(pr.key, pr.entry)] = d.strmax
                return [pad + '%s := %s' % (pr.name, self.expr(s.src))]
            v = s.src.args[0] if isinstance(s.src, Op) and s.src.op == 'lo16' else s.src
            if isinstance(v, Builtin) and v.name == 'ValL':
                # Val(s, var, code): the RTL returns the value in dx:ax, the store gives the variable's size
                return [pad + 'Val(%s, %s, %s)' % (self.expr(v.args[0]), self.expr(s.dst), self.barg(v.args[1], 'integer'))]
            if isinstance(s.src, Builtin) and s.src.name == 'GetMem':
                d_ = self.loc(s.dst, force='pointer') if isinstance(s.dst, Loc) else self.expr(s.dst)
                return [pad + 'GetMem(%s, %s)' % (d_, self.expr(s.src.args[0]))]
            if isinstance(s.src, IncOp):
                d = self.expr(s.src.dst)
                if self.isptr(s.src.dst):
                    d = 'LongInt(%s)' % d        # Inc/Dec take no pointer in TP 5.5
                if s.src.op == 'inc':
                    return [pad + 'Inc(%s)' % d]
                if s.src.op == 'dec':
                    return [pad + 'Dec(%s)' % d]
                if s.src.op in ('add', 'sub'):
                    return [pad + '%s(%s, %s)' % ('Inc' if s.src.op == 'add' else 'Dec', d, self.expr(s.src.src))]
                raise LiftError('in-place ' + s.src.op)
            d = self.expr(s.dst)
            if d.startswith('Ord(') and d.endswith(']') or d.startswith('Ord(') and d.endswith('])'):
                return [pad + '%s := Chr(%s)' % (d[4:-1], self.expr(s.src))]
            if d.startswith('Length('):
                raise LiftError('string length assignment')
            if self.isptr(s.dst) and isinstance(s.src, Const) and s.src.v == 0:
                return [pad + '%s := nil' % d]
            sv = self.expr(s.src)
            if isinstance(s.src, Addr) and getattr(s.dst, 'size', None) == 4 and not sv.startswith('@'):
                # p := @X  (mov ax,ofs X; mov dx,ds)
                return [pad + '%s := @%s' % (d, sv)]
            if getattr(s.dst, 'size', None) == 4 and not isinstance(s.src, Const):
                dp, sp = self.isptr(s.dst), self.isptr(s.src)
                if dp and not sp:
                    sv = 'Pointer(%s)' % sv
                elif sp and not dp:
                    sv = 'LongInt(%s)' % sv
                elif dp and sp and isinstance(s.dst, Loc) and d.endswith(']') and '_longint' in d:
                    d = self.loc(s.dst, force='pointer')     # pointer element of an array seen as longints
                elif not dp and isinstance(s.src, Loc) and re.match(r'(c\d+\.)?(v\d+p|p[0-9A-F]{4})$', sv) and \
                        not re.search(r'_pointer\b|\bp[0-9A-F]{4}$', d):
                    sv = 'LongInt(%s)' % sv      # a pointer variable stored into a longint slot
            return [pad + '%s := %s' % (d, sv)]
        if isinstance(s, CallS) and isinstance(s.call, Builtin) and s.call.name == 'RecAssign':
            d, src, n = s.call.args
            t = 'X%d' % n.v
            self.types[t] = 'array[0..%d] of byte' % (n.v - 1)
            dl = d.loc if isinstance(d, Addr) else Loc('l', d.off, None)
            sl = src.loc if isinstance(src, Addr) else Loc('l', src.off, None)
            return [pad + '%s := %s' % (self.loc_view(dl, t), self.loc_view(sl, t))]
        if isinstance(s, CallS):
            return [pad + self.expr(s.call)]
        if isinstance(s, Exit):
            return [pad + 'Exit']
        if isinstance(s, If):
            out = [pad + 'if %s then' % self.expr(s.cond)]
            out += self.block(s.then, ind) if s.then else [pad + '  ']
            if s.els:
                out[-1] = out[-1]
                out.append(pad + 'else')
                out += self.block(s.els, ind)
            return out
        if isinstance(s, Raw):
            import skel
            if not hasattr(self.ctx, 'raw_ranges'):
                self.ctx.raw_ranges = []
            if (s.a, s.b) not in self.ctx.raw_ranges:
                self.ctx.raw_ranges.append((s.a, s.b))
            key = self.ctx.key
            code = self.ctx.code
            # TP 5.5 inline() cannot carry relocations or name procedures: raw code must be fixup- and call-free
            if any(s.a <= f < s.b for f, sg in skel.U[key]['fixups']):
                raise LiftError('raw statement with fixup')
            for off, ln, txt in skel.disasm(code, s.a, s.b):
                if code[off] == 0xe8 and ln == 3:
                    raise LiftError('raw statement with near call')
            return [pad + l for l in skel.inline_lines(code[s.a:s.b])]
        if isinstance(s, Case):
            sel_ = self.expr(s.sel)
            if getattr(s, 'bytesel', False) and isinstance(s.sel, Op) and s.sel.op == 'lo8' and \
                    isinstance(s.sel.args[0], Op) and s.sel.args[0].op not in ('zext', 'sext'):
                sel_ = '%s(%s)' % ('ShortInt' if getattr(s, 'signedsel', False) else 'Byte', self.expr(s.sel.args[0]))
            elif getattr(s, 'bytesel', False) and isinstance(s.sel, Op) and s.sel.size == 2:
                # a computed value compared in al: the selector expression was cast to a byte type
                sel_ = '%s(%s)' % ('ShortInt' if getattr(s.sel, 'signed', None) or getattr(s, 'signedsel', False) else 'Byte', sel_)
            out = [pad + 'case %s of' % sel_]
            for items, body in s.arms:
                if getattr(s.sel, 'signed', None):
                    m = 0x80 if s.sel.size == 1 else 0x8000
                    sv = lambda v: v - 2 * m if m <= v < 2 * m else v
                    items = [(sv(it[0]), sv(it[1])) if isinstance(it, tuple) else sv(it) for it in items]
                labs = ', '.join(('%d..%d' % it) if isinstance(it, tuple) else str(it) for it in items)
                bl = self.block(body, ind + 1) if body else [pad + '    ']
                bl[0] = pad + '  ' + labs + ': ' + bl[0].strip()
                if not bl[-1].endswith(';'):      # inline(...); already ends the arm (';;' is an empty arm statement)
                    bl[-1] += ';'
                out += bl
            if s.els:
                out.append(pad + 'else')
                out += [l for l in self.stmts(s.els, ind + 1)]
            out.append(pad + 'end')
            return out
        if isinstance(s, For):
            if getattr(s, 'temp', None) is not None:
                if not hasattr(self.ctx, 'live_for'):
                    self.ctx.live_for = set()
                self.ctx.live_for.add(s.temp.off)
            sg = None
            if isinstance(s.start, Const) and isinstance(s.stop, Const) and getattr(s.var, 'size', None) in (1, 2):
                # constant bounds that run backwards unsigned (254 to 2) are a signed loop (-2 to 2): TP would
                # drop an empty constant loop as dead code
                if (s.start.v > s.stop.v) != bool(s.down):
                    sg = True
            if sg:
                m = 0x80 if s.var.size == 1 else 0x8000
                sv = lambda c: str(c.v - 2 * m if c.v >= m else c.v)
                return [pad + 'for %s := %s %s %s do' % (self.expr(s.var, 0, True), sv(s.start),
                                                         'downto' if s.down else 'to', sv(s.stop))] + self.block(s.body, ind)
            return [pad + 'for %s := %s %s %s do' % (self.expr(s.var), self.expr(s.start), 'downto' if s.down else 'to',
                                                     self.expr(s.stop))] + self.block(s.body, ind)
        if isinstance(s, While):
            c_ = 'true' if isinstance(s.cond, Const) else self.expr(s.cond)
            return [pad + 'while %s do' % c_] + self.block(s.body, ind)
        if isinstance(s, Repeat):
            body = self.stmts(s.body, ind + 1)
            return [pad + 'repeat'] + sep(body) + [pad + 'until %s' % self.expr(s.cond)]
        raise LiftError('stmt %r' % (s,))


def sep(lines):
    """Add ';' between statements (lines that start a statement at the same indent are separated by the caller)."""
    return lines


def real48(v):
    """Pascal literal for a 6-byte Turbo Pascal real (exponent in the low byte)."""
    e = v & 0xFF
    if e == 0:
        return '0.0'
    m = (v >> 8) & ((1 << 39) - 1)
    sign = -1 if v >> 47 & 1 else 1
    x = sign * (1 + m / float(1 << 39)) * 2.0 ** (e - 129)
    r = repr(x)
    if 'e' in r:
        r = '%.12E' % x
    return r if '.' in r or 'E' in r else r + '.0'


def pstr(b):
    if isinstance(b, str):
        b = b.encode('latin-1')
    if not b:
        return "''"
    parts, cur = [], ''
    for c in b:
        if 32 <= c < 127:
            cur += "''" if c == 39 else chr(c)
        else:
            if cur:
                parts.append("'" + cur + "'"); cur = ''
            parts.append('#%d' % c)
    if cur:
        parts.append("'" + cur + "'")
    return ''.join(parts)


def setlit(b):
    els = [i for i in range(256) if b[i >> 3] >> (i & 7) & 1]
    rng = []; i = 0
    while i < len(els):
        j = i
        while j + 1 < len(els) and els[j+1] == els[j] + 1:
            j += 1
        rng.append(str(els[i]) if i == j else '%d..%d' % (els[i], els[j])); i = j + 1
    return '[' + ', '.join(rng) + ']'
