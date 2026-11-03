#!/usr/bin/env python3
"""pasm.py FILE START END: print Pascal lines with inline asm db blocks disassembled."""
import sys, subprocess, tempfile, re
f, a, b = sys.argv[1], int(sys.argv[2]), int(sys.argv[3])
lines = open(f, encoding='latin1').read().split('\n')[a-1:b]
buf = []
tmp = tempfile.NamedTemporaryFile(suffix='.bin', delete=False).name
def flush():
    global buf
    if buf:
        open(tmp, 'wb').write(bytes(buf))
        out = subprocess.run(['ndisasm', '-b16', tmp], capture_output=True, text=True).stdout
        for l in out.splitlines():
            print('      | ' + l[10:].strip())
        buf = []
for l in lines:
    s = l.strip()
    if s.startswith('db ') and re.fullmatch(r'db [0-9, ]+', s):
        buf += [int(x) for x in s[3:].split(',')]
        continue
    flush()
    print(l)
flush()
