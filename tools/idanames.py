"""Extract names from ref/coab/coab_new.lst (IDA listing of CotAB 1.3) keyed by our addresses.
Writes names.tsv: KEY OFF KIND NAME, KEY = 4-hex resident segment, oNN for overlay NN (1-based stub order), DS for data."""
import re
lst = open('ref/coab/coab_new.lst', 'rb').read().decode('latin-1').splitlines()
segs = []
for l in lst:
    m = re.match(r'^([a-z]+\d+):0000 ([a-z]+\d+)\s+segment', l)
    if m: segs.append(m.group(1))
# resident/stub segments in file order map to our paragraph sequence
ours = [0x000] + list(range(0, 0))
order = ['seg001'] + ['stub%03d' % i for i in range(1, 32)] + ['seg031', 'stub032', 'stub033', 'stub034', 'seg035',
         'stub036', 'seg037', 'stub038', 'seg039', 'seg040', 'seg041', 'seg042', 'seg043', 'seg044', 'seg045',
         'seg046', 'seg049', 'seg050', 'seg051']
import struct
o = open('orig/GAME.bin', 'rb').read()
# paragraph bases: walk stubs/segments by size from the listing
last = {}
for l in lst:
    m = re.match(r'^([a-z]+\d+):([0-9A-F]+)', l)
    if m: last[m.group(1)] = int(m.group(2), 16)
base = {}; p = 0
for s in order:
    base[s] = p; p += (last[s] + 1 + 15) // 16 if s != 'seg001' else 0x36
assert base['seg051'] == 0x8F7 and p == 0xABE, hex(p)
import json as _j
byseg = {u['seg']: u['key'] for u in _j.load(open('out/units.json'))}
key = {s: ('J%03X' % base[s]) if s.startswith('stub') else byseg[base[s]] for s in order}
key['seg001'] = 'M'
import json
ovk = [u['key'] for u in json.load(open('out/units.json')) if u['key'][0] == 'O' and u['key'] != 'Overlay']
for i in range(1, 35): key['ovr%03d' % i] = ovk[i-1]
key['ovr036'] = 'O130'
key['seg600'] = 'DS'
out = []
for l in lst:
    m = re.match(r'^([a-z]+\d+):([0-9A-F]+) ([A-Za-z_@$?][\w@$?]*)\s+(proc|db|dw|dd|label|struc|\w+ <)', l)
    if not m or m.group(1) not in key: continue
    kind = 'proc' if m.group(4) == 'proc' else 'data'
    out.append('%s\t%s\t%s\t%s' % (key[m.group(1)], m.group(2)[-4:], kind, m.group(3)))
for l in lst:
    m = re.match(r'^([a-z]+\d+):([0-9A-F]+) ([A-Za-z_@$?][\w@$?]*):', l)
    if m and m.group(1) in key and not m.group(3).startswith(('loc_', 'locret_')):
        out.append('%s\t%s\tlabel\t%s' % (key[m.group(1)], m.group(2)[-4:], m.group(3)))
open('names.tsv', 'w').write('\n'.join(sorted(set(out))) + '\n')
print(len(out))
