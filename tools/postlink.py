"""postlink.py IN.EXE OUT.EXE: apply the shipped binary's one post-link patch to a TPC-built START.EXE.

The shipped 1.30 START.EXE disables the copy-protection block in the main program: the `jz` (74 33) that TP 5.5
emits for `if ParamStr(2) <> sA5E6 then begin ... end` was changed to `jmp` (EB 33). No Pascal source makes
TP 5.5 emit a string compare followed by a bare jmp (see NOTES.md, "Main program"), so the build applies this
byte after linking. The patch is located by its surroundings and refused if they do not match."""
import struct, sys
src, dst = sys.argv[1], sys.argv[2]
d = bytearray(open(src, 'rb').read())
img = struct.unpack('<H', d[8:10])[0] * 16
# mov di,0A5E6h; push ds; push di; call far StrCmp; jz +33h; call far O069 entry (9A 25 00 ..)
ctx = bytes.fromhex('bfe6a51e579a')
i = d.find(ctx, img, img + 0x440)
j = i + len(ctx) + 4
if i < 0 or d[j:j + 2] != b'\x74\x33' or d[j + 2:j + 5] != b'\x9a\x25\x00':
    sys.exit('postlink: patch site not found (main program changed?)')
d[j] = 0xEB
open(dst, 'wb').write(d)
print('postlink: main %04X jz -> jmp' % (j - img))
