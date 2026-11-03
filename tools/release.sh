#!/bin/sh
# release.sh: TPC build -> crack patch -> EP405 pack (min/max 13AF/B3AF) -> compare build/rel with gog/
cd "$(dirname "$0")/.." || exit 1
PY=.venv/bin/python
tools/build.sh && $PY tools/release.py && $PY tools/synthgame.py build/rel/IN.EXE 13AF B3AF build/rel/GAME.bin || exit 1
rm -f build/rel/GAME.EXE; printf 'EP405 IN.EXE GAME.EXE > EP.TXT\r\n' > build/rel/P.BAT
TPDIR=exepack tools/dosrun.sh build/rel P.BAT
for f in GAME.EXE GAME.OVR; do cmp -s build/rel/$f gog/$f && echo "$f identical" || echo "$f DIFFERENT"; done
