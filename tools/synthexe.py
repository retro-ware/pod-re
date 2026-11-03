"""synthexe.py OUT MINALLOC MAXALLOC: a plain MZ from orig/START.bin + relocs (TPC-style 0x1C header), to test the
EXEPACK step without a full build."""
import struct, sys
img = open('orig/START.bin', 'rb').read()
rel = [int(l, 16) for l in open('orig/START.bin.relocs')]
out, mn, mx = sys.argv[1], int(sys.argv[2], 16), int(sys.argv[3], 16)
hdr_paras = (0x1C + 4 * len(rel) + 15) // 16
size = hdr_paras * 16 + len(img)
h = struct.pack('<2s13H', b'MZ', size % 512, (size + 511) // 512, len(rel), hdr_paras, mn, mx,
                0x1876, 0x4000, 0, 0x8B, 0, 0x1C, 0)
h += b''.join(struct.pack('<HH', r & 0xF, r >> 4) if False else struct.pack('<HH', r % 16 + (r // 16 - (r // 16 & 0xF000)) * 0, 0) for r in [])
rt = b''.join(struct.pack('<HH', r - (r >> 4 << 4) + ((r >> 4) & 0x0FFF) * 0, 0) for r in [])
# relocation entries as offset:segment with segment = r >> 4 (paragraph), offset = r & 15
rt = b''.join(struct.pack('<HH', r & 15, r >> 4) for r in sorted(rel))
d = (h + rt).ljust(hdr_paras * 16, b'\0') + img
open(out, 'wb').write(d)
