"""Semantics of System RTL and TPL unit calls for the simulator."""
from ir import *
from sim import Flags, TempRef, Half, merge32


class Builtin(E):
    """Pascal standard function/procedure call: name, args. kind: 'proc' or result size."""
    def __init__(self, name, args, size=None):
        self.name, self.args, self.size = name, list(args), size


def need(sim, n):
    if len(sim.stack) < n:
        raise LiftError('rtl stack underflow')


def pop(sim):
    return sim.stack.pop()


def temp_value(v):
    if isinstance(v, TempRef) and v.value is None:
        # lea di,[bp-X] of a local string variable (not a temporary)
        l = Loc('l', v.off, None)
        l.strmax = 255
        return l
    return v.value if isinstance(v, TempRef) else v


def untyped_addr(sim, d):
    """An untyped var argument pushed as seg, ofs words: a constant segment gives Mem[seg:ofs]."""
    if isinstance(d, (Addr, TempRef)) or getattr(d, 'size', None) == 4:
        return d
    if sim.stack and isinstance(sim.stack[-1], Const):
        seg = sim.stack.pop()
        return Addr(Loc('mem', 0, 1, index=seg, ptr=d))
    return d


def stmt(sim, name, args):
    sim.emit(CallS(Builtin(name, args)))


def kill(sim):
    for r in ('ax', 'bx', 'cx', 'dx', 'si', 'di', 'esdi'):
        sim.kill(r)


