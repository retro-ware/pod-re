"""ovrpatch.py OVR: apply data/unit_patches.json (post-link jcc -> jmp patches in overlaid units) to a built .OVR.

Each patch is located by the 12 bytes of shipped code before it (unique in the file) and refused otherwise."""
import json, sys
f = sys.argv[1]
d = bytearray(open(f, 'rb').read())
for key, ps in json.load(open('data/unit_patches.json')).items():
    code = open('out/u/%s.bin' % key, 'rb').read()
    for off, orig, shipped in ps:
        ctx = code[off - 12:off]
        i = d.find(ctx)
        if i < 0 or d.find(ctx, i + 1) >= 0 or d[i + 12] != int(orig, 16):
            sys.exit('ovrpatch: %s %04X site not found or not unique' % (key, off))
        d[i + 12] = int(shipped, 16)
        print('ovrpatch: %s %04X %s -> %s' % (key, off, orig, shipped))
open(f, 'wb').write(d)
