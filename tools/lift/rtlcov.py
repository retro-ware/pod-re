"""rtlcov.py: for each System RTL routine called by the game, how many call sites are lifted Pascal
(proc ok and the call outside the proc's raw statement ranges). --clear drops the raw ranges that hold the
only calls of uncovered routines, so the next lift loop retries them."""
import sys, os, json, struct, collections
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import prog
from prog import PROCS, skel
st = json.load(open('data/lift_status.json'))


def raws(k, e):
    return [tuple(int(x, 16) for x in r.split('-')) for r in st.get('raw:%s:%04X' % (k, e), [])]


use = collections.defaultdict(list)     # routine -> [(key, entry, call site, covered, raw range)]
for (k, e), pr in PROCS.items():
    code = prog.code_of(k)
    a, b = pr.p['body']
    fx = {f: s for f, s in skel.U[k]['fixups']}
    rr = raws(k, e)
    for f, s in fx.items():
        if a < f < b and s == 0x825 and code[f-3] == 0x9a:
            o = struct.unpack('<H', code[f-2:f])[0]
            at = f - 3
            inr = [r for r in rr if r[0] <= at < r[1]]
            cov = st.get('%s:%04X' % (k, e)) == 'ok' and not inr
            use[prog.RTL.get(o, '%04X' % o)].append((k, e, at, cov, inr[0] if inr else None))
clear = collections.defaultdict(set)
for n, sites in sorted(use.items()):
    if any(s[3] for s in sites):
        continue
    print('%-45s sites %3d  e.g. %s:%04X  %s' % (n, len(sites), sites[0][0], sites[0][1],
                                                 st.get('%s:%04X' % sites[0][:2], '')[:50]))
    for k, e, at, cov, r in sites:
        if r:
            clear[(k, e)].add('%04X-%04X' % r)
if '--clear' in sys.argv:
    for (k, e), rs in clear.items():
        key = 'raw:%s:%04X' % (k, e)
        st[key] = [r for r in st[key] if r not in rs]
    for n, sites in use.items():
        if not any(s[3] for s in sites):
            for k, e, at, cov, r in sites:
                if str(st.get('%s:%04X' % (k, e), '')).startswith('fail'):
                    del st['%s:%04X' % (k, e)]
    if '--minimal' in sys.argv:
        # procedures that fail as a whole: lift only the statements with the uncovered calls
        for n, sites in use.items():
            if any(s[3] for s in sites):
                continue
            for k, e, at, cov, r in sites:
                key = '%s:%04X' % (k, e)
                mk = 'min:' + key
                if mk not in st:
                    st[mk] = []
                if '%04X' % at not in st[mk]:
                    st[mk].append('%04X' % at)
                st.pop(key, None)
                st.pop('raw:' + key, None)
    json.dump(st, open('data/lift_status.json', 'w'), indent=0)
    print('cleared', sum(map(len, clear.values())), 'raw ranges')
