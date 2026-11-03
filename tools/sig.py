"""Derive skeleton signatures for each proc in out/procs.json. Adds: locals, body [start,end), result, copies."""
import json, re, struct, collections
units = {u['key']: u for u in json.load(open('out/units.json'))}
P = json.load(open('out/procs.json'))
RES = [  # epilogue result loads, longest first
    (bytes.fromhex('8b46fa8b5efc8b56fe'), 'real'), (bytes.fromhex('8b46fc8b56fe'), 'longint'), (bytes.fromhex('c446fc8cc2'), 'longint'),
    (bytes.fromhex('8b46fe'), 'word'), (bytes.fromhex('8a46ff'), 'byte')]
COPY = re.compile(rb'\xc4\x7e(.)\x06\x57(?:\x8d\x7e(.)|\x8d\xbe(..))\x16\x57\xb8(..)\x50\x9a(..)(..)', re.S)
stats = collections.Counter()
def parse(code, p):
    e, end = p['entry'], p['end']
    b = code[e:end]
    assert b[:3] == b'\x55\x89\xe5'
    i = 3; loc = 0
    if b[i:i+2] == b'\x83\xec': loc = b[i+2]; i += 3
    elif b[i:i+2] == b'\x81\xec': loc = struct.unpack('<H', b[i+2:i+4])[0]; i += 4
    copies = []
    while True:
        m = COPY.match(b, i)
        if not m: break
        src = m.group(1)[0]
        dst = (m.group(2)[0] - 256) if m.group(2) else struct.unpack('<h', m.group(3))[0]
        n = struct.unpack('<H', m.group(4))[0]
        copies.append({'src': src, 'dst': dst, 'n': n, 'rtl': struct.unpack('<H', m.group(5))[0]})
        i = m.end()
    # epilogue
    r = b[-1] if b[-1] in (0xc3, 0xcb) else b[-3]
    j = len(b) - (1 if b[-1] in (0xc3, 0xcb) and len(b) < 3 or b[-3] not in (0xc2, 0xca) else 3) - 1  # index of 5d
    if b[-3] in (0xc2, 0xca): j = len(b) - 4
    else: j = len(b) - 2
    assert b[j] == 0x5d, (hex(e), b[-6:].hex())
    k = j
    if b[k-2:k] == b'\x89\xec': k -= 2
    elif loc: stats['loc-no-movspbp'] += 1
    res = None
    for pat, t in RES:
        if b[k-len(pat):k] == pat: res = t; k -= len(pat); break
    p.update(locals=loc, copies=copies, result=res, body=[e + i, e + k])
    stats['res-%s' % res] += 1
    stats['copies-%d' % len(copies)] += 1
for key, v in P.items():
    code = open('out/u/%s.bin' % key, 'rb').read()
    for p in v['procs']:
        if p.get('bad'): continue
        try: parse(code, p)
        except AssertionError as ex: print('FAIL', key, ex); stats['fail'] += 1
json.dump(P, open('out/procs.json', 'w'), indent=0)
print(stats)
rtl = collections.Counter((c['rtl'], c['n'] == 255) for v in P.values() for p in v['procs'] for c in p.get('copies', []))
print(rtl)
