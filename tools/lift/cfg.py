"""Basic blocks and structuring of TP6 procedure bodies into Pascal statements."""
from ir import *
from sim import Sim, decode, JCC, NEG, Flags
from capstone import x86


import json as _json
ELSE_EXIT = set(_json.load(open('data/else_exit.json')))


class SetBool:
    """Pseudo instruction for 'mov al,0; jcc L; inc ax; L:' (al := Ord(condition))."""
    def __init__(self, j, inc):
        self.mnemonic, self.op_str = 'setbool', j.mnemonic
        self.address, self.size = j.address, j.size + inc.size
        self.operands = []
        self.jcc = j.mnemonic


def fold_setbool(ins):
    out = []
    i = 0
    while i < len(ins):
        x = ins[i]
        if i + 2 < len(ins) and x.mnemonic == 'mov' and x.op_str == 'al, 0' and ins[i+1].mnemonic in JCC and \
                ins[i+2].mnemonic == 'inc' and ins[i+2].op_str == 'ax' and \
                ins[i+1].operands[0].imm == ins[i+2].address + ins[i+2].size:
            out += [x, SetBool(ins[i+1], ins[i+2])]
            i += 3
            continue
        out.append(x)
        i += 1
    return out


class Block:
    def __init__(self, start):
        self.start = start
        self.ins = []
        self.end = None
        self.term = None        # ('jcc', mn, target) | ('jmp', target) | ('fall',)
        self.preds = []

    def __repr__(self):
        return 'B%04X' % self.start


