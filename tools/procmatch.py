"""procmatch.py: pair each Silver Blades procedure with its Curse of the Azure Bonds counterpart.

Both decompilations are byte-exact Turbo Pascal with generated names, so a procedure's body is
compared as a token stream with every identifier, number and string folded to a class. Pairs are
picked greedily by similarity (difflib ratio), best first. Writes data/cotab_map.tsv:
SOTSB-PROC  COTAB-PROC  RATIO  (unmatched SotSB procs get '-').
"""
import difflib
import glob
import os
import re
import sys

PROC = re.compile(r'^\s*(procedure|function)\s+([A-Za-z_]\w*)\b(\([^)]*\))?[^;(]*;\s*$', re.I | re.M)
TOKEN = re.compile(r"'[^']*'|\$[0-9A-Fa-f]+|\d+|[A-Za-z_]\w*|:=|<>|<=|>=|\S")
KEYWORDS = set('''begin end if then else while do repeat until for to downto case of with var and or not
xor div mod shl shr exit inc dec ord chr lo hi length move fillchar mem memw port nil true false break
succ pred abs odd copy concat pos'''.split())


def bodies(src_dir):
    out = {}
    for path in sorted(glob.glob(os.path.join(src_dir, 'O*.PAS')) + glob.glob(os.path.join(src_dir, 'R*.PAS'))):
        text = open(path, encoding='latin-1').read()
        impl = text.find('implementation')
        text = text[impl:] if impl >= 0 else text
        heads = [m for m in PROC.finditer(text) if not re.match(r'\s*(far;\s*)?(forward|external)', text[m.end():m.end() + 30], re.I)
                 and not m.group(2).startswith(('DROP', 'X'))]
        for i, m in enumerate(heads):
            end = heads[i + 1].start() if i + 1 < len(heads) else len(text)
            body = re.sub(r'\{[^}]*\}', '', text[m.start():end])
            unit = os.path.basename(path)[:-4]
            out['%s.%s' % (unit, m.group(2))] = fold(body)
    return out


def fold(body):
    toks = []
    for t in TOKEN.findall(body):
        low = t.lower()
        if low in KEYWORDS:
            toks.append(low)
        elif t[0] == "'":
            toks.append('S')
        elif t[0] == '$' or t[0].isdigit():
            toks.append('N')
        elif t[0].isalpha() or t[0] == '_':
            toks.append('C' if re.match(r'p[OR][0-9A-F]+_', t) or t.startswith('X') else 'I')
        else:
            toks.append(t)
    return toks


def main():
    sotsb = bodies(sys.argv[1] if len(sys.argv) > 1 else 'src')
    cotab = bodies(os.path.expanduser(sys.argv[2] if len(sys.argv) > 2 else '~/Projects/cotab-re/src'))
    by_len = sorted(cotab.items(), key=lambda kv: len(kv[1]))
    cands = []
    for sname, stoks in sotsb.items():
        n = len(stoks)
        sm = difflib.SequenceMatcher(None, autojunk=False)
        sm.set_seq2(stoks)
        for cname, ctoks in by_len:
            if len(ctoks) < n * 0.6 or len(ctoks) > n * 1.6 + 10:
                continue
            sm.set_seq1(ctoks)
            if sm.real_quick_ratio() < 0.6 or sm.quick_ratio() < 0.6:
                continue
            r = sm.ratio()
            if r >= 0.6:
                cands.append((r, sname, cname))
    cands.sort(reverse=True)
    used_s, used_c, pairs = set(), set(), {}
    for r, s, c in cands:
        if s in used_s or c in used_c:
            continue
        used_s.add(s); used_c.add(c)
        pairs[s] = (c, r)
    with open('data/cotab_map.tsv', 'w') as f:
        for s in sorted(sotsb):
            c, r = pairs.get(s, ('-', 0))
            f.write('%s\t%s\t%.3f\n' % (s, c, r))
    exact = sum(1 for c, r in pairs.values() if r == 1)
    print('sotsb procs %d, cotab procs %d, matched %d (identical %d)' % (len(sotsb), len(cotab), len(pairs), exact))


if __name__ == '__main__':
    main()
