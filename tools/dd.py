"""dd.py UNIT START END: side-by-side disassembly orig vs build for a unit range (overlay code from GAME.OVR)."""
import sys, subprocess, json, struct
sys.argv += [] 
k, a, b = sys.argv[1], int(sys.argv[2], 16), int(sys.argv[3], 16)
exec(open('tools/cmp.py').read().split('tot = 0')[0].replace("args = [a for a in sys.argv[1:]", "args = [x for x in []"))
oc = open('out/u/%s.bin' % k, 'rb').read()
bc = built[k][0]
def dis(c):
    r = subprocess.run(['ndisasm', '-b16', '-o', str(a), '-'], input=c[a:b], capture_output=True).stdout.decode().splitlines()
    return [l[:60] for l in r]
x, y = dis(oc), dis(bc)
for i in range(max(len(x), len(y))):
    l, r = (x[i] if i < len(x) else ''), (y[i] if i < len(y) else '')
    print('%s%-60s | %s' % ('  ' if l[10:] == r[10:] else '* ', l, r))
