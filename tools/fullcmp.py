"""fullcmp.py [BUILDDIR]: whole-file comparison of a build with the original.
- load image of GAME.EXE vs orig/GAME.bin (unpacked original)
- relocation table (set and order) vs orig/GAME.bin.relocs
- GAME.OVR vs gog/GAME.OVR
- header fields (SS:SP, CS:IP, minalloc/maxalloc) printed for comparison with the packed original's EXEPACK info
"""
import struct, sys
D = sys.argv[1] if len(sys.argv) > 1 else 'build/full'
h = open(D + '/GAME.EXE', 'rb').read()
hdr = struct.unpack('<14H', h[:28])
img = h[hdr[4] * 16:]
o = open('orig/GAME.bin', 'rb').read()
orel = [int(l, 16) for l in open('orig/GAME.bin.relocs')]
brel = [struct.unpack('<HH', h[hdr[12] + 4*i:hdr[12] + 4*i + 4]) for i in range(hdr[3])]
brel = [s * 16 + off for off, s in brel]
n = min(len(img), len(o))
diffs = [i for i in range(n) if img[i] != o[i]]
print('image  %d/%d bytes, %d differ%s' % (len(img), len(o), len(diffs), (' first %X' % diffs[0]) if diffs else ''))
print('relocs %d/%d, same set %s, same order %s' % (len(brel), len(orel), set(brel) == set(orel), brel == orel))
ov = open(D + '/GAME.OVR', 'rb').read(); oo = open('gog/GAME.OVR', 'rb').read()
od = [i for i in range(min(len(ov), len(oo))) if ov[i] != oo[i]]
print('ovr    %d/%d bytes, %d differ%s' % (len(ov), len(oo), len(od), (' first %X' % od[0]) if od else ''))
print('header ss:sp %04X:%04X cs:ip %04X:%04X minalloc %04X maxalloc %04X' % (hdr[7], hdr[8], hdr[11], hdr[10], hdr[5], hdr[6]))
ok = not diffs and len(img) == len(o) and brel == orel and ov == oo
print('IDENTICAL' if ok else 'DIFFERENT')
