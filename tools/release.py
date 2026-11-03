"""release.py: build/full -> build/rel/GAME.bin(+.relocs) for synthgame.py, and GAME.OVR with the shipped crack applied.
The GOG GAME.OVR has the copy-protection check (O049:00F4) patched; no Pascal produces those bytes (see NOTES.md)."""
import os, struct
CRACK = {'O049': {0x02E7: b'\xEB', 0x0300: b'\x90\x90'}}
h = open('build/full/GAME.EXE', 'rb').read()
nrel, hp = struct.unpack('<HH', h[6:10]); rp = struct.unpack('<H', h[0x18:0x1a])[0]
img = h[hp * 16:]
rel = [s * 16 + o for o, s in (struct.unpack('<HH', h[rp + 4*i:rp + 4*i + 4]) for i in range(nrel))]
ov = bytearray(open('build/full/GAME.OVR', 'rb').read())
for l in open('build/full/GAME.MAP'):
    p = l.split()
    if len(p) == 5 and p[4] == 'CODE' and p[3] in CRACK:
        fo = struct.unpack('<I', img[int(p[0][:-1], 16) + 4:][:4])[0]   # overlay stub header: file offset of the code
        for at, b in CRACK.pop(p[3]).items(): ov[fo + at:fo + at + len(b)] = b
assert not CRACK, 'unit not found in map: %s' % CRACK
os.makedirs('build/rel', exist_ok=True)
open('build/rel/GAME.bin', 'wb').write(img)
open('build/rel/GAME.bin.relocs', 'w').write(''.join('%X\n' % r for r in rel))
open('build/rel/GAME.OVR', 'wb').write(ov)