def rtl_call(sim, name):
    st = sim.stack
    kill_after = True
    if name == '@$basg$qm3Anyt14Word':                  # structured assignment dst := src (size n)
        need(sim, 3)
        n, d, src = pop(sim), pop(sim), pop(sim)
        kill(sim)
        if not isinstance(n, Const) or not isinstance(d, (Addr, TempRef)) or not isinstance(src, (Addr, TempRef)):
            raise LiftError('record assign')
        sim.emit(CallS(Builtin('RecAssign', [d, src, n])))
        return
    if name == '@$basg$qm6Stringt1':                    # StrLoad(dest temp, src): dest stays pushed
        need(sim, 2)
        src = pop(sim)
        t = st[-1]
        if not isinstance(t, TempRef):
            raise LiftError('StrLoad into non-temp')
        t.value = src
        kill(sim)
        return
    if name == '@$basg$qm6Stringt14Byte':               # StrStore(src, dst, max)
        need(sim, 3)
        mx, dst, src = pop(sim), pop(sim), pop(sim)
        kill(sim)
        if isinstance(dst, TempRef) and dst.value is None:
            dst = Addr(Loc('l', dst.off, None))
        if not isinstance(dst, Addr) or not isinstance(mx, Const):
            raise LiftError('StrStore dst')
        loc = dst.loc
        loc.strmax = mx.v
        sim.emit(Assign(loc, StrVal(temp_value(src), mx)))
        return
    if name == '@Concat$qm6Stringt1':
        need(sim, 2)
        src = pop(sim)
        t = st[-1]
        if not isinstance(t, TempRef) or t.value is None:
            raise LiftError('concat')
        prev = t.value
        t.value = Op('+', [prev, temp_value(src)], 'str')
        # Concat(a, b) allocates its temps in source order, a + b the other way round
        if isinstance(src, TempRef) and src.value is not None:
            t.value.concat = src.off < t.off
            if isinstance(prev, Op) and prev.op == '+' and getattr(prev, 'concat', None) is not None:
                t.value.concat = t.value.concat and prev.concat
        kill(sim)
        return
    if name == '@$basg$qm6String4Char':                 # char -> string temp
        need(sim, 2)
        c = pop(sim)
        t = st[-1]
        if not isinstance(t, TempRef):
            raise LiftError('chr->str')
        t.value = CharStr(c)
        kill(sim)
        return
    if name == '@$bsub$qm6Stringt1':                    # string compare
        need(sim, 2)
        b, a = pop(sim), pop(sim)
        kill(sim)
        sim.flags = Flags('cmp', temp_value(a), temp_value(b), size='str')
        return
    if name == '@Copy$qm6Stringt17Integert3':
        need(sim, 4)
        n, i, s = pop(sim), pop(sim), pop(sim)
        t = st[-1]
        if not isinstance(t, TempRef):
            raise LiftError('copy')
        t.value = Builtin('Copy', [temp_value(s), i, n], 'str')
        kill(sim)
        return
    if name == '@Pos$qm6Stringt1':
        need(sim, 2)
        s, sub = pop(sim), pop(sim)
        kill(sim)
        sim.r['ax'] = Builtin('Pos', [temp_value(sub), temp_value(s)], 2)
        return
    if name == '@Insert$qm6Stringt14Word7Integer':
        need(sim, 4)
        idx, mx, dst, src = pop(sim), pop(sim), pop(sim), pop(sim)
        kill(sim)
        b = Builtin('Insert', [temp_value(src), dst, idx])
        if isinstance(mx, Const):
            b.types = [None, 'string' if mx.v == 255 else 'string[%d]' % mx.v]
        sim.emit(CallS(b))
        return
    if name == '@Delete$qm6String7Integert2':
        need(sim, 3)
        n, i, s = pop(sim), pop(sim), pop(sim)
        kill(sim)
        stmt(sim, 'Delete', [s, i, n])
        return
    if name == '@Move$qm3Anyt14Word':
        need(sim, 3)
        n, d = pop(sim), pop(sim)
        d = untyped_addr(sim, d)
        s = untyped_addr(sim, pop(sim))
        kill(sim)
        stmt(sim, 'Move', [s, d, n])
        return
    if name == '@FillChar$qm3Any4Word4Byte':
        need(sim, 3)
        v, n, d = pop(sim), pop(sim), pop(sim)
        d = untyped_addr(sim, d)
        kill(sim)
        stmt(sim, 'FillChar', [d, n, v])
        return
    if name == '@GetMem$q4Word':
        need(sim, 1)
        n = pop(sim)
        kill(sim)
        sim.r['dxax'] = Builtin('GetMem', [n], 4)
        return
    if name == '@FreeMem$qm7Pointer4Word':
        need(sim, 2)
        n = pop(sim)
        p = pop(sim)
        if getattr(p, 'size', None) != 4:
            p = merge32(p, pop(sim))
        kill(sim)
        stmt(sim, 'FreeMem', [p, n])
        return
    if name == '@Random$q4Word':
        need(sim, 1)
        n = pop(sim)
        kill(sim)
        sim.r['ax'] = Builtin('Random', [n], 2)
        return
    if name == '@UpCase$q4Char':
        need(sim, 1)
        c = pop(sim)
        kill(sim)
        sim.r['al'] = Builtin('UpCase', [c], 1)
        return
    if name == '@Set@Clear$qv':                         # set constructor: empty set in the temp (stays pushed)
        need(sim, 1)
        t = st[-1]
        if not isinstance(t, TempRef):
            raise LiftError('set clear')
        t.value = SetCons([])
        t.set = True
        kill(sim)
        return
    if name in ('@Set@$brplu$q4Byte', '@Set@$brplu$q4Bytet1'):
        n = 1 if name.endswith('4Byte') else 2
        need(sim, n + 1)
        it = [pop(sim) for _ in range(n)][::-1]
        t = st[-1]
        if not isinstance(t, TempRef) or not isinstance(t.value, SetCons):
            raise LiftError('set add')
        t.value.items.append(it[0] if n == 1 else tuple(it))
        kill(sim)
        return
    if name == '@Set@$bctr$qn4Byte4Word':               # load a packed set variable into the temp
        need(sim, 3)
        w, src = pop(sim), pop(sim)
        t = st[-1]
        if not isinstance(t, TempRef) or not isinstance(src, Addr):
            raise LiftError('set load')
        t.value = src.loc
        t.set = True
        kill(sim)
        return
    if name == '@Set@MemberOf$q4Byte':
        need(sim, 2)
        s, x = pop(sim), pop(sim)
        kill(sim)
        sim.flags = Flags('in', x, s)
        return
    if name in ('@$brmul$q7Longintt1', '@$brdiv$q7Longintt1', '@$brmod$q7Longintt1'):
        a = sim.r.get('dxax')
        b = sim.r.get('bxcx')
        if b is None:
            c_, b_ = sim.r.get('cx'), sim.r.get('bx')
            if isinstance(c_, Half) and isinstance(b_, Half) and c_.v is b_.v and c_.part == 'lo' and b_.part == 'hi':
                b = c_.v
        if a is None or b is None:
            raise LiftError('long op operands')
        kill(sim)
        sim.r['dxax'] = Op('*' if 'mul' in name else ('mod' if 'mod' in name else 'div'), [a, b], 4, True)
        if 'mul' not in name:
            # the division routine also leaves the remainder in bx:cx
            m = Op('mod', [a, b], 4, True)
            sim.r['bxcx'] = m
            sim.r['cx'], sim.r['bx'] = Half(m, 'lo'), Half(m, 'hi')
        return
    if name == 'RTE_handler_00_00':                    # Halt(ax)
        code = sim.r.get('ax')
        kill(sim)
        stmt(sim, 'Halt', [] if isinstance(code, Const) and code.v == 0 else [code])
        return
    if name == '@IOResult$qv':
        kill(sim)
        sim.r['ax'] = Builtin('IOResult', [], 2)
        return
    if name in ('@MemAvail$qv', '@MaxAvail$qv'):
        kill(sim)
        sim.r['dxax'] = Builtin(name[1:name.index('$')], [], 4)
        return
    if name == '@Abs$q7Longint':
        a = sim.r.get('dxax')
        if a is None:
            raise LiftError('abs of ?')
        kill(sim)
        sim.r['dxax'] = Builtin('Abs', [a], 4)
        return
    if name == '@Real$q7Longint':
        a = sim.r.get('dxax')
        if a is None:
            raise LiftError('real of ?')
        kill(sim)
        sim.r['real'] = Op('toreal', [a], 6)
        return
    if name in ('@Trunc$q4Real', '@Round$q4Real'):
        a = sim.r.get('real')
        if a is None:
            raise LiftError('trunc of ?')
        kill(sim)
        sim.r.pop('real', None)
        sim.r['dxax'] = Builtin('Trunc' if 'Trunc' in name else 'Round', [a], 4)
        return
    if name in REALOPS:
        a, b = sim.r.get('real'), sim.r.get('creal')
        if b is None:
            regs = [sim.r.get(r) for r in ('cx', 'si', 'di')]
            vs = [x.v if isinstance(x, Const) else (x.off if type(x).__name__ == 'AddrOf' and x.kind == 'imm' else None)
                  for x in regs]
            if None not in vs:
                b = Const(vs[0] | vs[1] << 16 | vs[2] << 32, 6)
            elif all(isinstance(x, Loc) for x in regs) and regs[0].kind == regs[1].kind == regs[2].kind and \
                    regs[0].off + 2 == regs[1].off and regs[1].off + 2 == regs[2].off and regs[0].index is None:
                c0 = regs[0]
                b = Loc(c0.kind, c0.off, 6, ptr=c0.ptr, depth=c0.depth)
        if a is None or b is None:
            raise LiftError('real op operands')
        kill(sim)
        sim.r.pop('creal', None)
        sim.r['real'] = Op(REALOPS[name], [a, b], 6)
        return
    if name in ('@Sin$q4Real', '@Cos$q4Real'):
        a = sim.r.get('real')
        if a is None:
            raise LiftError('sin of ?')
        kill(sim)
        sim.r['real'] = Builtin(name[1:4], [a], 6)
        return
    if name == '@Random__Real$qv':
        kill(sim)
        sim.r['real'] = Builtin('Random', [], 6)
        return
    if name in SIMPLE:
        pname, sizes, res, types = SIMPLE[name]
        args = []
        for sz in reversed(sizes):
            need(sim, 1)
            v = pop(sim)
            if sz == 4 and getattr(v, 'size', None) not in (4, 'str') and not isinstance(v, (Addr, TempRef, Lit)):
                need(sim, 1)
                v = merge32(v, pop(sim))
            args.append(v)
        args = args[::-1]
        if pname in ('BlockRead', 'BlockWrite') and isinstance(args[-1], Const) and args[-1].v == 0:
            args = args[:-1]            # no result variable: nil is pushed
        kill(sim)
        if res is None:
            b = Builtin(pname, args)
            b.types = types
            sim.emit(CallS(b))
        elif res == 'dxax':
            sim.r['dxax'] = Builtin(pname, args, 4)
            sim.r['dxax'].types = types
        elif res == 'ax':
            sim.r['ax'] = Builtin(pname, args, 2)
        elif res == 'al':
            sim.r['al'] = Builtin(pname, args, 1)
        return
    if name == '@Str$q7Longint4Wordm6String4Byte':
        need(sim, 4)
        mx, dst, w, v = pop(sim), pop(sim), pop(sim), pop(sim)
        if getattr(v, 'size', None) != 4:
            v = merge32(v, pop(sim))
        kill(sim)
        b = Builtin('Str', [Width(v, w), dst])
        b.types = [None, 'string' if not isinstance(mx, Const) or mx.v == 255 else 'string[%d]' % mx.v]
        sim.emit(CallS(b))
        return
    if name == '@Val__Longint$qm6Stringm7Integer':
        need(sim, 2)
        code, src = pop(sim), pop(sim)
        kill(sim)
        sim.r['dxax'] = Builtin('ValL', [temp_value(src), code], 4)
        return
    if name == '@ParamStr$qm6String4Word':
        need(sim, 2)
        n = pop(sim)
        t = st[-1]
        if not isinstance(t, TempRef):
            raise LiftError('paramstr')
        t.value = Builtin('ParamStr', [n], 'str')
        kill(sim)
        return
    # text file I/O: the file address stays pushed across the item calls
    if name in TEXTITEM:
        n = TEXTITEM[name]
        need(sim, n + 1)
        items = [pop(sim) for _ in range(n)][::-1]
        f = st[-1]
        kill(sim)
        if not hasattr(f, 'tio'):
            f.tio = []
        if 'Read' in name and n == 0:
            raise LiftError('read char')
        if not hasattr(f, 'tio_types'):
            f.tio_types = []
        if 'Write' in name:
            v = items[0]
            w = items[1] if len(items) > 1 else None
            f.tio.append(Width(temp_value(v), w))
            f.tio_types.append('string' if 'm6String' in name else None)
            if '4Char' in name:
                f.tio[-1].kind = 'char'
        else:
            f.tio.append(items[0])
            mx = items[1] if len(items) > 1 else None
            f.tio_types.append('string' if not isinstance(mx, Const) or mx.v == 255 else 'string[%d]' % mx.v)
        return
    if name in ('@Read$qm4Text4Char',):
        need(sim, 1)
        f = st[-1]
        kill(sim)
        sim.r['al'] = ReadChar(f)
        return
    if name in TEXTEND:
        need(sim, 1)
        f = pop(sim)
        kill(sim)
        b = Builtin(TEXTEND[name], [f] + getattr(f, 'tio', []))
        tts = getattr(f, 'tio_types', [])
        b.types = ['text'] + [tts[i] if i < len(tts) and tts[i] else ('string' if TEXTEND[name] == 'ReadLn' else None)
                              for i in range(len(getattr(f, 'tio', [])))]
        sim.emit(CallS(b))
        return
    raise LiftError('rtl ' + name)


