"""List TP overlay stubs in START.bin and their GAME.OVR code ranges."""
import struct, sys
o = open('orig/START.bin', 'rb').read()
ov = open('gog/GAME.OVR', 'rb').read()
s = 0x36
stubs = []
while o[s*16:s*16+2] == b'\xcd\x3f':
    b = s*16
    _, fo, csz, rsz, nj, link = struct.unpack('<HIHHHH', o[b+2:b+16])
    ents = [struct.unpack('<H', o[b+0x22+5*i:b+0x24+5*i])[0] for i in range(nj)]
    stubs.append((s, fo, csz, rsz, nj, link, ents))
    s += (0x20 + 5*nj + 15) // 16
for st in stubs:
    if '-v' in sys.argv or True:
        print('stub %04X ovr %06X code %04X fix %04X jumps %2d link %04X  %s' % (st[0], st[1], st[2], st[3], st[4], st[5], ' '.join('%04X' % e for e in st[6])))
print('next seg after stubs %04X, %d overlays, ovr end %X file %X' % (s, len(stubs), max(x[1]+x[2]+x[3] for x in stubs), len(ov)))
