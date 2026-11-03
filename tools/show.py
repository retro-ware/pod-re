"""show.py UNIT:ADDR...: print SotSB procedure bodies (implementation part, no {@} marks)."""
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))
import pairdiff

sot = pairdiff.texts('src')
for arg in sys.argv[1:]:
    u, a = arg.split(':')
    if a == '*':
        for k, (b, n) in sot.items():
            if k.startswith(u + '.'):
                print('{ %s }\n%s' % (k, b))
        continue
    print(sot['%s.p%s_%s' % (u, u, a)][0])