class Width(E):
    """Write item / Str value with an optional width (0 = none)."""
    def __init__(self, v, w):
        self.v, self.w, self.size = v, w, getattr(v, 'size', None)


class ReadChar(E):
    def __init__(self, f):
        self.f, self.size = f, 1


REALOPS = {'@$brmul$q4Realt1': '*', '@$brdiv$q4Realt1': '/', '@$brplu$q4Realt1': '+', '@$brmin$q4Realt1': '-'}
SIMPLE = {   # name: (Pascal name, pushed arg sizes, result, argument view types)
    '@Assign$qm4Filem6String': ('Assign', [4, 4], None, ['file', 'string']),
    '@Assign$qm4Textm6String': ('Assign', [4, 4], None, ['text', 'string']),
    '@Reset$qm4File4Word': ('Reset', [4, 2], None, ['file', None]),
    '@Rewrite$qm4File4Word': ('Rewrite', [4, 2], None, ['file', None]),
    '@Reset$qm4Text': ('Reset', [4], None, ['text']), '@Rewrite$qm4Text': ('Rewrite', [4], None, ['text']),
    '@Close$qm4File': ('Close', [4], None, ['file']), '@Close$qm4Text': ('Close', [4], None, ['text']),
    '@BlockRead$qm4Filem3Any4Wordm4Word': ('BlockRead', [4, 4, 2, 4], None, ['file', 'byte', None, 'word']),
    '@BlockWrite$qm4Filem3Any4Wordm4Word': ('BlockWrite', [4, 4, 2, 4], None, ['file', 'byte', None, 'word']),
    '@Seek$qm4File7Longint': ('Seek', [4, 4], None, ['file', None]),
    '@Erase$qm4File': ('Erase', [4], None, ['file']),
    '@FilePos$qm4File': ('FilePos', [4], 'dxax', ['file']), '@FileSize$qm4File': ('FileSize', [4], 'dxax', ['file']),
    '@MkDir$qm6String': ('MkDir', [4], None, ['string']), '@Randomize$qv': ('Randomize', [], None, []),
}
TEXTITEM = {'@Write$qm4Textm6String4Word': 2, '@Write$qm4Text4Char4Word': 2, '@Write$qm4Text7Longint4Word': 2,
            '@Read$qm4Textm6String4Word': 2}
