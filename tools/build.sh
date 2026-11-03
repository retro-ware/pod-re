#!/bin/sh
# build.sh: compile src/ with TP 5.5 in DOSBox-X into build/full; result build/full/START.EXE + START.OVR
cd "$(dirname "$0")/.." || exit 1
rm -rf build/full && mkdir -p build/full && cp src/*.PAS build/full/ && cp src/*.OBJ build/full/ 2>/dev/null
printf "TPC /B /GD /L ${TPCOPT} START.PAS > OUT.TXT\r\n" > build/full/B.BAT
tools/dosrun.sh build/full B.BAT
tr '\r' '\n' < build/full/OUT.TXT | grep -E -B1 -A3 'Error|lines' | tail -8
