"""Symbolic execution of TP6-generated code: instructions -> expression trees and simple statements.

The machine state holds symbolic values for registers, the dx:ax pair, es:di and the pushed-argument stack.
Statements are emitted at stores and void calls. Anything outside TP6's templates raises LiftError.
"""
import capstone
from capstone import x86
from ir import *

md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_16)
md.detail = True

R = {}
for _n in 'ax bx cx dx si di bp sp es ds ss cs al ah bl bh cl ch dl dh'.split():
    R[getattr(x86, 'X86_REG_' + _n.upper())] = _n
LO = {'al': 'ax', 'bl': 'bx', 'cl': 'cx', 'dl': 'dx'}
HI = {'ah': 'ax', 'bh': 'bx', 'ch': 'cx', 'dh': 'dx'}
JCC = {'je': '=', 'jne': '<>', 'jb': '<u', 'jae': '>=u', 'jbe': '<=u', 'ja': '>u',
       'jl': '<s', 'jge': '>=s', 'jle': '<=s', 'jg': '>s'}
NEG = {'=': '<>', '<>': '=', '<u': '>=u', '>=u': '<u', '<=u': '>u', '>u': '<=u',
       '<s': '>=s', '>=s': '<s', '<=s': '>s', '>s': '<=s'}


def decode(code, a, b):
    out = list(md.disasm(code[a:b], a))
    if not out or out[-1].address + out[-1].size != b:
        raise LiftError('decode %x-%x' % (a, b))
    return out


# ---- machine-level helper values (never appear in final IR)
class Half(E):
    """Low (part='lo') or high (part='hi') 16 bits of a 32-bit value."""
    def __init__(self, v, part):
        self.v, self.part, self.size = v, part, 2


class LinkPtr(E):
    """Static link loaded from [bp+X] (parent frame); depth counts levels up."""
    def __init__(self, depth):
        self.depth = depth


class Ptr(E):
    """Value in es:di: a pointer expression (32-bit) possibly offset by an index added to di."""
    def __init__(self, v, add=None):
        self.v, self.add = v, add


class AddrOf(E):
    """Address computed in di (lea / mov di,imm) awaiting a segment push."""
    def __init__(self, kind, off, index=None, scale=1):
        self.kind, self.off, self.index, self.scale = kind, off, index, scale


class SegPush(E):
    def __init__(self, seg):
        self.seg = seg


class LinkPush(E):
    pass


class Scaled(E):
    """index * scale held in an index register."""
    def __init__(self, index, scale):
        self.index, self.scale = index, scale


class Flags:
    def __init__(self, kind, a=None, b=None, size=2, extra=None):
        self.kind, self.a, self.b, self.size, self.extra = kind, a, b, size, extra
        self.reg = None


def isconst(v, n=None):
    return isinstance(v, Const) and (n is None or v.v == n)