TEXTEND = {'@WriteLn$qm4Text': 'WriteLn', '@Write$qm4Text': 'Write', '@ReadLn$qm4Text': 'ReadLn'}


def tpl_call(sim, name):
    if name in ('KeyPressed', 'ReadKey'):
        kill(sim)
        sim.r['al'] = Builtin(name, [], 1)
        return
    if name in ('ClrScr', 'NoSound'):
        kill(sim)
        stmt(sim, name, [])
        return
    if name in ('Delay', 'Sound'):
        need(sim, 1)
        a = pop(sim)
        kill(sim)
        stmt(sim, name, [a])
        return
    if name == 'Intr':
        need(sim, 2)
        regs, n = pop(sim), pop(sim)
        kill(sim)
        stmt(sim, name, [n, regs])
        return
    if name == 'FExpand':                               # string function: result temp stays pushed
        need(sim, 2)
        path = pop(sim)
        t = sim.stack[-1]
        if not isinstance(t, TempRef):
            raise LiftError('fexpand')
        t.value = Builtin('FExpand', [temp_value(path)], 'str')
        kill(sim)
        return
    if name in TPLSIMPLE:
        sizes, res, types = TPLSIMPLE[name]
        args = []
        for sz in reversed(sizes):
            need(sim, 1)
            v = pop(sim)
            if sz == 4 and getattr(v, 'size', None) not in (4, 'str') and not isinstance(v, (Addr, TempRef, Lit)):
                need(sim, 1)
                v = merge32(v, pop(sim))
            args.append(v)
        args = args[::-1]
        args = [temp_value(a) if t == 'string' else a for a, t in zip(args, types)]
        kill(sim)
        b = Builtin(name, args, 4 if res == 'dxax' else None)
        b.types = types
        if res is None:
            sim.emit(CallS(b))
        else:
            sim.r['dxax'] = b
        return
    raise LiftError('tpl ' + name)


TPLSIMPLE = {
    'FindFirst': ([4, 2, 4], None, ['string', None, 'SearchRec']),
    'FindNext': ([4], None, ['SearchRec']),
    'DiskFree': ([2], 'dxax', [None]),
    'FSplit': ([4, 4, 4, 4], None, ['string', 'DirStr', 'NameStr', 'ExtStr']),
    'OvrGetBuf': ([], 'dxax', []),
    'OvrSetBuf': ([4], None, [None]),
    'OvrInit': ([4], None, ['string']),
    'GetTime': ([4, 4, 4, 4], None, ['word', 'word', 'word', 'word']),
}


class StrVal(E):
    """String value stored with a maximum length (StrStore)."""
    def __init__(self, v, mx):
        self.v, self.mx, self.size = v, mx, 'str'


class SetCons(E):
    """Set constructor [a, b..c]: items are expressions or (lo, hi) pairs."""
    def __init__(self, items):
        self.items, self.size = items, 'set'


class CharStr(E):
    def __init__(self, c):
        self.c, self.size = c, 'str'
