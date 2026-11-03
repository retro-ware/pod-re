# Pools of Darkness 1.10 (GOG) rebuild notes

## Files
- `gog/` shipped files from setup_pools_of_darkness_1.10_(28044).exe (Inno Setup 5.6.2 wrapper, in /Users/felix/Desktop/Games/Goldbox). Read-only.
- `orig/GAME.bin` + `orig/GAME.bin.relocs`: EXEPACK-unpacked load image (72784 bytes, 478 relocs), `tools/unexepack.py`.

## EXEPACK (verified)
- `tools/synthgame.py OUT 13AF B3AF` then `EP405 IN.EXE OUT.EXE` (TPDIR=exepack tools/dosrun.sh) reproduces gog/GAME.EXE byte-for-byte.
- Pre-pack minalloc = packed minalloc - 0x238 (EXEPACK rewrites it); maxalloc is kept as is (0xB3AF).

## Toolchain
- Turbo Pascal, banner "Portions Copyright (c) 1983,90 Borland". Not yet matched against TURBO.TPL (sibling SotSB is TP 5.5).
- toolchain/ copied from sotsb-re (tp55, tp6, exepack).
