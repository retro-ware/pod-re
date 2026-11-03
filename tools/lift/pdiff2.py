"""pdiff2.py UNIT ENTRY: first real difference (ignoring shifted jump/call targets and segment values)."""
import sys, os, re, subprocess
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import build
from build import lift
key, e = sys.argv[1], int(sys.argv[2], 16)
built = build.built_units()
d = build.locate(key, built).get(e) or 0
p = lift.PROCS[(key, e)].p
oc = lift.code_of(key); bc = built[key][0]
def dis(c, a, b):
    r = subprocess.run(['ndisasm', '-b16', '-o', str(a), '-'], input=c[a:b], capture_output=True).stdout.decode().splitlines()
    return [(l[:8], l[28:].strip()) for l in r]
x = dis(oc, p['entry'], p['end']); y = dis(bc, p['entry'] + d, p['end'] + d + 40)
norm = lambda s: re.sub(r'^(j\w+|call|jmp)\s+(word\s+)?0x[0-9a-f]+(:word 0x[0-9a-f]+)?', r'\1 X', re.sub(r'0x[0-9a-f]+:word', 'S:word', s))
for i in range(min(len(x), len(y))):
    if norm(x[i][1]) != norm(y[i][1]):
        for j in range(max(0, i - 4), min(len(x), i + 8)):
            print('%s %-40s | %s' % ('*' if j == i else ' ', x[j][0] + ' ' + x[j][1], (y[j][0] + ' ' + y[j][1]) if j < len(y) else ''))
        break
else:
    print('no real difference (lengths %d/%d)' % (len(x), len(y)))
