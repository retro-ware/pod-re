"""litobj.py: src/LIT.OBJ = empty CODE segment with a public for every external of src/LIT.PAS (TP 5.5 rejects
nasm's OMF, so this uses tools/omfw.py)."""
import re, sys
sys.path.insert(0, 'tools')
import omfw
src = open('src/LIT.PAS', encoding='latin-1').read()
impl = src.split('implementation', 1)[1]
names = re.findall(r'(?:procedure|function)\s+(\w+)[^;]*(?:;[^;]*)*?;\s*external;', impl, re.I)
if not names:
    names = re.findall(r'(?:procedure|function)\s+(\w+)', src.split('implementation', 1)[0], re.I)
m = omfw.Module('LIT')
m.seg('CODE', 'CODE', 'byte', b'')
for n in dict.fromkeys(names): m.pubs.append((n.upper(), 'CODE', 0))
open('src/LIT.OBJ', 'wb').write(m.bytes())
print(len(m.pubs), 'publics')
