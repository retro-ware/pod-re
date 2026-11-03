"""IR for the TP6 lifter: expressions, storage locations and statements."""


class LiftError(Exception):
    pass


class E:
    """Expression. size: 1, 2, 4, 6 (real), 'str', 'set'; signed: True/False/None (unknown)."""
    size = 2
    signed = None

    def __repr__(self):
        return '%s(%s)' % (type(self).__name__, ', '.join('%s=%r' % kv for kv in vars(self).items()))


class Const(E):
    def __init__(self, v, size=2, signed=None):
        self.v, self.size, self.signed = v, size, signed


class Lit(E):
    """String literal in the code segment (offset into the unit)."""
    def __init__(self, off, text):
        self.off, self.text, self.size = off, text, 'str'


class SetLit(E):
    def __init__(self, off, data):
        self.off, self.data, self.size = off, data, 'set'


class Loc(E):
    """Storage. kind: g (DS address), l (bp offset, own frame), up (parent frame via static link: depth, offset),
    idx (array: base Loc-ish address + index*scale), deref (pointer expression ^ + disp), with (with-temp + disp)."""
    def __init__(self, kind, off, size, index=None, scale=None, ptr=None, depth=0, signed=None):
        self.kind, self.off, self.size, self.index, self.scale, self.ptr, self.depth = kind, off, size, index, scale, ptr, depth
        self.signed = signed

    def key(self):
        return (self.kind, self.off, self.depth, self.size)


class Op(E):
    """op: + - * div mod and or xor shl shr not neg  = <> < <= > >=  in  zext sext  hi lo  addr  str+ ..."""
    def __init__(self, op, args, size=2, signed=None):
        self.op, self.args, self.size, self.signed = op, list(args), size, signed


class Call(E):
    def __init__(self, target, args, size=None, far=True, nested=False):
        self.target, self.args, self.size, self.far, self.nested = target, list(args), size, far, nested


class Rtl(E):
    """Call of a System routine (by IDA name)."""
    def __init__(self, name, args, size=None):
        self.name, self.args, self.size = name, list(args), size


class Addr(E):
    """Far address of a location (pushed seg + offset): var parameter, string pointer."""
    def __init__(self, loc):
        self.loc, self.size = loc, 4


class Temp(E):
    """A stack temporary (string expression result) at bp offset."""
    def __init__(self, off, size='str'):
        self.off, self.size, self.value = off, size, None


# ---- statements
class S:
    def __repr__(self):
        return '%s(%s)' % (type(self).__name__, ', '.join('%s=%r' % kv for kv in vars(self).items()))


class Assign(S):
    def __init__(self, dst, src):
        self.dst, self.src = dst, src


class CallS(S):
    def __init__(self, call):
        self.call = call


class If(S):
    def __init__(self, cond, then, els=None):
        self.cond, self.then, self.els = cond, then, els


class While(S):
    def __init__(self, cond, body):
        self.cond, self.body = cond, body


class Repeat(S):
    def __init__(self, body, cond):
        self.body, self.cond = body, cond


class For(S):
    def __init__(self, var, start, stop, down, body):
        self.var, self.start, self.stop, self.down, self.body = var, start, stop, down, body


class Case(S):
    def __init__(self, sel, arms, els):
        self.sel, self.arms, self.els = sel, arms, els   # arms: [([labels], body)]; label = v or (lo, hi)


class Exit(S):
    pass


class With(S):
    def __init__(self, ptr, body):
        self.ptr, self.body = ptr, body


class Raw(S):
    """Instruction range kept as bytes (asm fallback)."""
    def __init__(self, a, b):
        self.a, self.b = a, b


class Seq(S):
    """Statements lifted from the byte range [a, b): rendered together, or as Raw if rendering fails."""
    def __init__(self, stmts, a, b):
        self.stmts, self.a, self.b = stmts, a, b
