"""pdiff.py UNIT ENTRY: side-by-side disassembly of a procedure, original vs current build."""
import sys, os, subprocess
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import build
from build import lift, skel
key, e = sys.argv[1], int(sys.argv[2], 16)
built = build.built_units()
pos = build.locate(key, built)
d = pos.get(e)
p = lift.PROCS[(key, e)].p
oc = lift.code_of(key); bc = built[key][0]
print('delta', d)
def dis(c, a, b):
    r = subprocess.run(['ndisasm', '-b16', '-o', str(a), '-'], input=c[a:b], capture_output=True).stdout.decode().splitlines()
    return [l[:58] for l in r]
x = dis(oc, p['entry'], p['end'])
y = dis(bc, p['entry'] + (d or 0), p['end'] + (d or 0) + 16)
for i in range(max(len(x), len(y))):
    l = x[i] if i < len(x) else ''; r = y[i] if i < len(y) else ''
    print('%s%-58s | %s' % ('  ' if l[10:] == r[10:] else '* ', l, r))