class Body:
    """Decoded body [a, b) of a procedure with blocks; EXIT = b (the epilogue)."""

    def __init__(self, ctx, code, a, b):
        self.ctx, self.a, self.b = ctx, a, b
        self.ins = fold_setbool(decode(code, a, b))
        self.at = {i.address: i for i in self.ins}
        leaders = {a}
        for i in self.ins:
            if i.mnemonic == 'jmp' or i.mnemonic in JCC:
                t = i.operands[0].imm
                if not (a <= t <= b):
                    raise LiftError('jump outside body')
                leaders.add(t)
                leaders.add(i.address + i.size)
        leaders = sorted(x for x in leaders if x < b)
        self.blocks = {}
        order = []
        for i, s in enumerate(leaders):
            blk = Block(s)
            e = leaders[i+1] if i + 1 < len(leaders) else b
            blk.ins = [x for x in self.ins if s <= x.address < e]
            blk.end = e
            last = blk.ins[-1]
            if last.mnemonic == 'jmp':
                blk.term = ('jmp', last.operands[0].imm)
                blk.ins = blk.ins[:-1]
            elif last.mnemonic in JCC:
                blk.term = ('jcc', last.mnemonic, last.operands[0].imm)
                blk.ins = blk.ins[:-1]
            else:
                blk.term = ('fall',)
            self.blocks[s] = blk
            order.append(blk)
        self.order = order
        for blk in order:
            for t in self.succ(blk):
                if t in self.blocks:
                    self.blocks[t].preds.append(blk)
        # long conditional branch: jcc over a near jmp -> one inverted conditional jump
        INV = {'je': 'jne', 'jne': 'je', 'jb': 'jae', 'jae': 'jb', 'jbe': 'ja', 'ja': 'jbe',
               'jl': 'jge', 'jge': 'jl', 'jle': 'jg', 'jg': 'jle'}
        for blk in list(order):
            if blk.term[0] != 'jcc':
                continue
            nb = self.blocks.get(blk.end)
            if nb is None or nb.ins or nb.term[0] != 'jmp' or blk.term[2] != nb.end or len(nb.preds) != 1:
                continue
            if nb.end - nb.start != 3:
                continue
            y = nb.term[1]
            blk.term = ('jcc', INV[blk.term[1]], y)
            blk.end = nb.end
            blk.fused = True
            order.remove(nb)
            del self.blocks[nb.start]
            if y in self.blocks:
                self.blocks[y].preds = [blk if q is nb else q for q in self.blocks[y].preds]
            tb = self.blocks.get(nb.end)
            if tb is not None:
                tb.preds = [q for q in tb.preds if q is not blk] + [blk]
        self.fuse_long_compares()
        self.cache = {}

    def fuse_long_compares(self):
        """32-bit compares: 'cmp dx,H; j.. [; j..]; cmp ax,L; j..' -> one virtual test block."""
        from sim import R
        from capstone import x86
        i = 0
        while i < len(self.order):
            blk = self.order[i]
            if blk.term[0] != 'jcc' or not blk.ins or blk.ins[-1].mnemonic != 'cmp':
                i += 1
                continue
            c = blk.ins[-1]
            memcmp = c.operands[0].type == x86.X86_OP_MEM and c.operands[0].size == 2 and \
                c.operands[1].type == x86.X86_OP_IMM
            if not memcmp and (c.operands[0].type != x86.X86_OP_REG or R[c.operands[0].reg] != 'dx'):
                i += 1
                continue
            grp = [blk]
            j = i + 1
            if j < len(self.order) and not self.order[j].ins and self.order[j].term[0] == 'jcc':
                grp.append(self.order[j]); j += 1
            if j >= len(self.order):
                i += 1; continue
            lo = self.order[j]
            if len(lo.ins) != 1 or lo.ins[0].mnemonic != 'cmp' or lo.term[0] != 'jcc':
                i += 1; continue
            o0 = lo.ins[0].operands[0]
            if memcmp:
                h0 = c.operands[0]
                if o0.type != x86.X86_OP_MEM or o0.mem.base != h0.mem.base or o0.mem.index != h0.mem.index or \
                        o0.mem.segment != h0.mem.segment or o0.mem.disp + 2 != h0.mem.disp or \
                        lo.ins[0].operands[1].type != x86.X86_OP_IMM:
                    i += 1; continue
            elif o0.type != x86.X86_OP_REG or R[o0.reg] != 'ax':
                i += 1; continue
            grp.append(lo)
            inside = {g.start for g in grp[1:]}
            # the later blocks must only be reached from inside the group
            if any(p not in grp for g in grp[1:] for p in g.preds):
                i += 1; continue
            jumps = [(g.term[1], g.term[2]) for g in grp]
            fall = lo.end
            targets = {t for m, t in jumps} | {fall}
            targets -= inside
            if len(targets) != 2:
                i += 1; continue
            rel = long_relation(jumps[:-1], jumps[-1], fall)
            if rel is None:
                i += 1; continue
            mn, X = rel
            if memcmp and c.operands[1].imm == 0 and lo.ins[0].operands[1].imm == 0 and mn in ('je', 'jne'):
                # TP tests a longint against 0 with mov/or: a cmp chain is separate word tests
                i += 1; continue
            if X == fall:
                inv = {'je': 'jne', 'jne': 'je', 'jb': 'jae', 'jae': 'jb', 'jbe': 'ja', 'ja': 'jbe',
                       'jl': 'jge', 'jge': 'jl', 'jle': 'jg', 'jg': 'jle'}
                mn, X = inv[mn], (targets - {fall}).pop()
            # virtual block: first block's instructions, operands from both compares
            v = Block(blk.start)
            v.ins = blk.ins[:-1]
            v.cmp32 = (blk.ins[-1], lo.ins[0])
            v.end = lo.end
            v.term = ('jcc', mn, X)
            v.preds = blk.preds
            if any(getattr(g, 'fused', False) and g.term[2] == X for g in grp):
                v.fused = True
            self.order[i:j + 1] = [v]
            for g in grp:
                del self.blocks[g.start]
            self.blocks[v.start] = v
            for b2 in self.order:
                b2.preds = [v if q in grp else q for q in b2.preds]
                b2.preds = list(dict.fromkeys(b2.preds))
            i += 1

    def succ(self, blk):
        if blk.term[0] == 'jmp':
            return [blk.term[1]]
        if blk.term[0] == 'jcc':
            return [blk.term[2], blk.end]
        return [blk.end]

    def seeded(self, blk):
        sim = Sim(self.ctx)
        sd = getattr(self, 'seed', {}).get(blk.start)
        if sd:
            sim.stmt_start, sim.idle_after = sd[0], False
            sim.r['ax'] = sd[1]
            if len(sd) > 2:
                sim.stack = list(sd[2])      # arguments pushed before the boolean value
            for r, v in getattr(self, 'seed_regs', {}).get(blk.start, {}).items():
                sim.r.setdefault(r, v)
        return sim

    def run(self, blk, sim=None):
        """Simulate a block from an idle state. Returns (statements, sim at end)."""
        if sim is None:
            self.preseed_bool(blk)
        sim = sim or self.seeded(blk)
        for ins in blk.ins:
            r = sim.step(ins)
            if r is not None:
                raise LiftError('unexpected control flow %r' % (r,))
        if blk.term[0] != 'jcc':
            sim.flush_mem(); sim.flush32()
        if getattr(blk, 'cmp32', None):
            hi, lo = blk.cmp32
            if hi.operands[0].type == x86.X86_OP_MEM:
                from sim import merge32
                a = merge32(sim.mem(lo, lo.operands[0]), sim.mem(hi, hi.operands[0]))
            else:
                a = sim.r.get('dxax')
            if a is None:
                raise LiftError('long compare without dx:ax')
            bh = sim.val(hi, hi.operands[1])
            bl = sim.val(lo, lo.operands[1])
            from sim import merge32
            sim.flags = Flags('cmp', a, merge32(bl, bh), size=4)
        return sim

    # ---------------- structuring
    def structure(self, a, b, noloop=None):
        """Statements for the address range [a, b) (block-aligned). Statements that can't be lifted become Raw
        byte ranges (smallest self-contained run of blocks)."""
        out = []
        pc = a
        while pc < b:
            try:
                stmts, npc = self.stmt_at(pc, b, noloop)
                # simple statements carry their own byte ranges; structured ones the range of the whole step
                rest = []
                a0 = pc
                for st_ in stmts:
                    rg = getattr(st_, 'rng', None)
                    if not rest and rg and rg[0] is not None and isinstance(st_, (Assign, CallS)):
                        out.append(Seq([st_], rg[0], rg[1]))
                        a0 = rg[1]
                    else:
                        rest.append(st_)
                if rest:
                    out.append(Seq(rest, a0, npc) if a0 is not None and self.closed(a0, npc) else Seq(rest, None, None))
                pc = npc
            except PartialBlock as pb:
                for st_ in pb.done:
                    rg = getattr(st_, 'rng', None)
                    out.append(Seq([st_], rg[0], rg[1]) if rg else Seq([st_], None, None))
                q = self.raw_extent(pb.at, b) if getattr(self.ctx, 'allow_raw', False) else None
                if q is None or q <= pc:
                    raise LiftError(pb.why)
                self.ctx.raws.append(pb.why); self.ctx.rawat = getattr(self.ctx, "rawat", []) + [(pb.at, pb.why)]
                out.append(Raw(pb.at, q))
                pc = q
            except LiftError as ex:
                if not getattr(self.ctx, 'allow_raw', False):
                    raise
                q = self.raw_extent(pc, b)
                if q is None or q <= pc:
                    raise
                self.ctx.raws.append(str(ex)); self.ctx.rawat = getattr(self.ctx, "rawat", []) + [(pc, str(ex))]
                out.append(Raw(pc, q))
                pc = q
        if pc != b:
            raise LiftError('overrun %x/%x' % (pc, b))
        return out

    def closed(self, pc, q):
        for blk in self.order:
            inside = pc <= blk.start < q
            for t in self.succ(blk):
                if inside and not (pc <= t <= q or t == self.b):
                    return False
                if not inside and pc < t < q:
                    return False
        return True

    def raw_extent(self, pc, limit):
        """Smallest q > pc (block boundary <= limit) such that no jump leaves [pc, q) except to q, the
        epilogue, or limit, and none enters (pc, q) from outside."""
        ends = sorted({blk.end for blk in self.order if pc < blk.end <= limit})
        for q in ends:
            inside = [blk for blk in self.order if blk.start < q and blk.end > pc]
            ok = True
            for blk in inside:
                for t in self.succ(blk):
                    if not (pc <= t <= q or t == self.b):
                        ok = False
            if not ok:
                continue
            for blk in self.order:
                if blk.start < pc or blk.start >= q:
                    for t in self.succ(blk):
                        if pc < t < q:
                            ok = False
            if ok:
                return q
        return None

    def stmt_at(self, pc, b, noloop):
        out = []
        blk = self.blocks.get(pc)
        if blk is None:
            raise LiftError('no block at %x' % pc)
        if isinstance(noloop, tuple):
            # head shared with an enclosing repeat: only back edges inside its body count
            loop = self.try_loop(blk, b, noloop[1]) if pc == noloop[0] else self.try_loop(blk, b)
        else:
            # the head of an enclosing loop can still start a for loop (i := start; jmp B)
            loop = self.try_loop(blk, b) if pc != noloop else self.try_for(blk, b)
        if loop:
            return loop
        sim = self.seeded(blk)
        for ins in blk.ins:
            try:
                r = sim.step(ins)
            except LiftError as ex:
                if sim.out or sim.stmt_start != blk.start:
                    raise PartialBlock(sim.out, sim.stmt_start if not sim.idle_after else ins.address, str(ex))
                raise
            if r is not None:
                raise LiftError('unexpected control flow')
        if getattr(blk, 'cmp32', None):
            sim = self.run(blk)
        sim.flush_mem(); sim.flush32()
        out += sim.out
        t = blk.term
        if t[0] == 'fall':
            if sim.busy():
                raise LiftError('busy at block end %x' % blk.end)
            return out, blk.end
        if t[0] == 'jmp':
            if sim.busy():
                raise LiftError('busy at jmp')
            if t[1] == self.b:
                out.append(Exit())
                return out, blk.end
            raise LiftError('goto %x' % t[1])
        try:
            cs = None if self.bool_shape(blk) else self.try_case(blk, sim, b)
        except LiftError as ex:
            if getattr(ex, 'narms', 0) > 1:
                raise        # a real case statement with an arm that can't be lifted
            cs = None        # not a case after all: try it as an if statement
        if cs and len(cs[0].arms) == 1 and len(cs[0].arms[0][0]) == 1 and not isinstance(cs[0].arms[0][0][0], tuple) \
                and not isinstance(cs[0].sel, Loc):
            cs = None        # one label on a computed value: an if statement compiles the same
        if cs:
            st, npc = cs
        else:
            st, npc = self.if_stmt(blk, sim, b)
        if st is not None:
            out.append(st)
        return out, npc

    def try_case(self, blk, sim, limit):
        seen = []
        try:
            return self.try_case1(blk, sim, limit, seen)
        except LiftError as ex:
            if not hasattr(ex, 'narms'):
                ex.narms = len(seen)
            raise

    def try_case1(self, blk, sim, limit, seen):
        """TP case: selector in a register, label tests 'cmp r,k' chained without reloading r."""
        f = sim.flags
        if f is None or f.kind != 'cmp' or getattr(f, 'reg', None) is None or not isinstance(f.b, Const):
            return None
        reg = f.reg
        sel = f.a
        self.case_signed = False
        sgn = False
        # arm list: walk tests
        arms = []
        pos = blk                      # block holding the current test (its last insn is the cmp)
        first = True
        END = None
        while True:
            # parse label items starting at the test in `pos`
            items, body, nxt = self.case_labels(pos, reg, first)
            if items is None:
                if first:
                    return None
                break
            seen.append(items)
            sgn = sgn or self.case_signed
            first = False
            if body > nxt:
                # empty arm: its labels jump straight to the end of the case
                if END is None:
                    END = body
                elif body != END:
                    return None
                arms.append((items, []))
                nb = self.blocks.get(nxt)
                if nb is None or not nb.ins or nb.ins[-1].mnemonic != 'cmp' or nb.term[0] != 'jcc':
                    break
                pos = nb
                continue
            # body runs from `body` to a jmp END (or falls into nxt when it is the last arm with no else)
            jb = self.block_before(nxt)
            if jb is not None and jb.term[0] == 'jmp' and jb.start >= body and jb.term[1] > nxt and \
                    not (jb.term[1] == self.b and END is not None and END != self.b):
                if END is None:
                    END = jb.term[1]
                elif jb.term[1] != END:
                    return None
                stmts = self.structure_upto(body, jb) if True else None
            elif END is not None and nxt == END:
                stmts = self.structure(body, nxt)
            else:
                if END is None and nxt <= limit:
                    # single arm without else: the jump past the body goes straight to the end
                    END = nxt
                    stmts = self.structure(body, nxt)
                else:
                    return None
            arms.append((items, stmts))
            if nxt == END:
                return self.mk_case(sel, arms, None, reg, self.case_signed or sgn), END
            nb = self.blocks.get(nxt)
            if nb is None:
                return None
            # next arm test must start with 'cmp reg, imm' as its first instruction
            if not nb.ins or nb.ins[0].mnemonic != 'cmp' or nb.term[0] != 'jcc':
                break
            from sim import R
            o = nb.ins[0].operands
            if len(nb.ins) != 1 or R.get(o[0].reg) != reg or o[1].type != 2:
                break
            pos = nb
        if END is None or len(arms) < 1:
            return None
        if len(arms) == 1 and len(arms[0][0]) == 1 and not isinstance(arms[0][0][0], tuple) and \
                not (isinstance(sel, Loc) and sel.kind in ('l', 'g', 'up') and sel.index is None):
            return None      # one label on an expression: an if statement compiles the same (a variable
                             # would be compared in memory by an if: cmp byte [x],k -- mov al,[x] is the case)
        if nxt is None or nxt > END or END > limit:
            return None
        els = self.structure(nxt, END)
        return self.mk_case(sel, arms, els, reg, self.case_signed or sgn), END

    def case_sel(self, sel):
        if self.case_signed:
            import copy
            sel = copy.copy(sel)
            sel.signed = True
        return sel

    def mk_case(self, sel, arms, els, reg, signed):
        self.case_signed = signed
        c = Case(self.case_sel(sel), arms, els)
        c.bytesel = reg == 'al'
        c.signedsel = signed
        return c

    def case_labels(self, blk, reg, first):
        """Label items of one case arm starting with blk's final cmp. Returns (items, body_start, next_arm)."""
        from sim import R
        items = []
        body = None
        b = blk
        while True:
            cmpi = b.ins[-1]
            if cmpi.mnemonic != 'cmp' or R.get(cmpi.operands[0].reg) != reg or cmpi.operands[1].type != 2:
                return None, None, None
            if not first and len(b.ins) != 1:
                return None, None, None
            k = cmpi.operands[1].imm
            mn, tgt = b.term[1], b.term[2]
            if mn == 'je':
                if body is not None and tgt != body:
                    # a label with another target: next arm
                    return items, body, b.start
                items.append(k)
                nb = self.blocks.get(b.end)
                if nb is None or nb.term[0] != 'jcc' or len(nb.ins) != 1:
                    return None, None, None
                b = nb; first = False
                body = tgt
                continue
            if mn == 'jne':
                if body is not None and b.end != body:
                    # the je labels before have another body (e.g. a fused long jump to the end): next arm
                    return items, body, b.start
                items.append(k)
                return items, b.end, tgt
            if mn in ('jb', 'jl'):
                # range lo..hi : cmp lo; jb next; cmp hi; ja next  (last) | jbe body (not last); jl/jg/jle signed
                up, upe = ('ja', 'jbe') if mn == 'jb' else ('jg', 'jle')
                nb = self.blocks.get(b.end)
                if nb is None or len(nb.ins) != 1 or nb.term[0] != 'jcc':
                    return None, None, None
                c2 = nb.ins[0]
                if c2.mnemonic != 'cmp' or R.get(c2.operands[0].reg) != reg:
                    return None, None, None
                hi = c2.operands[1].imm
                if mn == 'jl':
                    self.case_signed = True
                    k = k - 0x10000 if k >= 0x8000 else (k - 0x100 if c2.operands[0].size == 1 and k >= 0x80 else k)
                    hi = hi - 0x10000 if hi >= 0x8000 else (hi - 0x100 if c2.operands[0].size == 1 and hi >= 0x80 else hi)
                if nb.term[1] == up and nb.term[2] == tgt:
                    items.append((k, hi))
                    return items, nb.end, tgt
                if nb.term[1] == upe and tgt == nb.end:
                    items.append((k, hi))
                    nn = self.blocks.get(nb.end)
                    if nn is None or nn.term[0] != 'jcc' or len(nn.ins) != 1:
                        return None, None, None
                    b = nn; first = False
                    continue
                return None, None, None
            return None, None, None

    def chain(self, blk, sim):
        """Compound condition starting with blk's test. Returns (expr, then_start, false_target, chain_end)."""
        tests = [(blk, sim.flags)]
        self.chain_stack = None
        if sim.flags is not None and sim.busy() and sim.stack and sim.p32 is None:
            # arguments already pushed: only a boolean value (al := 0/1) can follow (checked by if_stmt)
            self.chain_stack = list(sim.stack)
        elif sim.flags is None or sim.busy():
            raise LiftError('jcc without test')
        cands = []
        cur = blk
        while True:
            exits = self.exits(tests)
            if exits is not None:
                cands.append((list(tests), exits))
            nxt = self.blocks.get(cur.end)
            inb = [x[0] for x in tests] + [getattr(x[0], 'tail', None) for x in tests]
            if nxt is None or nxt.term[0] != 'jcc' or len(nxt.preds) == 0 or any(p not in inb for p in nxt.preds):
                break
            syn = self.bool_operand(nxt)
            if syn is not None:
                # an operand materialised as 0/1 and retested (cond; al := 0/1; or al,al; jcc): one test
                tests.append(syn)
                cur = syn[0]
                continue
            if nxt.term[2] <= tests[0][0].start:
                break        # jumps back to the chain's head: a loop's until test, not part of this condition
            try:
                s2 = self.run(nxt)
            except LiftError:
                break
            if s2.out or s2.busy() or s2.flags is None:
                break
            tests.append((nxt, s2.flags))
            cur = nxt
        if not cands and len(tests) > 0:
            # if c1 and c2 ... then ; (empty then: every test jumps to the chain's fallthrough)
            T = tests[-1][0].end
            inside = {b.start for b, f in tests}
            if all(b.term[2] == T for b, f in tests) and \
                    all(b.end in inside or b.end == T for b, f in tests):
                e = None
                for b, f in tests:
                    c = neg(flag_cond(f, b.term[1]))
                    e = c if e is None else _and(e, c)
                self.last_chain_end = tests[-1][0]
                self.last_tests = tests
                return e, T, T
        if not cands:
            raise LiftError('condition shape')
        tests, (T, F) = cands[-1]
        e = self.cond_expr(tests, T, F)
        self.last_chain_end = tests[-1][0]
        self.last_tests = tests
        return e, T, F

    def exits(self, tests):
        """(T, F) if the chain has exactly two exits with T = fallthrough of the last block, else None."""
        inside = {b.start for b, f in tests}
        last = tests[-1][0]
        T = last.end
        ex = set()
        for b, f in tests:
            for t in (b.term[2], b.end):
                if t not in inside:
                    ex.add(t)
        ex.discard(T)
        if len(ex) != 1:
            return None
        F = ex.pop()
        if F < T:
            return None
        return T, F

    def cond_expr(self, tests, T, F):
        try:
            return self.cond_expr1(tests, T, F)
        except LiftError as ex:
            if 'general ite' not in str(ex):
                raise
            r = self.cond_split(tests, 0, len(tests), T, F)
            if r is None:
                raise
            return r

    def cond_split(self, tests, i, j, T, F):
        """Short-circuit recovery: tests[i:j] is true -> T, false -> F (falling off the end means T)."""
        start = lambda k: tests[k][0].start if k < len(tests) else None
        if j - i == 1:
            b, f = tests[i]
            tg = b.term[2]
            fl = b.end
            c = flag_cond(f, b.term[1])
            if tg == T and fl == F:
                return c
            if tg == F and fl == T:
                return neg(c)
            return None
        inside = lambda a, lo, hi: any(tests[k][0].start == a for k in range(lo, hi))
        for k in range(i + 1, j):
            sk = start(k)
            ok_and = ok_or = True
            for m in range(i, k):
                b = tests[m][0]
                for t in (b.term[2], b.end):
                    if inside(t, i, k) or t == sk:
                        continue
                    if t != F:
                        ok_and = False
                    if t != T:
                        ok_or = False
            if ok_and:
                x = self.cond_split(tests, i, k, sk, F)
                y = self.cond_split(tests, k, j, T, F) if x is not None else None
                if x is not None and y is not None:
                    return _and(x, y)
            if ok_or:
                x = self.cond_split(tests, i, k, T, sk)
                y = self.cond_split(tests, k, j, T, F) if x is not None else None
                if x is not None and y is not None:
                    return _or(x, y)
        return None

    def cond_expr1(self, tests, T, F):
        idx = {b.start: i for i, (b, f) in enumerate(tests)}

        def val(addr):
            if addr == T:
                return True
            if addr == F:
                return False
            return expr(idx[addr])

        memo = {}

        def expr(i):
            if i in memo:
                if memo[i] is None:
                    raise LiftError('condition cycle')
                return memo[i]
            memo[i] = None
            b, f = tests[i]
            c = flag_cond(f, b.term[1])
            yes = val(b.term[2])
            no = val(b.end)
            memo[i] = ite(c, yes, no)
            return memo[i]
        return expr(0)

    def preseed_bool(self, J):
        """J joins the 0/1 arms of a boolean value: seed al there now (the until test reads it before the body
        is structured)."""
        if J.start in getattr(self, 'seed', {}):
            return
        if len(J.preds) != 2:
            return
        for tb in J.preds:
            if tb.term[0] != 'jmp' or tb.term[1] != J.start or len(tb.ins) != 1:
                continue
            x = self.block_before(tb.start)
            if x is not None and x.end == tb.start and self.bool_shape(x):
                try:
                    sx = self.run(x)     # statements before the test are emitted when x itself is structured
                    e, T, F = self.chain(x, sx)
                    stk = self.chain_stack
                    if self.bool_value(x, e, T, F, sx) is not None and stk:
                        self.seed[J.start] = self.seed[J.start] + (stk,)
                except LiftError:
                    pass
                return

    def bool_operand(self, nxt):
        """nxt: jcc choosing  mov al,0 / mov al,1  arms that join at  or al,al; jcc  -> (synthetic block, flags)."""
        if not self.bool_shape(nxt):
            return None
        tb, fb = self.blocks.get(nxt.end), self.blocks.get(nxt.term[2])
        if tb.term[0] != 'jmp' or tb.end != fb.start or fb.term[0] != 'fall':
            return None
        J = fb.end
        jb = self.blocks.get(J)
        if jb is None or tb.term[1] != J or jb.term[0] != 'jcc' or any(p not in (tb, fb) for p in jb.preds) or \
                len(jb.ins) not in (1, 2) or jb.ins[0].mnemonic != 'or' or jb.ins[0].op_str != 'al, al':
            return None
        try:
            s2 = self.run(nxt)
        except LiftError:
            return None
        if s2.out or s2.busy() or s2.flags is None:
            return None
        c = flag_cond(s2.flags, nxt.term[1])       # true: the jump to fb is taken
        kf = fb.ins[0].operands[1].imm
        v = c if kf == 1 else neg(c)
        # TP5.5 materialises a comparison inside a short-circuit chain only for Boolean(Ord(cond))
        from rtl import Builtin
        v = Builtin('Boolean', [Builtin('Ord', [v], 1)], 1)
        import types
        from sim import Flags
        sb = types.SimpleNamespace(start=nxt.start, end=jb.end, term=jb.term, preds=nxt.preds, ins=nxt.ins + jb.ins, tail=jb)
        return sb, Flags('cond', v, size=1)

    def bool_shape(self, blk):
        """blk's jump selects between  mov al,0 / mov al,1  arms (a boolean value, never a case statement)."""
        if blk.term[0] != 'jcc':
            return False
        tb, fb = self.blocks.get(blk.end), self.blocks.get(blk.term[2])
        if tb is None or fb is None or len(tb.ins) != 1 or len(fb.ins) != 1:
            return False
        ks = set()
        for x in (tb.ins[0], fb.ins[0]):
            if not (x.mnemonic == 'mov' and x.op_str.startswith('al, ') and x.operands[1].type == x86.X86_OP_IMM):
                return False
            ks.add(x.operands[1].imm)
        return ks == {0, 1}

    def bool_value(self, blk, e, T, F, sim):
        """cond; T: mov al,1; jmp J; F: mov al,0; J:  ->  al := Ord(cond) at J (and the reverse 0/1 order)."""
        tb, fb = self.blocks.get(T), self.blocks.get(F)
        if tb is None or fb is None or len(tb.ins) != 1 or len(fb.ins) != 1:
            return None
        if tb.term[0] != 'jmp' or fb.term[0] != 'fall' or fb.end != tb.term[1] or tb.end != F:
            return None
        def k(i):
            return i.operands[1].imm if i.mnemonic == 'mov' and i.op_str.startswith('al, ') and \
                i.operands[1].type == x86.X86_OP_IMM else None
        kt, kf = k(tb.ins[0]), k(fb.ins[0])
        if {kt, kf} != {0, 1}:
            return None
        J = fb.end
        jb = self.blocks.get(J)
        if jb is None or any(p not in (tb, fb) for p in jb.preds):
            return None
        from rtl import Builtin
        c = e if kt == 1 else neg(e)
        if not hasattr(self, 'seed'):
            self.seed = {}
        st0 = sim.stmt_start if not sim.idle_after and sim.stmt_start is not None else blk.start
        self.seed[J] = (st0, Op('zext', [Builtin('Ord', [c], 1)], 2, False))
        # values computed before the boolean (an index or product in the same expression) stay live
        if not hasattr(self, 'seed_regs'):
            self.seed_regs = {}
        self.seed_regs[J] = {r: v for r, v in sim.r.items() if r in ('cx', 'dx', 'bx', 'si', 'bxcx')}
        self.cache.pop(J, None) if isinstance(self.cache, dict) else None
        return J

    def if_stmt(self, blk, sim, limit):
        e, T, F = self.chain(blk, sim)
        stk = self.chain_stack
        J = self.bool_value(blk, e, T, F, sim)
        if J is not None:
            if stk:
                self.seed[J] = self.seed[J] + (stk,)
            return None, J
        if stk:
            raise LiftError('jcc without test')
        fused_to_end = [b_ for b_, f_ in self.last_tests if getattr(b_, 'fused', False) and b_.term[2] == F]
        if F == self.b and getattr(self.last_chain_end, 'fused', False) and len(fused_to_end) <= 1:
            return If(neg(e), [Exit()]), T
        if F == self.b:
            # a plain conditional jump to the epilogue: the then-part runs to the end
            then = self.structure(T, F)
            return If(e, then, None), F
        if F > limit:
            raise LiftError('if escapes range')
        # if c then exit:  then = [T, F) is just "jmp EXIT"
        tb = self.blocks.get(T)
        prev = self.block_before(F)
        if prev is not None and prev.start >= T and prev.term[0] == 'jmp' and prev.term[1] > F and prev.term[1] != self.b:
            J = prev.term[1]
            if J > limit:
                raise LiftError('else escapes')
            then = self.structure_upto(T, prev)
            els = self.structure(F, J)
            return If(e, then, els), J
        # if c then begin ... end else <tail of the procedure>: the then-part's jump to the epilogue is the
        # jump over the else (listed by the else address: it only matters for nested literal temp allocation)
        if prev is not None and prev.start >= T and prev.term[0] == 'jmp' and prev.term[1] == self.b and \
                '%s:%04X' % (self.ctx.pr.key, F) in ELSE_EXIT:
            then = self.structure_upto(T, prev)
            els = self.structure(F, self.b)
            return If(e, then, els), self.b
        then = self.structure(T, F)
        return If(e, then, None), F

    def structure_upto_noloop(self, a, jblk):
        stmts = self.structure(a, jblk.start, noloop=a) if jblk.start > a else []
        sim = self.run(jblk)
        if sim.busy():
            raise LiftError('busy before loop jmp')
        return stmts + seqs(sim.out)

    def structure_upto(self, a, jblk):
        """Range [a, jblk.end) without jblk's final jmp."""
        stmts = self.structure(a, jblk.start) if jblk.start > a else []
        sim = self.run(jblk)
        if sim.busy():
            raise LiftError('busy before else jmp')
        sim.flush_mem(); sim.flush32()
        return stmts + seqs(sim.out)

    def block_before(self, addr):
        best = None
        for blk in self.order:
            if blk.end == addr:
                best = blk
        return best

    def try_loop(self, blk, limit, before=None):
        """while / repeat / for starting at blk. Returns (stmts, next_pc) or None."""
        back = [p for p in blk.preds if p.start >= blk.start and (before is None or p.start < before)]
        if not back:
            return self.try_for(blk, limit)
        if len(back) != 1 and not all(p.term[0] == 'jcc' for p in back):
            last = max(back, key=lambda p: p.start)
            if last.term[0] != 'jcc':
                raise LiftError('multiple back edges')
        src = max(back, key=lambda p: p.start)
        if src.end > limit:
            raise LiftError('loop escapes')
        if src.term[0] == 'jmp':
            # while: header test chain at blk, body, jmp back
            sim = self.run(blk)
            if sim.out or blk.term[0] != 'jcc':
                # no test at the head: while true do ... (left by Exit)
                body = self.structure_upto_noloop(blk.start, src)
                return [While(Const(1, 1), body)], src.end
            e, T, F = self.chain(blk, sim)
            if F != src.end:
                # while true do ... (the head test is an if inside the body)
                body = self.structure_upto_noloop(blk.start, src)
                return [While(Const(1, 1), body)], src.end
            body = self.structure_upto(T, src)
            return [While(e, body)], F
        # repeat: body, then test chain ending at src jumping back to blk
        # find the start of the until-test: the last statement boundary in src
        body_end, cond, after = self.until_cond(blk, src)
        if body_end is None:
            # the test chain starts inside the head block, after its statements
            body = seqs(self.run(blk).out)
            return body_pre(body, cond, after)
        others = [p for p in back if p is not src and p.start < body_end]
        pre = self.until_pre
        if others:
            # an inner loop starts at the same address (repeat while ... do ...; ... until)
            body = self.structure(blk.start, body_end, noloop=(blk.start, body_end))
            return body_pre(body + pre, cond, after)
        body = self.structure(blk.start, body_end, noloop=blk.start) if body_end > blk.start else []
        return body_pre(body + pre, cond, after)

    def until_cond(self, head, src):
        """Condition chain at the end of a repeat loop: blocks from some start up to src."""
        # walk back over pure test blocks preceding src
        tests_start = src
        sim = self.run(src)
        # statements in src before the test go into the body
        pre = sim.out
        self.until_pre = []
        if pre:
            # statements before the final test belong to the loop body
            if sim.busy() or sim.flags is None:
                raise LiftError('until with statements in test block')
            tests = [(src, sim.flags)]
            if self.exits_until(tests, head.start) and all(p.start >= src.start for p in head.preds if p.start >= head.start):
                self.until_pre = seqs(pre)
                return src.start, self.cond_expr(tests, src.end, head.start), src.end
            raise LiftError('until with statements in test block')
        chain_blocks = [src]
        b = self.block_before(src.start)
        while b is not None and b.start >= head.start and b.term[0] == 'jcc':
            s = self.run(b)
            if s.out or s.busy() or getattr(s, 'pend_mem', None):
                break
            chain_blocks.insert(0, b)
            if b.start == head.start:
                break        # the whole loop is its condition: repeat until c
            b = self.block_before(b.start)
        head_part = False
        if b is not None and b.start == head.start and b.term[0] == 'jcc' and b.end == chain_blocks[0].start:
            s = self.run(b)
            if s.out and not s.busy() and s.flags is not None:
                head_part = True
        # the head's own test jumps into the chain: the loop is 'statements; until <all tests>'
        if head_part and head.term[0] == 'jcc' and (any(head.term[2] == x.start for x in chain_blocks) or
                                                    head.term[2] == src.end or head.term[2] == head.start):
            cb = [head] + chain_blocks
            tests = [(x, self.run(x).flags) for x in cb]
            if self.exits_until(tests, head.start):
                return None, self.cond_expr(tests, src.end, head.start), src.end
        # until c: jumps to head when c false; T = fallthrough after src (= exit)
        # (not when the block before the chain also leaves the loop: then it ends the body with its own test)
        pre_exit = b is not None and b.start > head.start and b.term[0] == 'jcc' and b.term[2] == src.end and \
            b.end == chain_blocks[0].start
        for k in range(0 if pre_exit else len(chain_blocks)):
            cb = chain_blocks[k:]
            tests = [(x, self.run(x).flags) for x in cb]
            exits = self.exits_until(tests, head.start)
            if exits:
                e = self.cond_expr(tests, src.end, head.start)
                return cb[0].start, e, src.end
        # the first test block may end the body: statements, then the test
        if b is not None and b.start > head.start and b.term[0] == 'jcc' and b.end == chain_blocks[0].start:
            sb = self.run(b)
            fl = sb.flags
            sb.flush_mem()
            sb.flags = fl
            if sb.out and not sb.busy() and sb.flags is not None:
                cb = [b] + chain_blocks
                tests = [(x, self.run(x).flags) for x in cb]
                if self.exits_until(tests, head.start) and \
                        all(p.start >= b.start for p in head.preds if p.start >= head.start):
                    self.until_pre = seqs(sb.out)
                    return b.start, self.cond_expr(tests, src.end, head.start), src.end
        if head_part:
            cb = [head] + chain_blocks
            tests = [(x, self.run(x).flags) for x in cb]
            if self.exits_until(tests, head.start):
                return None, self.cond_expr(tests, src.end, head.start), src.end
        raise LiftError('until shape')

    def exits_until(self, tests, head):
        inside = {b.start for b, f in tests} - {head}
        T = tests[-1][0].end
        ex = set()
        for b, f in tests:
            for t in (b.term[2], b.end):
                if t not in inside:
                    ex.add(t)
        return ex == {T, head} or ex == {head} and False or ex == {T, head}

    def try_for(self, blk, limit):
        """TP for loop: [final temp :=] [start check jcc skip] i := start; jmp B; I: inc/dec i; B: body; cmp i,final; jnz I."""
        from sim import R
        from capstone import x86
        # find the 'jmp B' block: blk itself (constant bounds) or blk.next (checked form)
        if blk.term[0] == 'jmp':
            jb, chk = blk, None
        elif blk.term[0] == 'jcc' and blk.end in self.blocks and self.blocks[blk.end].term[0] == 'jmp':
            jb, chk = self.blocks[blk.end], blk
        else:
            return None
        B = jb.term[1]
        I = self.blocks.get(jb.end)
        if I is None or I.end != B or len(I.ins) != 1 or I.ins[0].mnemonic not in ('inc', 'dec') or I.term[0] != 'fall':
            return None
        down = I.ins[0].mnemonic == 'dec'
        ivar_op = I.ins[0].operands[0]
        if ivar_op.type != x86.X86_OP_MEM:
            return None
        # loop end: block ending 'jne I'
        E = None
        for b2 in self.order:
            if b2.start >= B and b2.term[0] == 'jcc' and b2.term[1] == 'jne' and b2.term[2] == I.start:
                E = b2
                break
        if E is None or E.end > limit:
            return None
        sim = Sim(self.ctx)
        ivar = sim.mem(I.ins[0], ivar_op)
        # statements of the head
        if chk is None:
            hs = self.run(jb)
            if not hs.out or not isinstance(hs.out[-1], Assign) or not same(hs.out[-1].dst, ivar):
                return None
            pre = hs.out[:-1]
            start = hs.out[-1].src
            final = None
        else:
            cs = self.run(chk)
            f = cs.flags
            if f is None or f.kind != 'cmp' or chk.term[2] != E.end:
                return None
            # i := start (mov [i],ax in the jmp block, ax = start from the compare)
            if len(jb.ins) != 1 or jb.ins[0].mnemonic != 'mov' or jb.ins[0].operands[1].type != x86.X86_OP_REG:
                return None      # the checked form stores the start value from al/ax (else: an if around a for)
            start = f.a
            final = f.b
            pre = cs.out
            if chk.term[1] in ('jg', 'jl', 'jge', 'jle'):
                # the bound check is signed: the control variable is shortint/integer
                import copy as _c
                ivar = _c.copy(ivar)
                ivar.signed = True
            # final kept in a temp assigned just before: tmp := final
            if isinstance(final, Loc) and final.kind == 'l' and pre and isinstance(pre[-1], Assign) and same(pre[-1].dst, final):
                final.at = chk.start
                self.ctx.temps_for.append(final)
                self._for_temp = final
                final = pre[-1].src
                pre = pre[:-1]
        # loop end test
        es = self.run(E)
        f = es.flags
        if f is None or f.kind != 'cmp' or es.busy():
            return None
        if not same(f.a, ivar):
            return None
        if final is None:
            final = f.b
        body = (self.structure(B, E.start) if E.start > B else []) + seqs(es.out)
        # E's test instructions may begin a statement inside E (E holds only the test)
        fs = For(ivar, start, final, down, body)
        fs.temp = getattr(self, '_for_temp', None)
        self._for_temp = None
        return pre + [fs], E.end