class Sim:
    def __init__(self, ctx):
        self.ctx = ctx
        self.reset()

    def reset(self):
        self.stmt_start = None
        self.idle_after = False
        self.cur_end = None
        self.r = {}            # 16-bit regs and 8-bit halves ('al' ...), 'dxax' 32-bit pair, 'real' (dx:bx:ax)
        self.stack = []
        self.flags = None
        self.out = []
        self.p32 = None        # pending 32-bit store (dst, value)

    def flush_mem(self):
        pm = getattr(self, 'pend_mem', None)
        if pm:
            self.pend_mem = None
            n = len(self.out)
            self.arith(pm[0], pm[3], pm[3].operands)
            if len(self.out) > n:
                self.idle_after = True

    def busy(self):
        self.flush_mem()
        self.flush32()
        return bool(self.stack) or self.p32 is not None

    # ---------------- registers
    def kill(self, r):
        if r in ('ax', 'bx', 'dx') and 'real' in self.r and not getattr(self, 'rst', None) and not getattr(self, 'rpush', ''):
            self.r.pop('real', None)
        if r in ('cx', 'si', 'di') and 'creal' in self.r and r not in ('cx', 'si'):
            pass
        if r == 'esdi':
            self.r.pop('esseg', None)
        for k in list(self.r):
            if k == r or (r in ('ax', 'dx', 'al', 'ah', 'dl', 'dh') and k in ('dxax', 'real')) or (r == 'bx' and k == 'real') or (r in ('bx', 'cx', 'bl', 'bh', 'cl', 'ch') and k == 'bxcx') \
                    or (r in LO and k == LO[r]) or (r in HI and k == HI[r]) \
                    or (r in ('ax', 'bx', 'cx', 'dx') and k in (r[0] + 'l', r[0] + 'h')):
                del self.r[k]

    def set(self, r, v):
        self.kill(r)
        self.r[r] = v

    def get(self, r):
        if r in self.r:
            return self.r[r]
        if r in LO and LO[r] in self.r:
            w = self.r[LO[r]]
            if isinstance(w, Op) and w.op in ('zext', 'sext') and w.args[0].size == 1:
                return w.args[0]
            if isinstance(w, Const):
                return Const(w.v & 0xFF, 1)
            return Op('lo8', [w], 1)
        if r == 'al' and 'dxax' in self.r and 'ax' not in self.r:
            v = self.r['dxax']
            return Const(v.v & 0xFF, 1) if isinstance(v, Const) else Op('lo8', [v], 1)
        if r == 'ax' and 'dxax' in self.r:
            v = self.r['dxax']
            return Const(v.v & 0xFFFF, 2) if isinstance(v, Const) else Half(v, 'lo')
        if r == 'dx' and 'dxax' in self.r:
            v = self.r['dxax']
            return Const(v.v >> 16 & 0xFFFF, 2) if isinstance(v, Const) else Half(v, 'hi')
        raise LiftError('read ' + r)

    # ---------------- operands
    def mem(self, ins, op):
        m = op.mem
        seg, base, idx, disp, size = R.get(m.segment), R.get(m.base), R.get(m.index), m.disp, op.size
        if idx and base == 'bp' and idx in ('di', 'si') and seg in (None, 'ss'):
            v = scaled_of(self.r.get(idx))
            if isinstance(v, Scaled):
                return Loc('lidx', disp, size, index=v.index, scale=v.scale)
            if v is not None and not isinstance(v, (LinkPtr, Ptr, AddrOf)):
                return Loc('lidx', disp, size, index=v, scale=1)
            raise LiftError('local index ' + ins.op_str)
        if idx:
            raise LiftError('index reg ' + ins.op_str)
        if base == 'bp' and seg in (None, 'ss'):
            return Loc('l', disp, size)
        if base is None and seg in (None, 'ds'):
            return Loc('g', disp & 0xFFFF, size)
        if base is None and seg == 'es' and isinstance(self.r.get('esseg'), Const):
            return Loc('mem', disp & 0xFFFF, size, index=self.r['esseg'])
        if base == 'di' and seg == 'es':
            p = self.r.get('esdi')
            if not isinstance(p, Ptr):
                raise LiftError('es:di unknown')
            return Loc('deref', disp, size, ptr=p.v, index=p.add, scale=1)
        if base == 'di' and seg == 'ss':
            v = self.r.get('di')
            if isinstance(v, LinkPtr):
                return Loc('up', disp, size, depth=v.depth)
            if isinstance(v, Op) and v.op == '+' and len(v.args) == 2 and isinstance(v.args[0], LinkPtr):
                # an array in a parent frame: link + index
                sc = scaled_of(v.args[1])
                if isinstance(sc, Scaled):
                    return Loc('upidx', disp, size, index=sc.index, scale=sc.scale, depth=v.args[0].depth)
                if sc is not None and not isinstance(sc, (LinkPtr, Ptr, AddrOf)):
                    return Loc('upidx', disp, size, index=sc, scale=1, depth=v.args[0].depth)
            raise LiftError('ss:di')
        if base in ('di', 'bx', 'si') and seg in (None, 'ds'):
            v = scaled_of(self.r.get(base))
            if isinstance(v, Scaled):
                return Loc('idx', disp & 0xFFFF, size, index=v.index, scale=v.scale)
            if v is not None and not isinstance(v, (LinkPtr, Ptr, AddrOf)):
                return Loc('idx', disp & 0xFFFF, size, index=v, scale=1)
            raise LiftError('index ' + ins.op_str)
        raise LiftError('mem ' + ins.op_str)

    def val(self, ins, op):
        if op.type == x86.X86_OP_IMM:
            return Const(op.imm & (0xFF if op.size == 1 else 0xFFFF), op.size)
        if op.type == x86.X86_OP_REG:
            return self.get(R[op.reg])
        return self.mem(ins, op)

    # ---------------- statements
    def emit(self, s):
        if self.stack:
            raise LiftError('statement with pending pushes %r' % self.stack)
        s.rng = (self.stmt_start, self.cur_end)
        self.out.append(s)

    def flush32(self, ins=None):
        """A pending 32-bit store whose high half never comes: word := longint (truncation)."""
        if not self.p32 or self.p32[1] is None or self.stack:
            return
        pd, pv = self.p32
        if ins is not None and ins.mnemonic == 'mov' and ins.op_str.endswith(', bx' if getattr(self, 'p32hi', None) else ', dx'):
            return
        self.p32 = None; self.p32hi = None
        self.emit(Assign(pd, Op('lo16', [pv], 2)))
        self.idle_after = True

    def store(self, dst, v):
        if self.p32:
            raise LiftError('half 32-bit store')
        if type(v).__name__ == 'ReadChar':
            v.f.tio = getattr(v.f, 'tio', []) + [Addr(dst)]
            v.f.tio_types = getattr(v.f, 'tio_types', []) + ['char']
            return
        self.emit(Assign(dst, v))

    # ---------------- arithmetic helpers
    def binop(self, op, a, b, size):
        return Op(op, [a, b], size)

    # ---------------- main step
    def step(self, ins):
        """Execute one instruction. Returns None, or ('jcc', mnemonic, target), ('jmp', target), ('call', ...)."""
        self.flush32(ins)
        if ins.mnemonic not in ('adc', 'sbb'):
            self.flush_mem()
        if getattr(self, 'stmt_start', None) is None or self.idle_after:
            self.stmt_start = ins.address
            self.idle_after = False
        self.cur_end = ins.address + ins.size
        self.ctx.cur_ins = ins.address
        n = len(self.out)
        self._combined = False
        r = self.step1(ins)
        if (len(self.out) > n or self._combined) and not self.busy():
            self.idle_after = True
        return r

    def step1(self, ins):
        mn, ops = ins.mnemonic, ins.operands
        fx = self.ctx.fixup_in(ins.address, ins.size)
        if fx is not None and mn != 'lcall':
            return self.seg_imm(ins, ops, fx)
        h = getattr(self, 'i_' + mn, None)
        if h is None:
            raise LiftError('insn %s %s' % (mn, ins.op_str))
        return h(ins, ops)

    def seg_imm(self, ins, ops, seg):
        """Instruction with a segment fixup on its immediate: second half of a procedure address."""
        if ins.mnemonic != 'mov' or ops[1].type != x86.X86_OP_IMM:
            raise LiftError('fixup in %s %s' % (ins.mnemonic, ins.op_str))
        d = ops[0]
        if d.type == x86.X86_OP_REG and R[d.reg] == 'dx' and isinstance(self.r.get('ax'), Const):
            p = self.ctx.proc_at(seg, self.r['ax'].v)
            self.kill('ax'); self.kill('dx')
            self.r['dxax'] = ProcAddr(p)
            return
        if d.type == x86.X86_OP_MEM:
            dst = self.mem(ins, d)
            last = self.out[-1] if self.out else None
            if isinstance(last, Assign) and isinstance(last.src, Const) and isinstance(last.dst, Loc) and \
                    last.dst.kind == dst.kind and last.dst.off + 2 == dst.off and last.dst.size == 2:
                p = self.ctx.proc_at(seg, last.src.v)
                ld = last.dst
                self.out[-1] = Assign(Loc(ld.kind, ld.off, 4, index=ld.index, scale=ld.scale, ptr=ld.ptr, depth=ld.depth), ProcAddr(p))
                return
        raise LiftError('segment immediate form')

    def i_mov(self, ins, ops):
        d, s = ops
        if d.type == x86.X86_OP_REG:
            r = R[d.reg]
            if s.type == x86.X86_OP_REG and R[s.reg] in ('es', 'ds', 'ss', 'cs'):
                raise LiftError('seg reg move')
            if r == 'es' and s.type == x86.X86_OP_REG and isinstance(self.r.get(R[s.reg]), Const):
                self.kill('esdi')
                self.r['esseg'] = self.r[R[s.reg]]
                return
            if r in ('es', 'ds', 'ss'):
                raise LiftError('load seg reg')
            if r == 'di' and s.type == x86.X86_OP_IMM:
                self.set('di', AddrOf('imm', s.imm))
                return
            if r == 'di' and s.type == x86.X86_OP_MEM and R.get(s.mem.base) == 'bp' and s.mem.disp in self.ctx.link_offsets:
                self.set('di', LinkPtr(1))
                return
            if r == 'di' and s.type == x86.X86_OP_MEM and R.get(s.mem.base) == 'di' and R.get(s.mem.segment) == 'ss' \
                    and isinstance(self.r.get('di'), LinkPtr) and s.mem.disp in self.ctx.link_offsets:
                self.set('di', LinkPtr(self.r['di'].depth + 1))
                return
            v = self.val(ins, s)
            # mov cx,lo ; mov bx,hi constants -> 32-bit constant second operand
            c = self.r.get('cx')
            if r == 'bx' and isinstance(v, Const) and isinstance(c, Const):
                self.kill('bx')
                self.r['bx'] = v
                self.r['bxcx'] = Const(c.v | v.v << 16, 4)
                return
            # mov cx,[m] ; mov bx,[m+2] -> 32-bit second operand
            if r == 'bx' and isinstance(v, Loc) and isinstance(c, Loc) and c.kind == v.kind and c.off + 2 == v.off \
                    and c.size == 2 == v.size and c.depth == v.depth and repr(c.index) == repr(v.index) \
                    and c.scale == v.scale and repr(c.ptr) == repr(v.ptr):
                self.kill('bx')
                self.r['bx'] = v
                self.r['bxcx'] = Loc(c.kind, c.off, 4, index=c.index, scale=c.scale, ptr=c.ptr, depth=c.depth)
                return
            if r in ('di', 'bx', 'si', 'cx') and isinstance(v, E) and r != 'cx':
                self.set(r, v)
                return
            # mov ax,lo ; mov dx,hi constants -> 32-bit constant
            if r == 'dx' and isinstance(v, Const) and isinstance(self.r.get('ax'), Const) and 'dxax' not in self.r:
                lo = self.r['ax'].v
                self.kill('ax'); self.kill('dx')
                self.r['dxax'] = Const(lo | v.v << 16, 4)
                return
            # mov dx,[m+2] after mov ax,[m] -> 32-bit load
            if r == 'dx' and isinstance(v, Loc) and isinstance(self.r.get('ax'), Loc):
                a = self.r['ax']
                if a.kind == v.kind and (a.off + 2) & 0xFFFF == v.off & 0xFFFF and a.size == 2 == v.size and a.depth == v.depth \
                        and repr(a.index) == repr(v.index) and a.scale == v.scale and \
                        (a.ptr is None or a.ptr is v.ptr or repr(a.ptr) == repr(v.ptr)):
                    self.set('dxax', Loc(a.kind, a.off, 4, index=a.index, scale=a.scale, ptr=a.ptr, depth=a.depth))
                    return
            if r == 'dx' and isinstance(v, Loc) and isinstance(self.r.get('ax'), Loc) and isinstance(self.r.get('bx'), Loc):
                a, b_ = self.r['ax'], self.r['bx']
                if a.kind == b_.kind == v.kind and a.off + 2 == b_.off and b_.off + 2 == v.off and a.index is None:
                    self.kill('ax'); self.kill('bx'); self.kill('dx')
                    self.r['real'] = Loc(a.kind, a.off, 6, ptr=a.ptr, depth=a.depth)
                    return
            if r == 'di' and isinstance(v, (Const, Loc)) and r != 'cx' and 'cx' in self.r and 'si' in self.r:
                c, si = self.r['cx'], self.r['si']
                if isinstance(v, Const) and isinstance(c, Const) and isinstance(si, Const):
                    self.r['creal'] = Const(c.v | si.v << 16 | v.v << 32, 6)
                elif isinstance(v, Loc) and isinstance(c, Loc) and isinstance(si, Loc) and c.off + 2 == si.off and si.off + 2 == v.off:
                    self.r['creal'] = Loc(c.kind, c.off, 6, ptr=c.ptr, depth=c.depth)
            self.set(r, v)
            return
        if s.type == x86.X86_OP_REG and R[s.reg] == 'es':
            # with-pointer save: mov [tmp],di ; mov [tmp+2],es
            dst = self.mem(ins, d)
            p = self.r.get('esdi')
            if self.p32 and self.p32[0].off + 2 == dst.off and isinstance(p, Ptr):
                self.p32 = None
                tmp = Loc(dst.kind, dst.off - 2, 4, depth=dst.depth)
                if tmp.kind != 'l':
                    raise LiftError('with temp kind')
                self.emit(WithSave(tmp, p))
                tmp.at = ins.address
                if not any(t.off == tmp.off for t in self.ctx.temps_for):
                    self.ctx.temps_for.append(tmp)
                return
            raise LiftError('store es')
        dst = self.mem(ins, d)
        if s.type == x86.X86_OP_REG and 'real' in self.r and R[s.reg] in ('ax', 'bx', 'dx') and self.real_store(dst, R[s.reg]):
            return
        if s.type == x86.X86_OP_REG and R[s.reg] == 'di' and isinstance(self.r.get('esdi'), Ptr):
            self.p32 = (dst, None)
            return
        if s.type == x86.X86_OP_REG and R[s.reg] in ('ax',) and 'dxax' in self.r:
            if self.p32:
                raise LiftError('p32 overlap')
            self.p32 = (dst, self.r['dxax'])
            self.p32hi = None
            return
        if s.type == x86.X86_OP_REG and R[s.reg] == 'cx' and 'bxcx' in self.r and not self.p32:
            self.p32 = (dst, self.r['bxcx'])
            self.p32hi = 'bx'
            return
        if s.type == x86.X86_OP_REG and R[s.reg] == 'bx' and self.p32 and getattr(self, 'p32hi', None) == 'bx':
            pd, pv = self.p32
            self.p32 = None; self.p32hi = None
            if pd.kind == dst.kind and pd.off + 2 == dst.off and repr(pd.index) == repr(dst.index):
                self.store(Loc(pd.kind, pd.off, 4, index=pd.index, scale=pd.scale, ptr=pd.ptr, depth=pd.depth), pv)
                return
            raise LiftError('32-bit store mismatch')
        if s.type == x86.X86_OP_REG and R[s.reg] == 'dx' and self.p32 and self.p32[1] is not None:
            pd, pv = self.p32
            self.p32 = None
            if pd.kind == dst.kind and pd.off + 2 == dst.off:
                self.store(Loc(pd.kind, pd.off, 4, index=pd.index, scale=pd.scale, ptr=pd.ptr, depth=pd.depth), pv)
                return
            raise LiftError('32-bit store mismatch')
        v = self.val(ins, s)
        zr = s.type == x86.X86_OP_REG and R[s.reg] == 'ax' and isconst(self.r.get('ax'), 0) and self.p32 is None
        z = getattr(self, 'zero32', None)
        if zr and z is not None and z.kind == dst.kind and z.off + 2 == dst.off and z.index is dst.index and \
                repr(z.ptr) == repr(dst.ptr) and self.out and isinstance(self.out[-1], Assign) and self.out[-1].dst is z:
            last = self.out[-1]
            self.out[-1] = Assign(Loc(dst.kind, dst.off - 2, 4, index=dst.index, scale=dst.scale, ptr=dst.ptr, depth=dst.depth), Const(0, 4))
            self.out[-1].rng = (last.rng[0], ins.address + ins.size) if getattr(last, 'rng', None) else None
            self.zero32 = None
            self._combined = True
            return
        self.store(dst, v)
        self.zero32 = dst if zr else None

    def i_pop(self, ins, ops):
        """pop cx; pop si; pop di: a real pushed earlier (dx, bx, ax) becomes the second real operand."""
        o = ops[0]
        r = R[o.reg] if o.type == x86.X86_OP_REG else None
        # pop cx; pop bx: a saved 32-bit left operand (push dx; push ax) becomes bx:cx
        if r == 'cx' and not getattr(self, 'rpop', '') and self.stack and getattr(self.stack[-1], 'size', None) == 4:
            self.lpop = self.stack.pop()
            self.kill('cx')
            return
        if r == 'bx' and getattr(self, 'lpop', None) is not None:
            v, self.lpop = self.lpop, None
            self.kill('bx')
            self.r['bxcx'] = v
            self.r['cx'] = Half(v, 'lo')
            self.r['bx'] = Half(v, 'hi')
            return
        # pop ax/dx: a value saved across the evaluation of an index (a[f()] := g()) comes back
        if r in ('ax', 'dx') and self.stack and getattr(self.stack[-1], 'size', None) in (1, 2, 'byte', 'word') and \
                not isinstance(self.stack[-1], (SegPush, LinkPush)):
            v = self.stack.pop()
            one = v.size in (1, 'byte')
            self.set(r, Op('zext', [v], 2, False) if one else v)
            if one:
                self.r[r[0] + 'l'] = v
            return
        if r == 'es' and self.stack and not isinstance(self.stack[-1], (SegPush, LinkPush)):
            # pop es: a computed segment (Mem[seg:ofs] / Ptr(seg, ofs))
            self.r['es_val'] = self.stack.pop()
            return
        seq = getattr(self, 'rpop', '') + (r[0] if r in ('cx', 'si', 'di') else '?')
        if not 'csd'.startswith(seq) or not self.stack or getattr(self.stack[-1], 'size', None) != 6:
            raise LiftError('insn pop ' + ins.op_str)
        self.rpop = seq
        if seq == 'csd':
            self.rpop = ''
            self.r['creal'] = self.stack.pop()

    def i_push(self, ins, ops):
        o = ops[0]
        if o.type == x86.X86_OP_REG and R[o.reg] == 'es' and 'es_val' in self.r:
            sp = SegPush('es')
            sp.val = self.r.pop('es_val')
            self.stack.append(sp)
            return
        if o.type == x86.X86_OP_REG and R[o.reg] in ('ss', 'ds', 'cs', 'es'):
            self.stack.append(SegPush(R[o.reg]))
            return
        if o.type == x86.X86_OP_REG and R[o.reg] == 'bp':
            self.stack.append(LinkPush())
            return
        if o.type == x86.X86_OP_MEM and R.get(o.mem.base) == 'bp' and o.mem.disp in self.ctx.link_offsets and o.size == 2:
            self.stack.append(LinkPush())      # sibling call: pass our own static link
            return
        if o.type == x86.X86_OP_REG and R[o.reg] == 'di' and self.stack and isinstance(self.stack[-1], SegPush):
            sp = self.stack.pop()
            di = self.r.get('di')
            self.stack.append(self.address(sp.seg, di, getattr(sp, 'val', None)))
            return
        if o.type == x86.X86_OP_REG and 'real' in self.r and R[o.reg] in ('dx', 'bx', 'ax'):
            seq = getattr(self, 'rpush', '') + R[o.reg][0]
            if 'dba'.startswith(seq):
                self.rpush = seq
                if seq == 'dba':
                    self.rpush = ''
                    self.stack.append(self.r['real'])
                return
        if o.type == x86.X86_OP_REG and R[o.reg] in ('ax', 'bx', 'cx', 'dx') and R[o.reg] not in self.r \
                and R[o.reg][0] + 'l' in self.r and 'dxax' not in self.r:
            self.stack.append(self.r[R[o.reg][0] + 'l'])      # byte argument: mov al,X ; push ax
            return
        v = self.val(ins, o)
        # push hi ; push lo of the same 32-bit value -> one 32-bit argument
        if self.stack and isinstance(v, Half) and v.part == 'lo' and isinstance(self.stack[-1], Half) and \
                self.stack[-1].part == 'hi' and self.stack[-1].v is v.v:
            self.stack[-1] = v.v
            return
        if self.stack and isinstance(self.stack[-1], Half) and self.stack[-1].part == 'hi' and \
                isinstance(self.stack[-1].v, Op) and self.stack[-1].v.op in ('sext32', 'zext32') and \
                (self.stack[-1].v.args[0] is v or repr(self.stack[-1].v.args[0]) == repr(v)):
            # cwd; push dx; push ax: the extended 32-bit value
            self.stack[-1] = self.stack[-1].v
            return
        if self.stack and isinstance(v, Loc) and isinstance(self.stack[-1], Loc) and v.size == 2 and \
                self.stack[-1].kind == v.kind and self.stack[-1].off == v.off + 2 and self.stack[-1].size == 2 and v.index is None:
            self.stack[-1] = Loc(v.kind, v.off, 4, ptr=v.ptr, depth=v.depth)
            return
        if self.stack and isinstance(v, Loc) and isinstance(self.stack[-1], Loc) and v.size == 2 and \
                self.stack[-1].kind == v.kind and self.stack[-1].off == v.off + 2 and self.stack[-1].size == 4 and \
                v.index is None and self.stack[-1].index is None and v.kind in ('l', 'g', 'up') and \
                (v.kind, v.off) in getattr(self.ctx, 'real_slots', set()):
            # push [x+4]; push [x+2]; push [x]: a 6-byte real argument
            self.stack[-1] = Loc(v.kind, v.off, 6, ptr=v.ptr, depth=v.depth)
            return
        self.stack.append(v)

    def address(self, seg, di, segval=None):
        """seg:di pushed -> Addr / literal / temp."""
        if segval is not None:
            l = Loc('mem', 0, 1, index=segval, ptr=di)
            l.memform = True          # Mem[seg:ofs]: segment pushed before the offset is computed
            return Addr(l)
        if seg == 'ds' and isinstance(di, Op) and di.op == '+' and isinstance(di.args[1], Const):
            sc = scaled_of(di.args[0])
            if isinstance(sc, Scaled):
                return Addr(Loc('idx', di.args[1].v, None, index=sc.index, scale=sc.scale))
        if seg == 'ss' and isinstance(di, Op) and di.op == '+' and isinstance(di.args[0], AddrOf) and di.args[0].kind == 'lea':
            sc = scaled_of(di.args[1])
            if isinstance(sc, Scaled):
                return Addr(Loc('lidx', di.args[0].off, None, index=sc.index, scale=sc.scale))
        if seg == 'ss' and isinstance(di, Op) and di.op == '+' and isinstance(di.args[1], Const) and \
                isinstance(di.args[0], Op) and di.args[0].op == '+' and isinstance(di.args[0].args[0], LinkPtr):
            # element of an array in a parent frame
            sc = scaled_of(di.args[0].args[1])
            if isinstance(sc, Scaled):
                c = di.args[1].v
                return Addr(Loc('upidx', c - 0x10000 if c >= 0x8000 else c, None, index=sc.index, scale=sc.scale,
                                depth=di.args[0].args[0].depth))
        if seg == 'cs' and isinstance(di, AddrOf) and di.kind == 'imm':
            return self.ctx.literal(di.off)
        if seg == 'ds' and isinstance(di, AddrOf) and di.kind == 'imm':
            return Addr(Loc('g', di.off, None))
        if seg == 'ds' and isinstance(di, AddrOf) and di.kind == 'idx':
            return Addr(Loc('idx', di.off, None, index=di.index, scale=di.scale))
        if seg == 'ss' and isinstance(di, AddrOf) and di.kind == 'lea':
            return self.ctx.local_addr(di.off)
        if seg == 'ss' and isinstance(di, Op) and di.op == '+' and isinstance(di.args[0], LinkPtr) and \
                isinstance(di.args[1], Const):
            # parent frame variable reached through the static link: mov di,[bp+4]; add di,X
            off = di.args[1].v - (0x10000 if di.args[1].v >= 0x8000 else 0)
            return Addr(Loc('up', off, None, depth=di.args[0].depth))
        if seg == 'ss' and isinstance(di, AddrOf) and di.kind == 'up':
            return Addr(Loc('up', di.off, None, depth=di.index))
        if seg == 'es' and isinstance(self.r.get('esdi'), Ptr) and isinstance(di, EsDi):
            p = self.r['esdi']
            return Addr(Loc('deref', di.off, None, ptr=p.v, index=p.add))
        raise LiftError('push address %s:%r' % (seg, di))

    def i_lea(self, ins, ops):
        d, s = ops
        if R[d.reg] != 'di':
            raise LiftError('lea ' + ins.op_str)
        m = s.mem
        base = R.get(m.base)
        if base == 'bp' and m.index == 0:
            self.set('di', AddrOf('lea', m.disp))
            return
        if base == 'bp' and R.get(m.index) == 'di':
            # lea di,[bp+di+X]: element of a local array (di = index * scale)
            v = scaled_of(self.r.get('di'))
            if v is None:
                raise LiftError('lea local index')
            if not isinstance(v, Scaled):
                v = Scaled(v, 1)
            self.set('di', Op('+', [AddrOf('lea', m.disp), v], 2))
            return
        if base == 'di' and isinstance(self.r.get('di'), LinkPtr):
            self.set('di', AddrOf('up', m.disp, index=self.r['di'].depth))
            return
        if base == 'di' and isinstance(self.r.get('esdi'), Ptr) and R.get(m.segment) in (None, 'es'):
            self.set('di', EsDi(m.disp))
            return
        if base == 'di' and isinstance(self.r.get('di'), Scaled):
            v = self.r['di']
            self.set('di', AddrOf('idx', m.disp & 0xFFFF, index=v.index, scale=v.scale))
            return
        raise LiftError('lea ' + ins.op_str)

    def i_les(self, ins, ops):
        d, s = ops
        if R[d.reg] != 'di':
            raise LiftError('les ' + ins.op_str)
        p = self.mem(ins, s)
        p.size = 4
        self.kill('di')
        self.r['esdi'] = Ptr(p)
        self.r['di'] = EsDi(0)

    def i_xor(self, ins, ops):
        d, s = ops
        # inline Abs(integer): cwd; xor ax,dx; sub ax,dx
        if d.type == x86.X86_OP_REG and s.type == x86.X86_OP_REG and R[d.reg] == 'ax' and R[s.reg] == 'dx':
            v = self.r.get('dxax')
            if isinstance(v, Op) and v.op == 'sext32':
                self.abs_of = v.args[0]
                return
        if d.type == x86.X86_OP_REG and s.type == x86.X86_OP_REG and d.reg == s.reg:
            r = R[d.reg]
            if r in HI:
                lo = HI[r][0] + 'l'
                if lo in self.r:
                    v = self.r[lo]
                    self.set(HI[r], Op('zext', [v], 2, False))
                    return
                raise LiftError('xor %s without low half' % r)
            if r == 'dx' and 'ax' in self.r:
                v = self.r['ax']
                self.kill('ax'); self.kill('dx')
                self.r['dxax'] = Const(v.v, 4) if isinstance(v, Const) else Op('zext32', [v], 4, False)
                return
            if r == 'bx' and isconst(self.r.get('cx')) or (r == 'bx' and 'cx' in self.r):
                self.set('bxcx', Op('zext32', [self.r['cx']], 4, False))
                return
            self.set(r, Const(0, 2 if r not in LO else 1))
            return
        return self.arith('xor', ins, ops)

    def real_store(self, dst, src_reg):
        """mov [x],ax ; mov [x+2],bx ; mov [x+4],dx  with a real in dx:bx:ax."""
        st = getattr(self, 'rst', None)
        if src_reg == 'ax':
            self.rst = (dst, 1)
            return True
        if st and src_reg == 'bx' and st[1] == 1 and st[0].off + 2 == dst.off:
            self.rst = (st[0], 2)
            return True
        if st and src_reg == 'dx' and st[1] == 2 and st[0].off + 4 == dst.off:
            d0 = st[0]
            self.rst = None
            if d0.index is None:
                if not hasattr(self.ctx, 'real_slots'):
                    self.ctx.real_slots = set()
                self.ctx.real_slots.add((d0.kind, d0.off))
            self.store(Loc(d0.kind, d0.off, 6, ptr=d0.ptr, depth=d0.depth, index=d0.index, scale=d0.scale), self.r['real'])
            return True
        return False

    def arith(self, op, ins, ops):
        d, s = ops
        if d.type == x86.X86_OP_REG:
            r = R[d.reg]
            a = self.get(r)
            b = self.val(ins, s)
            if op == 'add' and s.type == x86.X86_OP_REG:
                def km(v):
                    if isinstance(v, MulK):
                        return v.x, v.k
                    if isinstance(v, Scaled):
                        return v.index, v.scale
                    return v, 1
                xa, ka = km(a)
                xb, kb = km(b)
                if (ka > 1 or kb > 1 or R[s.reg] == 'si') and (xa is xb or repr(xa) == repr(xb)):
                    self.set(r, MulK(xa, ka + kb))
                    return
            size = d.size
            if op in ('add', 'sub') and r == 'ax' and 'dxax' not in self.r:
                pass
            if r == 'di' and op == 'add' and isinstance(self.r.get('esdi'), Ptr) and isinstance(a, EsDi):
                p = self.r['esdi']
                nv = b if p.add is None else Op('+', [p.add, b], 2)
                if isinstance(b, Const) and p.add is not None:
                    nv.disp_after = True       # add di,k after add di,index: a displacement, not part of the index
                self.r['esdi'] = Ptr(p.v, nv)
                return
            if r == 'di' and op == 'add' and isinstance(b, Const) and scaled_of(a) is not a:
                self.set('di', Op('+', [a, b], 2))
                return
            v = Op({'add': '+', 'sub': '-', 'and': 'and', 'or': 'or', 'xor': 'xor'}[op], [a, b], size)
            if r in ('ax', 'dx') and 'dxax' in self.r and op in ('add', 'sub', 'adc', 'sbb'):
                raise LiftError('16-bit op on 32-bit pair')
            self.set(r, v)
            self.flags = Flags('val', v, size=size)
            return
        dst = self.mem(ins, d)
        b = self.val(ins, s)
        v = Op({'add': '+', 'sub': '-', 'and': 'and', 'or': 'or', 'xor': 'xor'}[op], [dst, b], d.size)
        self.store(dst, IncOp(op, dst, b))

    def i_add(self, ins, ops):
        d, s = ops
        # 32-bit add: add ax,X ; adc dx,Y
        if d.type == x86.X86_OP_REG and R[d.reg] == 'ax' and 'dxax' in self.r:
            self.pend_add = ('+', self.val(ins, s))
            return
        if d.type == x86.X86_OP_MEM and (s.type == x86.X86_OP_IMM or (s.type == x86.X86_OP_REG and R[s.reg] in ('ax', 'cx'))):
            # possibly the low half of an in-place 32-bit Inc/Dec (completed by adc [m+2])
            lo_ = self.val(ins, s) if s.type == x86.X86_OP_IMM else ('dxax' if R[s.reg] == 'ax' else 'bxcx')
            self.pend_mem = ('add', self.mem(ins, d), lo_, ins)
            return
        return self.arith('add', ins, ops)

    def i_adc(self, ins, ops):
        d, s = ops
        if getattr(self, 'neg32', None) is not None and d.type == x86.X86_OP_REG and R[d.reg] == 'dx' and \
                s.type == x86.X86_OP_IMM and s.imm == 0:
            self.neg32_adc = True
            return
        if d.type == x86.X86_OP_REG and R[d.reg] == 'dx' and getattr(self, 'pend_add', None):
            op, lo = self.pend_add
            self.pend_add = None
            hi = self.val(ins, s)
            b = merge32(lo, hi)
            v = Op(op, [self.r['dxax'], b], 4)
            self.kill('ax'); self.kill('dx')
            self.r['dxax'] = v
            return
        pm = getattr(self, 'pend_mem', None)
        if pm and d.type == x86.X86_OP_MEM and pm[0] == 'add':
            self.pend_mem = None
            op_, lo_dst, lo, _ = pm
            hi_dst = self.mem(ins, d)
            if not (lo_dst.kind == hi_dst.kind and lo_dst.off + 2 == hi_dst.off and repr(lo_dst.index) == repr(hi_dst.index)
                    and repr(lo_dst.ptr) == repr(hi_dst.ptr) and lo_dst.depth == hi_dst.depth):
                raise LiftError('adc halves')
            if lo == 'dxax':
                if not (s.type == x86.X86_OP_REG and R[s.reg] == 'dx' and 'dxax' in self.r):
                    raise LiftError('adc operand')
                b = self.r['dxax']
            elif lo == 'bxcx':
                if not (s.type == x86.X86_OP_REG and R[s.reg] == 'bx'):
                    raise LiftError('adc operand')
                b = self.r.get('bxcx')
                if b is None:
                    c_, b_ = self.r.get('cx'), self.r.get('bx')
                    b = merge32(c_, b_)
            else:
                b = merge32(lo, self.val(ins, s))
            dst = Loc(lo_dst.kind, lo_dst.off, 4, index=lo_dst.index, scale=lo_dst.scale, ptr=lo_dst.ptr, depth=lo_dst.depth)
            self.store(dst, IncOp('add', dst, b))
            return
        raise LiftError('adc')

    def i_sub(self, ins, ops):
        d, s = ops
        if getattr(self, 'abs_of', None) is not None and d.type == x86.X86_OP_REG and s.type == x86.X86_OP_REG \
                and R[d.reg] == 'ax' and R[s.reg] == 'dx':
            x, self.abs_of = self.abs_of, None
            from rtl import Builtin
            self.kill('ax'); self.kill('dx')
            self.set('ax', Builtin('Abs', [x], 2))
            self.r['ax'].signed = True
            return
        if d.type == x86.X86_OP_REG and R[d.reg] == 'ax' and 'dxax' in self.r:
            self.pend_add = ('-', self.val(ins, s))
            return
        if d.type == x86.X86_OP_MEM and (s.type == x86.X86_OP_IMM or (s.type == x86.X86_OP_REG and R[s.reg] in ('ax', 'cx'))):
            # possibly the low half of an in-place 32-bit Inc/Dec (completed by sbb [m+2])
            lo_ = self.val(ins, s) if s.type == x86.X86_OP_IMM else ('dxax' if R[s.reg] == 'ax' else 'bxcx')
            self.pend_mem = ('sub', self.mem(ins, d), lo_, ins)
            return
        return self.arith('sub', ins, ops)

    def i_sbb(self, ins, ops):
        d, s = ops
        if d.type == x86.X86_OP_REG and R[d.reg] == 'dx' and getattr(self, 'pend_add', None):
            op, lo = self.pend_add
            self.pend_add = None
            hi = self.val(ins, s)
            v = Op(op, [self.r['dxax'], merge32(lo, hi)], 4)
            self.kill('ax'); self.kill('dx')
            self.r['dxax'] = v
            return
        pm = getattr(self, 'pend_mem', None)
        if pm and d.type == x86.X86_OP_MEM and pm[0] == 'sub':
            self.pend_mem = None
            op_, lo_dst, lo, _ = pm
            hi_dst = self.mem(ins, d)
            if not (lo_dst.kind == hi_dst.kind and lo_dst.off + 2 == hi_dst.off and repr(lo_dst.index) == repr(hi_dst.index)
                    and repr(lo_dst.ptr) == repr(hi_dst.ptr) and lo_dst.depth == hi_dst.depth):
                raise LiftError('sbb halves')
            if lo == 'dxax':
                if not (s.type == x86.X86_OP_REG and R[s.reg] == 'dx' and 'dxax' in self.r):
                    raise LiftError('sbb operand')
                b = self.r['dxax']
            elif lo == 'bxcx':
                if not (s.type == x86.X86_OP_REG and R[s.reg] == 'bx'):
                    raise LiftError('sbb operand')
                b = self.r.get('bxcx')
                if b is None:
                    c_, b_ = self.r.get('cx'), self.r.get('bx')
                    b = merge32(c_, b_)
            else:
                b = merge32(lo, self.val(ins, s))
            dst = Loc(lo_dst.kind, lo_dst.off, 4, index=lo_dst.index, scale=lo_dst.scale, ptr=lo_dst.ptr, depth=lo_dst.depth)
            self.store(dst, IncOp('sub', dst, b))
            return
        raise LiftError('sbb')

    def i_and(self, ins, ops):
        return self.arith('and', ins, ops)

    def i_or(self, ins, ops):
        d, s = ops
        if d.type == x86.X86_OP_REG and s.type == x86.X86_OP_REG and R[d.reg] == 'ax' and R[s.reg] == 'dx' \
                and 'dxax' in self.r:
            # or ax,dx: a longint tested against zero
            self.flags = Flags('test', self.r['dxax'], size=4)
            return
        if d.type == x86.X86_OP_REG and s.type == x86.X86_OP_REG and d.reg == s.reg:
            self.flags = Flags('test', self.get(R[d.reg]), size=d.size)
            return
        if d.type == x86.X86_OP_REG and R[d.reg] == 'ax' and s.type == x86.X86_OP_MEM and isinstance(self.r.get('ax'), Loc):
            a = self.r['ax']
            b = self.mem(ins, s)
            if a.kind == b.kind and a.off + 2 == b.off:
                # mov ax,[p] ; or ax,[p+2]  -> p = nil test (if a jcc follows) or a plain 'or'
                v = Op('or', [a, b], 2)
                self.set('ax', v)
                self.flags = Flags('test', Loc(a.kind, a.off, 4, ptr=a.ptr, depth=a.depth, index=a.index, scale=a.scale), size=4)
                return
        return self.arith('or', ins, ops)

    def i_cmp(self, ins, ops):
        d, s = ops
        a = self.val(ins, d)
        b = self.val(ins, s)
        self.flags = Flags('cmp', a, b, size=d.size)
        if d.type == x86.X86_OP_REG and s.type == x86.X86_OP_IMM:
            self.flags.reg = R[d.reg]

    def i_inc(self, ins, ops):
        return self.incdec('+', ins, ops)

    def i_dec(self, ins, ops):
        return self.incdec('-', ins, ops)

    def incdec(self, op, ins, ops):
        d = ops[0]
        if d.type == x86.X86_OP_REG:
            r = R[d.reg]
            a = self.get(r)
            # TP emits inc/dec for +-1 and +-2 only: a third inc starts a new addition
            if isinstance(a, Op) and a.op in ('+', '-') and getattr(a, 'incs', False) and isinstance(a.args[1], Const) \
                    and a.args[1].v < 2 and a.op == op:
                k = a.args[1].v * (1 if a.op == '+' else -1) + (1 if op == '+' else -1)
                v = Op('+' if k >= 0 else '-', [a.args[0], Const(abs(k), d.size)], d.size)
            else:
                v = Op(op, [a, Const(1, d.size)], d.size)
            v.incs = True
            self.set(r, v)
            self.flags = Flags('val', v, size=d.size)
            return
        dst = self.mem(ins, d)
        self.store(dst, IncOp('inc' if op == '+' else 'dec', dst, None))

    def i_cwde(self, ins, ops):   # cbw
        v = self.get('al')
        self.set('ax', Op('sext', [v], 2, True))

    def i_cdq(self, ins, ops):    # cwd
        v = self.get('ax')
        self.r.pop('dx', None)
        self.r.pop('dl', None); self.r.pop('dh', None)
        self.set('dxax', Op('sext32', [v], 4, True))

    def i_shl(self, ins, ops):
        return self.shift('shl', ins, ops)

    def i_shr(self, ins, ops):
        return self.shift('shr', ins, ops)

    def shift(self, op, ins, ops):
        d, s = ops
        r = R[d.reg] if d.type == x86.X86_OP_REG else None
        if r is None:
            raise LiftError('shift mem')
        bycl = s.type == x86.X86_OP_REG
        if bycl:
            n = self.r.get('cl') if 'cl' in self.r else self.get('cx')
            byte_count = 'cl' in self.r and 'cx' not in self.r
        else:
            n = self.val(ins, s)
            byte_count = False
        a = self.get(r)
        if r == 'di' and op == 'shl' and isconst(n):
            # array index scaling
            if isinstance(a, Scaled):
                self.set('di', Scaled(a.index, a.scale << n.v))
            else:
                self.set('di', Scaled(a, 1 << n.v))
            return
        if op == 'shr' and not bycl and isconst(n, 1) and r in ('ax', 'al'):
            self.set(r, Op('shr', [a, n], d.size))
            self.flags = Flags('odd', a)
            return
        if op == 'shl' and isconst(n) and (not bycl or byte_count):
            # 'shl r,1' and 'mov cl,k; shl r,cl' come from multiplications by constants (TP strength reduction)
            self.set(r, mulconst(a, 1 << n.v))
            return
        if op == 'shr' and isconst(n) and bycl and byte_count:
            # 'mov cl,k; shr r,cl': unsigned division by 2^k
            self.set(r, Op('div', [a, Const(1 << n.v, d.size)], d.size, False))
            return
        self.set(r, Op(op, [a, n], d.size))

    def i_mul(self, ins, ops):
        s = ops[0]
        b = self.val(ins, s)
        a = self.get('ax' if s.size == 2 else 'al')
        if s.size == 2:
            # TP: word * word in ax (dx unused; longint products go through the RTL)
            self.kill('dx')
            if isinstance(b, Const):
                self.set('ax', Op('*', [a, b], 2, False))
            else:
                self.set('ax', Op('*', [a, b], 2, False))
            return
        raise LiftError('mul8')

    def i_div(self, ins, ops):
        return self.divide(ins, ops, False)

    def i_idiv(self, ins, ops):
        return self.divide(ins, ops, True)

    def divide(self, ins, ops, signed):
        s = ops[0]
        b = self.val(ins, s)
        if s.size != 2 or 'dxax' not in self.r:
            raise LiftError('div form')
        num = self.r['dxax']
        if not (isinstance(num, Op) and num.op in ('sext32', 'zext32')):
            raise LiftError('div of 32-bit')
        a = num.args[0]
        self.kill('dx')
        self.r['ax'] = Op('div', [a, b], 2, signed)
        self.r['dx'] = Op('mod', [a, b], 2, signed)
        if num.op == 'sext32' and not signed:
            # cwd + div: a 0..127 subrange operand (loaded with cbw, divided unsigned)
            self.r['ax'].u7 = self.r['dx'].u7 = True

    def i_xchg(self, ins, ops):
        a, b = R[ops[0].reg], R[ops[1].reg]
        va, vb = self.r.get(a), self.r.get(b)
        self.kill(a); self.kill(b)
        if vb is not None: self.r[a] = vb
        if va is not None: self.r[b] = va

    def i_not(self, ins, ops):
        r = R[ops[0].reg]
        self.set(r, Op('not', [self.get(r)], ops[0].size))

    def i_neg(self, ins, ops):
        r = R[ops[0].reg]
        # 32-bit negation: neg ax; adc dx,0; neg dx
        if r == 'ax' and 'dxax' in self.r:
            self.neg32 = self.r['dxax']
            return
        if r == 'dx' and getattr(self, 'neg32_adc', False):
            v = self.neg32
            self.neg32 = None; self.neg32_adc = False
            self.kill('ax'); self.kill('dx')
            self.r['dxax'] = Op('neg', [v], 4, True)
            return
        self.set(r, Op('neg', [self.get(r)], ops[0].size))

    def i_setbool(self, ins, ops):
        from cfg import flag_cond
        from rtl import Builtin
        if self.flags is None:
            raise LiftError('setbool without test')
        inv = {'je': 'jne', 'jne': 'je', 'jb': 'jae', 'jae': 'jb', 'jbe': 'ja', 'ja': 'jbe',
               'jl': 'jge', 'jge': 'jl', 'jle': 'jg', 'jg': 'jle'}
        c = flag_cond(self.flags, inv[ins.jcc])
        self.flags = None
        self.set('ax', Op('zext', [Builtin('Ord', [c], 1)], 2, False))

    def i_in(self, ins, ops):
        if ops[0].type != x86.X86_OP_REG or R[ops[0].reg] != 'al' or ops[1].type != x86.X86_OP_REG:
            raise LiftError('in form')
        self.set('al', Loc('port', 0, 1, index=self.get('dx')))

    def i_out(self, ins, ops):
        port = self.get('dx')
        v = self.get('al')
        self.emit(Assign(Loc('port', 0, 1, index=port), v))

    def i_jmp(self, ins, ops):
        return ('jmp', ops[0].imm)

    def i_ret(self, ins, ops):
        raise LiftError('ret in body')


