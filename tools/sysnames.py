"""sysnames.py: name this game's System RTL entry points by matching them against Curse of the Azure Bonds'
(also TP 6.0) named System routines. Writes the System rows of names.tsv."""
import json, struct, collections
S = '/Users/felix/Projects/cotab-re/'
so = open(S + 'out/u/System.bin', 'rb').read()
sn = {int(o, 16): n for k, o, kind, n in (l.rstrip('\n').split('\t') for l in open(S + 'names.tsv')) if k == 'System'}
po = open('out/u/System.bin', 'rb').read()
U = json.load(open('out/units.json'))
SYS = [u for u in U if u['key'] == 'System'][0]['seg']
tg = collections.Counter()
for u in U:
    if u['key'] in ('System',): continue
    c = open('out/u/%s.bin' % u['key'], 'rb').read()
    for f, sg in u['fixups']:
        if sg == SYS and f >= 3 and c[f - 3] == 0x9a: tg[struct.unpack('<H', c[f-2:f])[0]] += 1
def sim(a, b, n=20):
    return sum(x == y for x, y in zip(a[:n], b[:n]))
rows = []; miss = []
for t in sorted(tg):
    best = max(sn, key=lambda o: sim(po[t:], so[o:]))
    s = sim(po[t:], so[best:])
    (rows if s >= 17 else miss).append((t, best, s))
for t, b, s in rows: print('System\t%04X\tproc\t%s' % (t, sn[b]))
import sys
for t, b, s in miss: print('MISS %04X best %s (%d) calls %d' % (t, sn[b], s, tg[t]), file=sys.stderr)
