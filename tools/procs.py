"""Split each unit's code into procedures (TP6 Pascal frames) and derive skeleton signatures.
Writes out/procs.json: {unit: [{start, entry, end, lits, far, retn, locals, result, copies, kind}]}"""
import json, struct, re, sys
units = json.load(open('out/units.json'))
PRO = b'\x55\x89\xe5'

def analyze(code, init_hint=None):
    """Return list of procs. A proc = [lit_start, entry) literals + [entry, end) code, end after its final ret."""
    n = len(code)
    starts = [m.start() for m in re.finditer(re.escape(PRO), code)]
    procs = []
    pos = 0
    i = 0
    while i < len(starts):
        e = starts[i]
        # find the final ret of this proc: the last ret before the next prologue that is preceded by pop bp (5d)
        nxt = starts[i+1] if i+1 < len(starts) else n
        seg = code[e:nxt]
        best = None
        for m in re.finditer(rb'\x5d(\xc3|\xcb|\xc2..|\xca..)', seg, re.S):
            best = m
        if best is None:
            # prologue inside data or a frame whose epilogue is past the next prologue: merge
            starts.pop(i+1) if i+1 < len(starts) else None
            if i+1 >= len(starts) and best is None:
                procs.append({'lit': pos, 'entry': e, 'end': n, 'bad': 1}); pos = n; break
            continue
        end = e + best.end()
        r = best.group(1)
        far = r[0] in (0xcb, 0xca)
        retn = struct.unpack('<H', r[1:3])[0] if len(r) == 3 else 0
        procs.append({'lit': pos, 'entry': e, 'end': end, 'far': far, 'retn': retn})
        pos = end
        i += 1
    return procs, pos

out = {}
tot = 0
for u in units:
    if u['key'] in ('Dos', 'Crt', 'Overlay', 'System'): continue
    code = open('out/u/%s.bin' % u['key'], 'rb').read()
    pas = len(code)
    if 'init' in u and u['key'] != 'M':
        m = re.search(rb'\x5d\xcb', code[u['init']:])
        pas = u['init'] + m.end()
    procs, tail = analyze(code[:pas])
    if procs and procs[-1]['entry'] != u.get('init', procs[-1]['entry']): print('INIT MISMATCH', u['key'])
    out[u['key']] = {'procs': procs, 'tail': tail, 'size': len(code), 'obj': [pas, len(code)] if pas < len(code) else None}
    tot += len(procs)
    bad = sum(1 for p in procs if p.get('bad'))
    print('%-5s %3d procs  tail %04X/%04X  bad %d' % (u['key'], len(procs), tail, len(code), bad))
print('total', tot)
json.dump(out, open('out/procs.json', 'w'), indent=0)