class ProcAddr(E):
    """@Proc (far pointer to a procedure; segment relocated)."""
    def __init__(self, p):
        self.p, self.size = p, 4


class IncOp(E):
    """In-place update of memory: inc/dec/add/sub/and/or/xor dst, src."""
    def __init__(self, op, dst, src):
        self.op, self.dst, self.src, self.size = op, dst, src, dst.size


class WithSave(S):
    def __init__(self, tmp, ptr):
        self.tmp, self.ptr = tmp, ptr


class EsDi(E):
    """di relative to the es:di pointer (with disp)."""
    def __init__(self, off):
        self.off = off


def scaled_of(v):
    """Index register value -> Scaled(index, scale) when it is index*constant."""
    if isinstance(v, Scaled):
        return v
    if isinstance(v, MulK):
        return Scaled(v.x, v.k)
    if isinstance(v, Op) and v.op == '*' and len(v.args) == 2 and isinstance(v.args[1], Const):
        return Scaled(v.args[0], v.args[1].v)
    if isinstance(v, Op) and v.op == '*' and len(v.args) == 2 and isinstance(v.args[0], Const):
        return Scaled(v.args[1], v.args[0].v)
    return v


class MulK(E):
    """x * k produced by TP's strength reduction (shl / save in si / add)."""
    def __init__(self, x, k):
        self.x, self.k, self.size = x, k, 2


