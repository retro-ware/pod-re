"""pairdiff.py SOTSB-ADDR...: unified diff of a SotSB procedure against its CotAB counterpart.

CotAB globals are renamed to their SotSB addresses (data/ds_map.tsv) and both procedure names to
'SELF', so what remains is the real difference to port. SOTSB-ADDR is like O047:0571.
"""
import difflib
import os
import re
import sys

sys.path.insert(0, os.path.dirname(__file__))
import procmatch

COTAB_SRC = os.path.expanduser('~/Projects/cotab-re/src')


def texts(src_dir):
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
            body = re.sub(r'\s*\{@[^}]*\}', '', text[m.start():end])
            body = re.sub(r'\{ [0-9A-F]{4} \}\s*$', '', body.rstrip()).rstrip() + '\n'
            out['%s.%s' % (os.path.basename(path)[:-4], m.group(2))] = (body, m.group(2))
    return out


def main():
    pairs = {}
    for line in open('data/cotab_map.tsv'):
        s, c, r = line.split()
        pairs[s] = (c, r)
    moved = {}
    for line in open('data/ds_map.tsv'):
        f = line.split('\t')
        moved[f[0]] = f[1]
    sot, cot = texts('src'), texts(COTAB_SRC)
    callee = {}
    for s_, (c_, _) in pairs.items():
        if c_ != '-' and s_ in sot:
            callee[c_.split('.', 1)[1].lower()] = sot[s_][1]
    for arg in sys.argv[1:]:
        u, a = arg.split(':')
        key = '%s.p%s_%s' % (u, u, a)
        c, r = pairs.get(key, ('-', '0'))
        sb, sname = sot[key]
        if c == '-':
            print('== %s: no CotAB counterpart\n%s' % (arg, sb))
            continue
        cb, cname = cot[c]
        cb = re.sub(r'\b([a-z]{0,2})([0-9A-F]{4})(?=_|\b)', lambda m: m.group(1) + moved.get(m.group(2), m.group(2)), cb)
        cb = cb.replace(cname, 'SELF')
        # CotAB callees by their SotSB names
        cb = re.sub(r'\b(p[OR][0-9A-F]{3}_[0-9A-F]{4}|[A-Za-z_]\w*)\b(?=\s*[(;:]|\s*$)',
                    lambda m: callee.get(m.group(1).lower(), m.group(1)), cb)
        sb = sb.replace(sname, 'SELF')
        print('== %s vs %s (%s)' % (arg, c, r))
        sys.stdout.writelines(difflib.unified_diff(cb.splitlines(True), sb.splitlines(True), 'cotab', 'sotsb', n=2))


if __name__ == '__main__':
    main()