def seqs(stmts):
    return [Seq([x], x.rng[0], x.rng[1]) if getattr(x, 'rng', None) and x.rng[0] is not None else x for x in stmts]


class PartialBlock(Exception):
    def __init__(self, done, at, why):
        self.done, self.at, self.why = done, at, why


def long_relation(hijumps, lojump, fall):
    """Relation (as a jcc mnemonic) and its target for a split 32-bit compare, by evaluating sample values."""
    import itertools
    def flags(x, y):
        return {'je': x == y, 'jne': x != y, 'jb': x < y, 'jae': x >= y, 'jbe': x <= y, 'ja': x > y}
    def sflags(x, y):
        sx = x - 0x10000 if x >= 0x8000 else x
        sy = y - 0x10000 if y >= 0x8000 else y
        d = flags(x, y)
        d.update({'jl': sx < sy, 'jge': sx >= sy, 'jle': sx <= sy, 'jg': sx > sy})
        return d
    def outcome(a, b):
        ah, al, bh, bl = a >> 16, a & 0xFFFF, b >> 16, b & 0xFFFF
        f = sflags(ah, bh)
        for m, t in hijumps:
            if f[m]:
                return t
        f = sflags(al, bl)
        m, t = lojump
        return t if f[m] else fall
    vals = [0, 1, 2, 0xFFFF, 0x10000, 0x10001, 0x1FFFF, 0x7FFF0000, 0x80000000, 0xFFFF0000, 0xFFFFFFFF, 0x12345678]
    pairs = list(itertools.product(vals, vals))
    def srel(x, y):
        sx = x - (1 << 32) if x >= 1 << 31 else x
        sy = y - (1 << 32) if y >= 1 << 31 else y
        return sx, sy
    rels = {'je': lambda x, y: x == y, 'jne': lambda x, y: x != y,
            'jb': lambda x, y: x < y, 'jae': lambda x, y: x >= y, 'jbe': lambda x, y: x <= y, 'ja': lambda x, y: x > y,
            'jl': lambda x, y: srel(x, y)[0] < srel(x, y)[1], 'jge': lambda x, y: srel(x, y)[0] >= srel(x, y)[1],
            'jle': lambda x, y: srel(x, y)[0] <= srel(x, y)[1], 'jg': lambda x, y: srel(x, y)[0] > srel(x, y)[1]}
    outs = {(a, b): outcome(a, b) for a, b in pairs}
    tg = set(outs.values())
    for X in tg:
        for m, r in rels.items():
            if all((outs[(a, b)] == X) == r(a, b) for a, b in pairs):
                return m, X
    return None


