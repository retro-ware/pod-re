"""why.py PATTERN [N]: procedures whose lift fails with a message matching PATTERN, with the failing instruction."""
import sys, os, re, traceback
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import lift
from ir import LiftError
pat = re.compile(sys.argv[1]); n = int(sys.argv[2]) if len(sys.argv) > 2 else 10
for (k, e), pr in sorted(lift.PROCS.items()):
    try:
        lift.render(pr)
    except LiftError as ex:
        if not pat.search(str(ex)):
            continue
        ins = None
        tb = ex.__traceback__
        while tb:
            v = tb.tb_frame.f_locals.get('ins')
            if hasattr(v, 'address'):
                ins = v
            tb = tb.tb_next
        print('%s %04X  %s  @%s' % (k, e, str(ex)[:70], '%04X %s %s' % (ins.address, ins.mnemonic, ins.op_str) if ins else '?'))
        n -= 1
        if n == 0:
            break
