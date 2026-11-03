"""xref.py: the Go port's work list from data/cotab_map.tsv.

For every Go function in sotsb-go that cites a CotAB procedure (O039:0632 style), give the SotSB
counterpart and how alike the two are; then the SotSB procedures no Go function covers yet.
Writes data/port_worklist.tsv:  GOFILE  FUNC  COTAB  SOTSB  RATIO
and data/port_uncovered.tsv:  SOTSB  COTAB  RATIO
"""
import glob
import os
import re

COTAB = os.path.expanduser('~/Projects/cotab-re')
GO = os.path.expanduser('~/Projects/sotsb-go')

# CotAB procedure names (as the Pascal spells them) -> unit:address
addr_of = {}
for line in open(os.path.join(COTAB, 'names.tsv'), encoding='latin-1'):
    f = line.rstrip('\n').split('\t')
    if len(f) >= 4 and f[2] == 'proc' and f[0][:1] in 'OR':
        addr_of['%s.%s' % (f[0], re.sub(r'\W', '_', f[3]))] = '%s:%s' % (f[0], f[1])


def cotab_addr(name):
    unit, proc = name.split('.', 1)
    m = re.match(r'p([OR][0-9A-F]+)_([0-9A-F]{4})$', proc)
    if m:
        return '%s:%s' % (m.group(1), m.group(2))
    return addr_of.get(name) or addr_of.get('%s.%s' % (unit, proc.lower()))


def sotsb_addr(name):
    m = re.match(r'[OR][0-9A-F]+\.p([OR][0-9A-F]+)_([0-9A-F]{4})$', name)
    return '%s:%s' % (m.group(1), m.group(2)) if m else name


to_sotsb, rows = {}, []
for line in open('data/cotab_map.tsv'):
    s, c, r = line.split()
    rows.append((sotsb_addr(s), c, float(r)))
    if c != '-':
        a = cotab_addr(c)
        if a:
            to_sotsb[a] = (sotsb_addr(s), float(r))

FUNC = re.compile(r'^func (\([^)]*\) )?(\w+)', re.M)
REF = re.compile(r'\b([OR][0-9A-F]{3}):([0-9A-F]{4})\b')
cited = set()
with open('data/port_worklist.tsv', 'w') as out:
    for path in sorted(glob.glob(os.path.join(GO, 'engine', '*.go'))):
        text = open(path).read()
        heads = list(FUNC.finditer(text))
        for i, m in enumerate(heads):
            # the doc comment above the function plus its body
            start = text.rfind('\n\n', 0, m.start()) + 1
            end = heads[i + 1].start() if i + 1 < len(heads) else len(text)
            for u, a in sorted(set(REF.findall(text[start:end]))):
                ca = '%s:%s' % (u, a)
                s, r = to_sotsb.get(ca, ('-', 0.0))
                cited.add(s)
                cited.add(ca)  # already retagged to the SotSB address
                out.write('%s\t%s\t%s\t%s\t%.3f\n' % (os.path.basename(path), m.group(2), ca, s, r))
with open('data/port_uncovered.tsv', 'w') as out:
    for s, c, r in rows:
        if s not in cited:
            out.write('%s\t%s\t%.3f\n' % (s, c, r))
print('worklist', sum(1 for _ in open('data/port_worklist.tsv')), 'uncovered', sum(1 for _ in open('data/port_uncovered.tsv')))
