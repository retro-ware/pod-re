"""ghidra_image.py: build ghidra/cotab.bin (all game units + data segment + RTL stubs in one real-mode image)
and ghidra/functions.txt (linear address, name) for headless decompilation.
Each unit gets its own 64K segment; far calls are patched to the target's segment:offset."""
import sys, os, json
sys.path.insert(0, 'tools/lift'); sys.argv = ['x']
import prog
from prog import PROCS, U, code_of, far_target
from ir import LiftError

UNITS = sorted({k for (k, e) in PROCS})
SEGBASE, nxt = {}, 0x100                                          # paragraphs, packed by size
for k in UNITS:
    SEGBASE[k] = nxt
    nxt += (len(code_of(k)) + 31) // 16
DSSEG = nxt
RTLSEG = DSSEG + 0x1000
mem = bytearray(16 * (RTLSEG + 0x1000))
rtl = {}
funcs = []
ds = open('orig/START.bin', 'rb').read()[0xDE20:]
mem[DSSEG * 16:DSSEG * 16 + len(ds)] = ds
for k in UNITS:
    c = bytearray(code_of(k))
    for f, sg in U[k]['fixups']:
        at = f - 3
        if at < 0 or c[at] != 0x9A:
            continue
        try:
            kind, t, _ = far_target(k, at)
        except Exception:
            continue
        if kind == 'proc':
            seg, off = SEGBASE[t.key], t.entry
        else:
            if t not in rtl:
                rtl[t] = len(rtl) * 4
            seg, off = RTLSEG, rtl[t]
        c[at + 1:at + 3] = off.to_bytes(2, 'little')
        c[at + 3:at + 5] = seg.to_bytes(2, 'little')
    base = SEGBASE[k] * 16
    mem[base:base + len(c)] = c
for (k, e), p in PROCS.items():
    funcs.append((SEGBASE[k] * 16 + e, '%s_%04X_%s' % (k, e, p.name if hasattr(p, 'name') else 'p'), SEGBASE[k]))
for n, o in rtl.items():
    mem[RTLSEG * 16 + o] = 0xCB  # retf
    nm = ''.join(ch if ch.isalnum() else '_' for ch in n)
    funcs.append((RTLSEG * 16 + o, 'RTL_' + nm, RTLSEG))
open('ghidra/cotab.bin', 'wb').write(mem)
with open('ghidra/functions.txt', 'w') as f:
    f.write('DS %d\n' % DSSEG)
    for a, n, s in sorted(funcs):
        f.write('%d %d %s\n' % (a, s, n))
print(len(UNITS), 'units', len(funcs), 'functions', len(mem), 'bytes')
