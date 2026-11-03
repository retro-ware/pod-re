"""handlermap.py UNIT TABLEPROC BASEHEX: a SotSB handler table (p<addr> := Pointer(@...) lines of
TABLEPROC) with each entry's CotAB counterpart and the Go function whose doc comment cites it
('// name = UNIT:ADDR')."""
import glob, os, re, sys
sys.path.insert(0, os.path.dirname(__file__))
from xref import cotab_addr  # noqa: E402  (xref writes its outputs on import)

unit, proc, base = sys.argv[1], sys.argv[2], int(sys.argv[3], 16)
text = open('src/%s.PAS' % unit, encoding='latin-1').read()
body = text[text.rindex('procedure p%s_%s;' % (unit, proc)):]
body = body[:body.index('\nend;')]
pairs = {}
for line in open('data/cotab_map.tsv'):
    s, c, r = line.split()
    pairs[s] = (c, r)
cited = {}
for path in glob.glob(os.path.expanduser('~/Projects/sotsb-go/engine/*.go')):
    for m in re.finditer(r'^// (\w+) = ([OR][0-9A-F]{3}:[0-9A-F]{4})', open(path).read(), re.M):
        cited.setdefault(m.group(2), m.group(1))
for a, p in re.findall(r'p([0-9A-F]{4}) := Pointer\(@p(\w+)\)', body):
    n = (int(a, 16) - base) // 4
    c, r = pairs.get('%s.p%s' % (p.split('_')[0], p), ('-', '0'))
    ca = cotab_addr(c) if c != '-' else None
    print(n, p, c, r, ca or '-', cited.get(ca, '-'))
