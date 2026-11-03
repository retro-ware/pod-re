"""dsmap.py: CotAB data-segment address -> SotSB address, from the matched procedure pairs.

Within each pair (data/cotab_map.tsv) the folded token streams are aligned; where they agree, a
global named by its address on the CotAB side (b4FB1, w0B06, a0B50_ec3f, ...) faces its SotSB
counterpart. Each such meeting is a vote. Writes data/ds_map.tsv: COTAB SOTSB VOTES OTHERS.
"""
import collections
import difflib
import os
import re
import sys

sys.path.insert(0, os.path.dirname(__file__))
import procmatch

GLOBAL = re.compile(r'^(?:[abwlpgsdc]|sb|si|PV\d+_\d+)?([0-9A-F]{4})(?:_\w+)?$')


def raw_bodies(src_dir):
    """Like procmatch.bodies, but the raw tokens (same positions as the folded ones)."""
    out = {}
    import glob
    for path in sorted(glob.glob(os.path.join(src_dir, 'O*.PAS')) + glob.glob(os.path.join(src_dir, 'R*.PAS'))):
        text = open(path, encoding='latin-1').read()
        impl = text.find('implementation')
        text = text[impl:] if impl >= 0 else text
        heads = [m for m in procmatch.PROC.finditer(text)
                 if not re.match(r'\s*(far;\s*)?(forward|external)', text[m.end():m.end() + 30], re.I)
                 and not m.group(2).startswith(('DROP', 'X'))]
        for i, m in enumerate(heads):
            end = heads[i + 1].start() if i + 1 < len(heads) else len(text)
            body = re.sub(r'\{[^}]*\}', '', text[m.start():end])
            unit = os.path.basename(path)[:-4]
            out['%s.%s' % (unit, m.group(2))] = procmatch.TOKEN.findall(body)
    return out


def main():
    s_raw = raw_bodies('src')
    c_raw = raw_bodies(os.path.expanduser('~/Projects/cotab-re/src'))
    votes = collections.defaultdict(collections.Counter)
    for line in open('data/cotab_map.tsv'):
        s, c, r = line.split()
        if c == '-':
            continue
        st, ct = s_raw[s], c_raw[c]
        sm = difflib.SequenceMatcher(None, procmatch.fold(' '.join(ct)), procmatch.fold(' '.join(st)), autojunk=False)
        fc, fs = procmatch.fold(' '.join(ct)), procmatch.fold(' '.join(st))
        if len(fc) != len(ct) or len(fs) != len(st):
            continue        # tokenisation drifted (should not happen)
        for a, b, n in sm.get_matching_blocks():
            for k in range(n):
                x, y = ct[a + k], st[b + k]
                mx, my = GLOBAL.match(x), GLOBAL.match(y)
                if mx and my:
                    votes[mx.group(1)][my.group(1)] += 1
    with open('data/ds_map.tsv', 'w') as f:
        for ca in sorted(votes):
            (sa, n), *rest = votes[ca].most_common()
            f.write('%s\t%s\t%d\t%s\n' % (ca, sa, n, ' '.join('%s:%d' % kv for kv in rest)))
    print('mapped', len(votes))


if __name__ == '__main__':
    main()
