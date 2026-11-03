# Pools of Darkness 1.10 (GOG) rebuild notes

## Files
- `gog/` shipped files from setup_pools_of_darkness_1.10_(28044).exe (Inno Setup 5.6.2 wrapper, in /Users/felix/Desktop/Games/Goldbox). Read-only.
- `orig/GAME.bin` + `orig/GAME.bin.relocs`: EXEPACK-unpacked load image (72784 bytes, 478 relocs), `tools/unexepack.py`.

## EXEPACK (verified)
- `tools/synthgame.py OUT 13AF B3AF` then `EP405 IN.EXE OUT.EXE` (TPDIR=exepack tools/dosrun.sh) reproduces gog/GAME.EXE byte-for-byte.
- Pre-pack minalloc = packed minalloc - 0x238 (EXEPACK rewrites it); maxalloc is kept as is (0xB3AF).

## Toolchain
- Turbo Pascal 6.0 (RTL probe build/probe/P.PAS: GetMem/MemAvail match TP6 byte for byte, not TP5.5).
- toolchain/ copied from sotsb-re (tp55, tp6, exepack). tools/dosrun.sh defaults to tp6.
- Pipeline (tools/, lift/) ported from cotab-re (TP6). Layout constants live in tools/layout.py and skel.py.

## Skeleton (tools/skel.py, tools/build.sh, tools/cmp.py)
- All 51 game units compile byte-identical as BASM skeletons. Only System differs: RTL calls are literal bytes,
  so smart linking drops RTL code and the EXE/OVR lack their relocations until the lifter makes them real calls.
- Asm tails ({$L}): R116, R1C3, R47F, R670, R6C9, R716. External code uses `55 8B EC` (Pascal uses `55 89 E5`);
  tools/procs.py stops a Pascal proc at that prologue. Tail entries called from other units go in the interface.
- Main uses order needs O06E/O075 swapped vs. reverse paragraph order (MAIN_SWAP).
- R182 init (OvrInit etc.) is {$O+}: StrLoad literal temps. TP frees string temps per statement, so a frame of
  256+6 needs one statement holding both temps (`if F2(FS, '*.exe') then;`).

## GOG binary is cracked (O049:00F4, copy-protection prompt)
The shipped code has 3 patched bytes no Pascal produces: O049+02E7 `74`->`EB` (until-exit jz made jmp)
and O049+0300..0301 `75 06`->`90 90` (always success). Source is the honest
`until (b7FEE = 3) or (s7EEE = s7DEE)`; the release build must apply these 3 bytes after linking.
