"""Compare a build (build/full/GAME.EXE + GAME.OVR) with the original, unit by unit.

usage: cmp.py [-v] [UNIT...]
Prints per unit: size orig/built, number of differing bytes, first diff offset (and the proc containing it).
"""
import json, struct, sys, os

D = sys.argv[1] if len(sys.argv) > 1 and os.path.isdir(sys.argv[1]) else 'build/full'
args = [a for a in sys.argv[1:] if a != D and not a.startswith('-')]
verbose = '-v' in sys.argv

def load_exe(path):
    h = open(path, 'rb').read()
    hs = struct.unpack('<H', h[8:10])[0] * 16
    nrel = struct.unpack('<H', h[6:8])[0]; rp = struct.unpack('<H', h[0x18:0x1a])[0]
    rel = [struct.unpack('<HH', h[rp + 4*i:rp + 4*i + 4]) for i in range(nrel)]
    return h, h[hs:], [s * 16 + o for o, s in rel]

def units_of(img, ovr, relocs, init_calls_at):
    """Walk the init call list of the main block to find unit segments; return {key: (code, fixups)}."""
    # segment list: from relocation targets, like units.py
    segs = sorted(set(struct.unpack('<H', img[a:a+2])[0] for a in relocs))
    return segs

U = json.load(open('out/units.json'))
P = json.load(open('out/procs.json'))
h, img, rel = load_exe(D + '/GAME.EXE')
ov = open(D + '/GAME.OVR', 'rb').read()
# segments from the MAP file
segmap = {}
for l in open(D + '/GAME.MAP'):
    p = l.split()
    if len(p) == 5 and p[4] == 'CODE' and p[0].endswith('H'):
        segmap[p[3]] = (int(p[0][:-1], 16), int(p[2][:-1], 16))
NAMEMAP = {'GAME': 'M', 'DOS': 'Dos', 'CRT': 'Crt', 'OVERLAY': 'Overlay', 'SYSTEM': 'System'}
built = {}
for name, (start, size) in segmap.items():
    key = NAMEMAP.get(name, name)
    if key.startswith('O') and key != 'Overlay':
        b = start
        _, fo, csz, rsz, nj, link = struct.unpack('<HIHHHH', img[b+2:b+16])
        built[key] = (ov[fo:fo+csz], [struct.unpack('<H', ov[fo+csz+2*j:fo+csz+2*j+2])[0] for j in range(rsz//2)],
                      [struct.unpack('<H', img[b+0x22+5*j:b+0x24+5*j])[0] for j in range(nj)], size)
    else:
        built[key] = (img[start:start+size], sorted(a - start for a in rel if start <= a < start + size), None, size)

# segment -> key maps (orig / build)
OSEG = {u['seg']: u['key'] for u in U}; OSEG[0x9E7] = 'DS'
BSEG = {}
for name, (start, size) in segmap.items(): BSEG[start // 16] = NAMEMAP.get(name, name)
for l in open(D + '/GAME.MAP'):
    p = l.split()
    if len(p) == 5 and p[4] == 'DATA': BSEG[int(p[0][:-1], 16) // 16] = 'DS'
def resolve(segs, seg, ofs, op):
    k = segs.get(seg, '?%X' % seg)
    if op == 0x9a and k.startswith('O') and k != 'Overlay': return (k, (ofs - 0x20) // 5)
    return (k, ofs if op == 0x9a else None)

tot = 0
for u in U:
    k = u['key']
    if args and k not in args: continue
    if k not in built: print('%-8s missing in build' % k); continue
    oc = open('out/u/%s.bin' % k, 'rb').read()
    bc, bfix, bent, ssize = built[k]
    if 'entries' in u:
        stub = 'stub %d/%d entries%s' % (len(bent), len(u['entries']), '' if bent == u['entries'] else ' DIFF')
    else:
        stub = ''
        # resident: original segment includes paragraph padding
        oc = oc[:len(bc)] if len(oc) >= len(bc) and not any(oc[len(bc):]) else oc
    n = min(len(oc), len(bc))
    oc = bytearray(oc); bc = bytearray(bc)
    bset = set(bfix)
    badfix = 0
    for f, s in u['fixups']:
        op = oc[f-3] if f >= 3 else 0
        if OSEG.get(s) == 'System' or f < 3: continue
        if f not in bset or f + 2 > len(bc) or f + 2 > len(oc): badfix += 1; continue
        bs = struct.unpack('<H', bc[f:f+2])[0]
        ro = resolve(OSEG, s, struct.unpack('<H', oc[f-2:f])[0], op)
        rb = resolve(BSEG, bs, struct.unpack('<H', bc[f-2:f])[0], bc[f-3] if f >= 3 else 0)
        if ro == rb:
            oc[f:f+2] = bc[f:f+2] = b'\0\0'
            if op == 0x9a: oc[f-2:f] = bc[f-2:f] = b'\0\0'
        else: badfix += 1
    # compiler-generated System calls: offsets differ until System links the same routines
    for f in bfix:
        if f >= 3 and f + 2 <= n and bc[f-3] == 0x9a and oc[f-3] == 0x9a and BSEG.get(struct.unpack('<H', bc[f:f+2])[0]) == 'System' \
                and struct.unpack('<H', oc[f:f+2])[0] == 0x825:
            oc[f-2:f+2] = bc[f-2:f+2] = b'\0\0\0\0'
    diff = [i for i in range(n) if oc[i] != bc[i]]
    ofix = [f for f, s in u['fixups'] if OSEG.get(s) != 'System']
    bfix = [f for f in bfix if not (f + 2 <= len(bc) and BSEG.get(struct.unpack('<H', bytes(built[k][0][f:f+2]))[0]) == 'System')]
    bfix = [f for f in bfix if BSEG.get(struct.unpack('<H', bytes(bc[f:f+2]))[0]) != 'System'] if False else bfix
    fixd = '' if ofix == bfix and not badfix else ' fixups %d/%d bad %d' % (len(bfix), len(ofix), badfix)
    first = ''
    if diff or len(oc) != len(bc):
        d0 = diff[0] if diff else n
        pr = [p for p in P.get(k, {}).get('procs', []) if p['lit'] <= d0 < p['end']]
        first = ' first %04X%s' % (d0, ' in proc %04X' % pr[0]['entry'] if pr else '')
    ok = not diff and len(oc) == len(bc) and not fixd and (not stub or 'DIFF' not in stub)
    tot += not ok
    if not ok or verbose:
        print('%-8s %s size %04X/%04X diffs %d%s%s %s' % (k, 'OK ' if ok else 'BAD', len(bc), len(oc), len(diff), first, fixd, stub))
print('units differing:', tot)
