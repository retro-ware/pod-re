"""tableuse.py COTAB-DEC...: where CotAB uses a data-segment table, and the SotSB counterpart lines.

For each CotAB address (decimal, as tablespec has it) print the CotAB procedures whose text names
it (as a/b/w/d<HEX>), and the lines of their SotSB partner that sit at the same place in the
alignment (difflib over lines with globals folded).
"""
import difflib
import os
import re
import sys

sys.path.insert(0, os.path.dirname(__file__))
import pairdiff

pairs = {}
for line in open('data/cotab_map.tsv'):
    s, c, r = line.split()
    if c != '-':
        pairs[c] = s
cot = pairdiff.texts(os.path.expanduser('~/Projects/cotab-re/src'))
sot = pairdiff.texts('src')


def fold(l):
    return re.sub(r'\b[a-z]{0,2}[0-9A-F]{4}(_\w+)?\b', 'G', l.strip())


for arg in sys.argv[1:]:
    hexa = '%04X' % int(arg)
    pat = re.compile(r'\b[a-zA-Z]{0,2}%s(_\w+)?\b' % hexa)
    print('#### %s = %s' % (arg, hexa))
    for key, (body, name) in cot.items():
        if not pat.search(body):
            continue
        skey = pairs.get(key)
        cl = body.splitlines()
        if not skey:
            print('== %s (no partner)' % key)
            for l in cl:
                if pat.search(l):
                    print('   C ' + l.strip())
            continue
        sl = sot[skey][0].splitlines()
        sm = difflib.SequenceMatcher(None, [fold(l) for l in cl], [fold(l) for l in sl], autojunk=False)
        print('== %s -> %s' % (key, skey))
        for i, l in enumerate(cl):
            if not pat.search(l):
                continue
            j = None
            for tag, i1, i2, j1, j2 in sm.get_opcodes():
                if i1 <= i < i2:
                    j = j1 + (i - i1) if tag == 'equal' else j1
                    if tag != 'equal':
                        j = list(range(j1, j2)) or [j1]
                    break
            print('   C ' + l.strip())
            for jj in (j if isinstance(j, list) else [j]):
                if jj is not None and jj < len(sl):
                    print('   S ' + sl[jj].strip())
