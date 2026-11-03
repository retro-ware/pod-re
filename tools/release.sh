#!/bin/sh
# release.sh: end-to-end build of the shipped files from source, then a byte comparison with gog/.
#   src/ (+ data/main_body.pas) --TPC 5.5--> build/full/START.EXE + START.OVR
#   --postlink.py (1-byte patch)--> --EXEPACK 4.05--> build/release/START.EXE, build/release/GAME.OVR
# Exit status 0 only if both files are byte-identical to gog/START.EXE and gog/GAME.OVR.
cd "$(dirname "$0")/.." || exit 1
PY=.venv/bin/python
$PY tools/skel.py M || exit 1          # src/START.PAS from data/main_body.pas
tools/build.sh
[ -f build/full/START.EXE ] || { echo 'release: compile failed'; exit 1; }
rm -rf build/release && mkdir -p build/release
$PY tools/postlink.py build/full/START.EXE build/release/IN.EXE || exit 1
printf 'EP405 IN.EXE START.EXE > PACK.TXT\r\n' > build/release/B.BAT
TPDIR=exepack tools/dosrun.sh build/release B.BAT
rm -f build/release/IN.EXE build/release/B.BAT
cp build/full/START.OVR build/release/GAME.OVR
$PY tools/ovrpatch.py build/release/GAME.OVR || exit 1
echo '--- per-unit compare of the unpacked build (tools/cmp.py)'
$PY tools/cmp.py build/full
echo '--- shipped files'
ok=0
for f in START.EXE GAME.OVR; do
  if cmp -s build/release/$f gog/$f; then echo "$f IDENTICAL"; else echo "$f DIFFERENT"; ok=1; fi
done
exit $ok
