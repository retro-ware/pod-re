"""unitwork.py UNIT: the port work for one SotSB unit.

Each procedure with its CotAB partner, their likeness and the Go functions that cite the partner
(data/port_worklist.tsv, made by tools/xref.py), or that already cite the SotSB address.
"""
import collections
import glob
import os
import re
import sys

GO = os.path.expanduser('~/Projects/sotsb-go/engine')
unit = sys.argv[1]
by_sotsb = collections.defaultdict(list)
for line in open('data/port_worklist.tsv'):
    f, fn, ca, sa, r = line.split('\t')
    by_sotsb[sa].append('%s:%s' % (f, fn))
cites = collections.defaultdict(list)
FUNC = re.compile(r'^func (\([^)]*\) )?(\w+)', re.M)
for path in glob.glob(os.path.join(GO, '*.go')):
    text = open(path).read()
    heads = list(FUNC.finditer(text))
    for i, m in enumerate(heads):
        start = text.rfind('\n\n', 0, m.start()) + 1
        end = heads[i + 1].start() if i + 1 < len(heads) else len(text)
        for a in set(re.findall(r'\b%s:([0-9A-F]{4})\b' % unit, text[start:end])):
            cites['%s:%s' % (unit, a)].append('%s:%s' % (os.path.basename(path), m.group(2)))
for line in open('data/cotab_map.tsv'):
    s, c, r = line.split()
    u, p = s.split('.')
    if u != unit:
        continue
    a = '%s:%s' % (u, p.split('_')[1])
    done = cites.get(a, [])
    print('%s %-24s %s  go: %s%s' % (a, c, r, ' '.join(sorted(set(by_sotsb.get(a, [])))) or '-',
                                    ('   DONE ' + ' '.join(done)) if done else ''))
