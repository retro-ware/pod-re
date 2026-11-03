"""sysmap.py: map COTAB's (TP6) named System RTL routines onto this game's TP5.5 System segment by code bytes.
Prints System rows for names.tsv: System<TAB>OFF<TAB>kind<TAB>name, plus unmatched names on stderr."""
import sys, re
C = '/Users/felix/Projects/cotab-re/'
co = open(C + 'orig/START.bin', 'rb').read()[0x8F70:0xABE0]
so = open('out/u/System.bin', 'rb').read()
rows = [l.rstrip('\n').split('\t') for l in open(C + 'names.tsv') if l.startswith('System\t')]
rows = [(int(o, 16), k, n) for _, o, k, n in rows]
def pat(b):
    # wildcard 16-bit immediates/displacements crudely: keep opcode bytes, regex '..' for words after known opcodes
    return re.escape(b)
used = {}
for off, kind, name in rows:
    found = None
    for ln in (24, 16, 12, 8):
        b = co[off:off+ln]
        # mask DS offsets: replace bytes following A1/A3/8B 1E/89 1E/C7 06/... by wildcards
        p = b''
        i = 0
        while i < len(b):
            p += re.escape(b[i:i+1]); i += 1
        hits = [m.start() for m in re.finditer(p, so, re.S)]
        if len(hits) == 1: found = hits[0]; break
        if len(hits) > 1:
            # prefer the hit closest to the same relative position
            found = min(hits, key=lambda h: abs(h - off * len(so) / len(co))); break
    if found is None: print('MISS', '%04X' % off, kind, name, file=sys.stderr)
    else: print('System\t%04X\t%s\t%s' % (found, kind, name))