def mulconst(a, k):
    if isinstance(a, MulK):
        return MulK(a.x, a.k * k)
    return MulK(a, k)


def merge32(lo, hi):
    if isinstance(lo, Const) and isinstance(hi, Const):
        return Const(lo.v | hi.v << 16, 4)
    if isinstance(lo, Loc) and isinstance(hi, Loc) and lo.kind == hi.kind and (lo.off + 2) & 0xFFFF == hi.off & 0xFFFF \
            and repr(lo.index) == repr(hi.index) and lo.scale == hi.scale and repr(lo.ptr) == repr(hi.ptr) \
            and lo.depth == hi.depth:
        return Loc(lo.kind, lo.off, 4, index=lo.index, scale=lo.scale, ptr=lo.ptr, depth=lo.depth)
    if isinstance(lo, Half) and isinstance(hi, Half) and lo.v is hi.v:
        return lo.v
    # cwd/cdq of the low word: the high half is its sign/zero extension
    if isinstance(hi, Half) and hi.part == 'hi' and isinstance(hi.v, Op) and hi.v.op in ('sext32', 'zext32') and \
            (hi.v.args[0] is lo or repr(hi.v.args[0]) == repr(lo)):
        return hi.v
    if isinstance(hi, Const) and getattr(lo, 'size', None) == 2:
        # a constant segment and a word offset pushed as one pointer: Ptr(seg, ofs)
        return Op('ptr', [hi, lo], 4)
    raise LiftError('merge32 %r %r' % (lo, hi))


