#!/bin/sh
# dosrun.sh DIR BAT: run DIR/BAT inside DOSBox-X with DIR as C: and Turbo Pascal (TPDIR, default 5.5) as T:.
cd "$(dirname "$0")/.." && D=$(cd "$1" && pwd) && C=$(mktemp -t dosrun) && cat > "$C" <<EOC
[sdl]
output=surface
[dosbox]
memsize=16
[cpu]
core=normal
cycles=max
[autoexec]
mount c "$D"
mount t "$PWD/toolchain/${TPDIR:-tp55}"
set PATH=T:\\
c:
call $2
exit
EOC
SDL_VIDEODRIVER=dummy DOSBOX_NO_HOST_INPUT=1 timeout ${DOSTIMEOUT:-300} ~/tools/dosbox-x-remotedebug/src/dosbox-x -conf "$C" > /dev/null 2>&1; rm -f "$C"
