"""synthgame.py OUT MINALLOC MAXALLOC: plain MZ from orig/GAME.bin + orig/GAME.bin.relocs, header fields taken from the
EXEPACK header of gog/GAME.EXE (SS:SP 19C5:4000, CS:IP 0000:0002). Input to EXEPACK for the round-trip test."""
import struct, sys
img = open('orig/GAME.bin', 'rb').read()
rel = sorted(int(l, 16) for l in open('orig/GAME.bin.relocs') if l.strip())
out, mn, mx = sys.argv[1], int(sys.argv[2], 16), int(sys.argv[3], 16)
hdr_paras = (0x1C + 4 * len(rel) + 15) // 16
size = hdr_paras * 16 + len(img)
h = struct.pack('<2s13H', b'MZ', size % 512, (size + 511) // 512, len(rel), hdr_paras, mn, mx,
                0x19C5, 0x4000, 0, 0x2, 0, 0x1C, 0)
rt = b''.join(struct.pack('<HH', r & 15, r >> 4) for r in rel)
open(out, 'wb').write((h + rt).ljust(hdr_paras * 16, b'\0') + img)
