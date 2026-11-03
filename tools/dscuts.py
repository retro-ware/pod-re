"""dscuts.py: DS item boundaries from code references -> data/cuts.txt (direct [disp] operands and mov di/si,imm
before push ds). Used by tools/gendata.py when there are no IDA names."""
import json, struct, sys
sys.path.insert(0, 'tools/lift')
from capstone import Cs, CS_ARCH_X86, CS_MODE_16, x86
md = Cs(CS_ARCH_X86, CS_MODE_16); md.detail = True
P = json.load(open('out/procs.json'))
cuts = set()
for k, v in P.items():
    code = open('out/u/%s.bin' % k, 'rb').read()
    for p in v['procs']:
        prev = None
        for ins in md.disasm(code[p['entry']:p['end']], p['entry']):
            for o in ins.operands:
                if o.type == x86.X86_OP_MEM and o.mem.base == 0 and o.mem.index == 0 and o.mem.segment in (0, x86.X86_REG_DS):
                    cuts.add(o.mem.disp & 0xFFFF)
            if prev is not None and prev.mnemonic == 'mov' and prev.bytes[0] in (0xbf, 0xbe, 0xb8) and ins.bytes == b'\x1e':
                cuts.add(struct.unpack('<H', prev.bytes[1:3])[0])
            prev = ins
cuts = sorted(c for c in cuts if 2 <= c < 0x5958 or 0x59A2 <= c < 0xA6EC)
open('data/cuts.txt', 'w').write('\n'.join('%04X' % c for c in cuts) + '\n')
print(len(cuts), 'cuts')
