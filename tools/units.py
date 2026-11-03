"""Split START.bin + GAME.OVR into units. Writes out/units.json and out/u/<KEY>.bin (code) for every unit.
KEY: M = main program, Rxxx = resident unit at paragraph xxx, Oxxx = overlaid unit whose stub is at paragraph xxx,
TPL units: Dos, Crt, Overlay, System. Fixups: list of [offset_of_segment_word, target_paragraph]."""
import struct, json, os
o = open('orig/START.bin', 'rb').read()
ov = open('gog/GAME.OVR', 'rb').read()
rel = [int(l, 16) for l in open('orig/START.bin.relocs')]
DS = 0xDE2
tpl = {0xBDB: 'Dos', 0xC07: 'Overlay', 0xC5D: 'System'}
# segment starts: main, stubs and resident code in paragraph order
starts = []
p = 0x44
starts.append((0, 'M'))
while p < DS:
    if o[p*16:p*16+2] == b'\xcd\x3f':
        nj = struct.unpack('<H', o[p*16+0xC:p*16+0xE])[0]
        starts.append((p, 'O%03X' % p)); p += (0x20 + 5*nj + 15) // 16; continue
    nxt = min([s for s in set(struct.unpack('<H', o[a:a+2])[0] for a in rel) if s > p] + [DS])
    starts.append((p, tpl.get(p, 'R%03X' % p))); p = nxt
os.makedirs('out/u', exist_ok=True)
units = []
for i, (p, k) in enumerate(starts):
    end = starts[i+1][0] if i+1 < len(starts) else DS
    u = {'key': k, 'seg': p, 'paras': end - p}
    if k[0] == 'O' and k[1:].isalnum() and k != 'Overlay':
        b = p*16
        _, fo, csz, rsz, nj, link = struct.unpack('<HIHHHH', o[b+2:b+16])
        code = ov[fo:fo+csz]
        fix = [struct.unpack('<H', ov[fo+csz+2*j:fo+csz+2*j+2])[0] for j in range(rsz//2)]
        u.update(ovr_offset=fo, entries=[struct.unpack('<H', o[b+0x22+5*j:b+0x24+5*j])[0] for j in range(nj)])
    else:
        code = o[p*16:end*16]
        # strip paragraph padding: keep up to last nonzero byte (refined later by proc analysis)
        fix = sorted(a - p*16 for a in rel if p*16 <= a < end*16)
    u['size'] = len(code)
    u['fixups'] = [[f, struct.unpack('<H', code[f:f+2])[0]] for f in fix]
    open('out/u/%s.bin' % k, 'wb').write(code)
    units.append(u)
# init offsets: main's entry calls every unit's init block (far call seg:off) in init order
inits = {}
q = 0x8B
while o[q] == 0x9A:
    off, sg = struct.unpack('<HH', o[q+1:q+5]); inits[sg] = off; q += 5
for u in units:
    if u['seg'] in inits and u['key'] != 'System':
        off = inits[u['seg']]
        if 'entries' in u: off = u['entries'][(off - 0x20) // 5]
        u['init'] = off
units[0]['init'] = q
json.dump(units, open('out/units.json', 'w'), indent=1)
for u in units: print(u['key'], hex(u['seg']), hex(u['size']), len(u['fixups']), u.get('entries', '')[:4] if u.get('entries') else '')