def same(a, b):
    return isinstance(a, Loc) and isinstance(b, Loc) and a.kind == b.kind and a.off == b.off and a.depth == b.depth


def body_pre(body, cond, after):
    return [Repeat(body, cond)], after


def flag_cond(f, mn):
    """Expression that is true when the jump `mn` is taken after flags f."""
    rel = JCC[mn]
    if f.kind == 'cmp':
        return Op('rel', [f.a, f.b], 1, rel)
    if f.kind == 'test':
        if rel in ('=', '<>'):
            return Op('rel', [f.a, Const(0, f.size if isinstance(f.size, int) else 2)], 1, rel + 'z')
        if mn in ('jbe', 'ja', 'jle', 'jg', 'jl', 'jge'):
            # compare with 0 is compiled as or r,r
            return Op('rel', [f.a, Const(0, f.size if isinstance(f.size, int) else 2)], 1, rel)
        raise LiftError('test with ' + mn)
    if f.kind == 'in':
        if rel == '<>':
            return Op('in', [f.a, f.b], 1)
        if rel == '=':
            return Op('not', [Op('in', [f.a, f.b], 1)], 1)
        raise LiftError('in with ' + mn)
    if f.kind == 'odd':
        if mn == 'jb':
            return Op('odd', [f.a], 1)
        if mn == 'jae':
            return Op('not', [Op('odd', [f.a], 1)], 1)
    if f.kind == 'val':
        if rel in ('=', '<>'):
            return Op('rel', [f.a, Const(0, f.size)], 1, rel + 'z')
    if f.kind == 'cond':
        # a boolean value tested with or al,al: f.a is the condition itself
        if rel == '<>':
            return f.a
        if rel == '=':
            return neg(f.a)
    raise LiftError('flags %s %s' % (f.kind, mn))


