"""dsdump.py [HEX...]: the initialised data-segment items of GAMEDATA.PAS, address, size and a preview.

With addresses, only the items containing them. Pascal-string-looking items print as text.
"""
import re
import sys

ITEM = re.compile(r'^\{([0-9A-F]{4})\} d\w+: (?:array\[0\.\.(\d+)\] of (\w+)|(\w+)) = \(?(.*?)\)?;\s*$', re.S | re.M)


def items():
    text = open('src/GAMEDATA.PAS', encoding='latin-1').read()
    text = text[text.index('const'):]
    for chunk in re.split(r'\n(?=\{[0-9A-F]{4}\})', text):
        m = ITEM.match(chunk.strip())
        if not m:
            continue
        at = int(m.group(1), 16)
        vals = [int(v) for v in re.findall(r'-?\d+', m.group(5))] if m.group(2) else []
        yield at, vals, chunk.strip()


def preview(vals):
    pr = ''.join(chr(v) if 32 <= v < 127 else '.' for v in vals)
    return pr


def main():
    want = [int(a, 16) for a in sys.argv[1:]]
    for at, vals, raw in items():
        n = len(vals) or 1
        if want and not any(at <= w < at + n for w in want):
            continue
        print('%04X %5d %4d  %s' % (at, at, n, preview(vals)[:160] if vals else raw[:100]))
        if want:
            print('     ', vals[:200])


if __name__ == '__main__':
    main()
