"""rawwhy.py [UNIT...]: why statements fall back to raw (the reasons recorded in ctx.raws), counted."""
import sys, os, re, collections
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import lift
from ir import LiftError
import emit
reasons = collections.Counter(); ex = {}
orig = emit.Emitter.stmt if hasattr(emit.Emitter, 'stmt') else None
keys = sys.argv[1:]
for (k, e), pr in sorted(lift.PROCS.items()):
    if keys and k not in keys: continue
    ctx = None
    try:
        ctx, em, fr, body = lift.render(pr)
    except LiftError as x:
        pass
    except Exception:
        continue
    c = getattr(lift, 'LAST_CTX', None)
    for r in (getattr(ctx, 'raws', None) or (c.raws if c is not None and c.pr is pr else [])):
        rr = re.sub(r'0x[0-9a-f]+|\b[0-9a-f]{3,}\b', 'N', str(r))[:70]
        reasons[rr] += 1; ex.setdefault(rr, '%s:%04X' % (k, e))
for r, n in reasons.most_common(40): print('%5d %-70s %s' % (n, r, ex[r]))