def neg(c):
    if isinstance(c, Op) and c.op == 'rel':
        r = c.signed
        z = r.endswith('z')
        base = r[:-1] if z else r
        return Op('rel', c.args, 1, NEG[base] + ('z' if z else ''))
    if isinstance(c, Op) and c.op == 'not':
        return c.args[0]
    if isinstance(c, Op) and c.op == 'and':
        return Op('or', [neg(x) for x in c.args], 1)
    if isinstance(c, Op) and c.op == 'or':
        return Op('and', [neg(x) for x in c.args], 1)
    return Op('not', [c], 1)


def _and(*xs):
    out = []
    for x in xs:
        out += x.args if isinstance(x, Op) and x.op == 'and' and not getattr(x, 'paren', False) else [x]
    return Op('and', out, 1)


def _or(*xs):
    out = []
    for x in xs:
        out += x.args if isinstance(x, Op) and x.op == 'or' and not getattr(x, 'paren', False) else [x]
    return Op('or', out, 1)


def ite(c, yes, no):
    if yes is True and no is False:
        return c
    if yes is False and no is True:
        return neg(c)
    if yes is True:
        return _or(c, no)
    if yes is False:
        return _and(neg(c), no)
    if no is False:
        return _and(c, yes)
    if no is True:
        return _or(neg(c), yes)
    # shared tails: c ? (x or N) : N  ==  (c and x) or N ;  c ? Y : (x and Y)  ==  (c or x) and Y
    if isinstance(yes, Op) and yes.op == 'or' and yes.args[-1] is no:
        rest = yes.args[:-1]
        x = rest[0] if len(rest) == 1 else Op('or', rest, 1)
        return Op('or', [Op('and', [c, x], 1), no], 1)
    if isinstance(no, Op) and no.op == 'and' and no.args[-1] is yes:
        rest = no.args[:-1]
        x = rest[0] if len(rest) == 1 else Op('and', rest, 1)
        return Op('and', [Op('or', [c, x], 1), yes], 1)
    # c ? N : (x or N)  and  c ? (x and Y) : Y
    if isinstance(no, Op) and no.op == 'or' and no.args[-1] is yes:
        rest = no.args[:-1]
        x = rest[0] if len(rest) == 1 else Op('or', rest, 1)
        return Op('or', [Op('and', [neg(c), x], 1), yes], 1)
    if isinstance(yes, Op) and yes.op == 'and' and yes.args[-1] is no:
        rest = yes.args[:-1]
        x = rest[0] if len(rest) == 1 else Op('and', rest, 1)
        return Op('and', [Op('or', [neg(c), x], 1), no], 1)
    raise LiftError('general ite')