for _jcc in JCC:
    setattr(Sim, 'i_' + _jcc, lambda self, ins, ops, _j=_jcc: ('jcc', _j, ops[0].imm))


# ---------------- calls
def pop_args(self, sizes, callee=None):
    """Pop arguments for parameter sizes (Pascal order) from the push stack."""
    args = []
    for k, sz in enumerate(reversed(sizes)):
        if sz == 2 and self.stack and callee is not None and isinstance(self.stack[-1], Loc) and \
                self.stack[-1].size == 4 and k + 1 < len(sizes) and list(reversed(sizes))[k + 1] == 2:
            import prog
            pi = len(sizes) - 1 - k
            if (callee.key, callee.entry, callee.params[pi - 1].off) in prog.NOMERGE or \
                    (callee.key, callee.entry, callee.params[pi].off) in prog.NOMERGE:
                # two word parameters fed from the halves of one 32-bit variable (push [x+2]; push [x])
                v4 = self.stack.pop()
                lo = Loc(v4.kind, v4.off, 2, index=v4.index, scale=v4.scale, ptr=v4.ptr, depth=v4.depth)
                hi = Loc(v4.kind, (v4.off + 2) & 0xFFFF if v4.kind not in ('l', 'up') else v4.off + 2, 2,
                         index=v4.index, scale=v4.scale, ptr=v4.ptr, depth=v4.depth)
                self.stack.append(hi)
                self.stack.append(lo)
        if sz == 2 and self.stack and callee is not None and (isinstance(self.stack[-1], (Addr, Lit, SetLit, TempRef)) or getattr(self.stack[-1], 'size', None) == 4):
            # a 32-bit argument where the callee layout has two words: ask for a merged slot
            pi = len(sizes) - 1 - k
            p = callee.params[pi]
            import prog
            prog.MERGE_REQ.add((callee.key, callee.entry, p.off))
            raise LiftError('4-byte value for a 2-byte parameter (merge requested)')
        if not self.stack:
            raise LiftError('missing argument')
        v = self.stack.pop()
        if sz == 4 and not (isinstance(v, (Addr, Lit, SetLit, TempRef)) or getattr(v, 'size', None) == 4):
            # two pushed words: hi first, then lo
            if not self.stack:
                raise LiftError('missing hi word')
            hi = self.stack.pop()
            try:
                v = merge32(v, hi)
            except LiftError:
                # two unrelated words: the callee's 4-byte slot was a wrong merge
                import prog
                if callee is not None:
                    pi = len(sizes) - 1 - k
                    key = (callee.key, callee.entry, callee.params[pi].off)
                    if key in prog.MERGE:
                        prog.UNMERGE.add(key)
                raise
        if sz == 2 and (isinstance(v, (Addr, Lit, SetLit, TempRef)) or getattr(v, 'size', None) == 4):
            raise LiftError('4-byte value for a 2-byte parameter')
        if isinstance(v, (SegPush, LinkPush)):
            raise LiftError('bad argument')
        args.append(v)
    return list(reversed(args))


