"""goname.py HEX...: what the Go port calls a SotSB data-segment address.

The CotAB address it faces (data/ds_map.tsv, reversed) and the Go lines that cite that CotAB
address in a comment (DS:xxxx, bxxxx, wxxxx, pxxxx ...).
"""
import glob
import os
import re
import sys

rev = {}
for line in open('data/ds_map.tsv'):
    f = line.rstrip('\n').split('\t')
    rev.setdefault(f[1], []).append((int(f[2]), f[0]))
lines = []
for path in glob.glob(os.path.expanduser('~/Projects/sotsb-go/engine/*.go')):
    for n, l in enumerate(open(path), 1):
        lines.append((os.path.basename(path), n, l.rstrip()))
for h in sys.argv[1:]:
    h = h.upper()
    cands = sorted(rev.get(h, []), reverse=True)
    print('== %s <- %s' % (h, ' '.join('%s(%d)' % (c, v) for v, c in cands) or '?'))
    for v, c in cands[:2]:
        pat = re.compile(r'(DS:|\b[a-z]{1,2})%s\b' % c)
        hits = [x for x in lines if pat.search(x[2])]
        for f, n, l in hits[:4]:
            print('   %s:%d %s' % (f, n, l.strip()[:120]))
