"""fieldmap.py: CotAB record-field offsets -> SotSB offsets, voted from the procedure pairs.

The lifter names a field access PR<offset>_<type> (and PRA<offset>_<type> for arrays). Where the
folded token streams of a pair (data/cotab_map.tsv) agree, the CotAB field faces its SotSB
counterpart; each meeting is a vote. Records of different kinds share offsets, so the votes
are split by the variable the field hangs off (p7D38, v4p, ...): only the type and access
matter here. Writes data/field_map.tsv: COTAB-OFFSET TYPE SOTSB-OFFSET VOTES OTHERS.
"""
import collections
import difflib
import os
import re
import sys

sys.path.insert(0, os.path.dirname(__file__))
import dsmap
import procmatch

FIELD = re.compile(r'^PR(A?)(\d+)_(\w+)$')


def main():
    s_raw = dsmap.raw_bodies('src')
    c_raw = dsmap.raw_bodies(os.path.expanduser('~/Projects/cotab-re/src'))
    votes = collections.defaultdict(collections.Counter)
    for line in open('data/cotab_map.tsv'):
        s, c, r = line.split()
        if c == '-':
            continue
        st, ct = s_raw[s], c_raw[c]
        fc, fs = procmatch.fold(' '.join(ct)), procmatch.fold(' '.join(st))
        if len(fc) != len(ct) or len(fs) != len(st):
            continue
        sm = difflib.SequenceMatcher(None, fc, fs, autojunk=False)
        for a, b, n in sm.get_matching_blocks():
            for k in range(n):
                mx, my = FIELD.match(ct[a + k]), FIELD.match(st[b + k])
                if mx and my and mx.group(1) == my.group(1):
                    key = (int(mx.group(2)), mx.group(1) + mx.group(3))
                    votes[key][int(my.group(2))] += 1
    with open('data/field_map.tsv', 'w') as f:
        for key in sorted(votes):
            (so, n), *rest = votes[key].most_common()
            f.write('%d\t%s\t%d\t%d\t%s\n' % (key[0], key[1], so, n, ' '.join('%d:%d' % kv for kv in rest)))
    print('fields', len(votes))


if __name__ == '__main__':
    main()
