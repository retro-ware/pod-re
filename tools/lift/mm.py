"""mm.py: for every procedure whose status is a verify failure, print the first differing instruction pair (debug build)."""
import sys, os, json, subprocess, collections
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import build
from build import lift, skel
st = json.load(open('data/lift_status.json'))
built = build.built_units()
cache = {}
def dis(c, a, b):
    r = subprocess.run(['ndisasm', '-b16', '-'], input=c[a:b], capture_output=True).stdout.decode().splitlines()
    return [l[28:].strip() if len(l) > 28 else l for l in r]
cnt = collections.Counter()
for k, v in sorted(st.items()):
    if 'verify' not in v:
        continue
    key, e = k.split(':'); e = int(e, 16)
    if key not in cache:
        cache[key] = build.locate(key, built)
    d = cache[key].get(e)
    p = lift.PROCS[(key, e)].p
    if d is None:
        print(k, 'not located'); continue
    ob = bytearray(lift.code_of(key)[p['entry']:p['end']]); bb = bytearray(built[key][0][p['entry'] + d:p['end'] + d + 8])
    build.mask_fixups(key, ob, bb, p['entry'], d, built)
    build.normalize(key, ob, bb, p['entry'], d, cache[key])
    if ob == bb[:len(ob)] and len(bb) >= len(ob):
        continue
    x = dis(bytes(ob), 0, len(ob))
    y = dis(bytes(bb), 0, len(bb))
    def norm(t):
        w = t.split()
        return w[0] if w and (w[0].startswith('j') or w[0] == 'call' and not 'word' in t) else t
    for i in range(len(x)):
        if i >= len(y) or norm(x[i]) != norm(y[i]):
            print('%s  %-36s | %s' % (k, x[i][:36], y[i][:36] if i < len(y) else ''))
            cnt[(x[i].split()[0], (y[i].split() or [''])[0] if i < len(y) else '')] += 1
            break
print(cnt.most_common(20))
