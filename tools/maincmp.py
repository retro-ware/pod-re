"""maincmp.py [BUILDDIR]: side-by-side disassembly diff of the main program block (from push bp) of a build vs
the original. Far-call targets are shown as-is; segment values differ when unit sizes differ."""
import struct, subprocess, sys, difflib
D = sys.argv[1] if len(sys.argv) > 1 else 'build/full'
h = open(D + '/START.EXE', 'rb').read()
img = h[struct.unpack('<H', h[8:10])[0] * 16:]
o = open('orig/START.bin', 'rb').read()

def dis(b, a, n):
    out = subprocess.run(['ndisasm', '-b16', '-o', str(a), '-'], input=b[a:a + n], capture_output=True).stdout.decode()
    return [l.split(None, 2)[2] if len(l.split(None, 2)) > 2 else l for l in out.splitlines()]

def main_len(b):
    i = b.index(b'\x55\x89\xe5', 0x8B)
    return i, b.index(b'\x89\xec\x5d\x31\xc0\x9a', i) + 11 - i

bi, bn = main_len(img); oi, on = main_len(o)
print('main block built %X+%X orig %X+%X' % (bi, bn, oi, on))
A, B = dis(o, oi, on), dis(img, bi, bn)
for l in difflib.unified_diff(A, B, 'orig', 'built', n=2, lineterm=''):
    print(l)