def do_call(self, callee, at):
    """User procedure call (far or near)."""
    if callee.nested:
        if not self.stack or not isinstance(self.stack[-1], LinkPush):
            raise LiftError('nested call without link')
        self.stack.pop()                 # the static link is pushed last
    args = self.pop_args([p.size for p in callee.params], callee)
    res = None
    if callee.strfunc:
        if not self.stack or not isinstance(self.stack[-1], TempRef):
            raise LiftError('string function without temp')
        t = self.stack[-1]
        t.value = Call(callee, args, 'str')
        res = t
    c = Call(callee, args, callee.result)
    for r in ('ax', 'bx', 'cx', 'dx', 'si', 'di', 'esdi'):
        self.kill(r)
    if callee.result == 'byte':
        self.r['al'] = c
    elif callee.result == 'word':
        self.r['ax'] = c
    elif callee.result == 'longint':
        self.r['dxax'] = c
    elif callee.result == 'real':
        self.r['real'] = c
    elif not callee.strfunc:
        self.emit(CallS(c))


class ProcVarCall(E):
    """Call through a procedure variable: lcall [var] with the pushed arguments."""
    def __init__(self, var, args):
        self.var, self.args, self.size = var, args, None


def i_lcall(self, ins, ops):
    if ops[0].type == x86.X86_OP_MEM:
        var = self.mem(ins, ops[0])
        var = Loc(var.kind, var.off, 4, index=var.index, scale=var.scale, ptr=var.ptr, depth=var.depth)
        args = []
        while self.stack:
            v = self.stack.pop()
            if isinstance(v, (SegPush, LinkPush)):
                raise LiftError('proc var argument')
            args.insert(0, v)
        for r in ('ax', 'bx', 'cx', 'dx', 'si', 'di', 'esdi'):
            self.kill(r)
        self.emit(CallS(ProcVarCall(var, args)))
        return
    kind, t, ofs = self.ctx.far(ins.address)
    if kind == 'proc':
        return self.do_call(t, ins.address)
    if kind == 'tpl':
        return self.ctx.tpl_call(self, t)
    return self.ctx.rtl_call(self, t)


def i_call(self, ins, ops):
    t = ops[0].imm
    callee = self.ctx.near(t)
    if callee.far:
        if not self.stack or not isinstance(self.stack[-1], SegPush) or self.stack[-1].seg != 'cs':
            raise LiftError('far proc near-called without push cs')
        self.stack.pop()
    return self.do_call(callee, ins.address)


class TempRef(E):
    """Address of a stack temporary (lea di,[bp-X]; push ss; push di) whose value is built by RTL string ops."""
    def __init__(self, off):
        self.off, self.value, self.size = off, None, 'str'


Sim.pop_args = pop_args
Sim.do_call = do_call
Sim.i_lcall = i_lcall
Sim.i_call = i_call
