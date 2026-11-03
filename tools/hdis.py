"""hdis.py KEY ENTRY: disassembly of one procedure with call targets named (System RTL, TPL, unit procedures)."""
import sys, struct, subprocess, re
sys.path.insert(0, 'tools')
import skel
k, e = sys.argv[1], int(sys.argv[2], 16)
p = next(p for p in skel.P[k]['procs'] if p['entry'] == e)
code = open('out/u/%s.bin' % k, 'rb').read()
fix = dict((f, s) for f, s in skel.U[k]['fixups'])
rtl = {int(l.split('\t')[1], 16): l.split('\t')[3].strip() for l in open('names.tsv') if l.startswith('System')}
out = subprocess.run(['ndisasm', '-b16', '-o', str(e), '-'], input=code[e:p['end']], capture_output=True).stdout.decode()
for l in out.split('\n'):
    m = re.match(r'([0-9A-F]{8})\s+(\S+)\s+(.*)', l)
    if not m: continue
    a = int(m.group(1), 16); ins = m.group(3); note = ''
    if code[a] == 0x9A and a + 3 in fix:
        sg, of = fix[a + 3], struct.unpack('<H', code[a+1:a+3])[0]
        note = rtl.get(of, '?') if skel.SEG.get(sg) == 'System' else (skel.target(sg, of) or '?')
    elif code[a] == 0xE8:
        t = (a + 3 + struct.unpack('<h', code[a+1:a+3])[0]) & 0xFFFF
        note = skel.NAME.get((k, t)) or skel.tail_labels(k).get(t, ('?',))[0]
    print('%04X  %-34s %s' % (a, ins, ('; ' + note) if note else ''))
