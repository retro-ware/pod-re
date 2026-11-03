# Checklist: Pools of Darkness GAME.EXE/GAME.OVR byte-perfect rebuild

- [x] Extract GOG installer (innoextract) into gog/
- [x] Unpack EXEPACK, verify EP405 round trip reproduces GAME.EXE
- [x] Confirm compiler: Turbo Pascal 6.0
- [x] Map segments, units, overlays, DS layout, RTL entry points
- [x] Generate GAMEDATA (typed constants + variables)
- [x] Port cotab-re pipeline; skeleton compiles, all game units byte-identical
- [x] Lift all procedures to Pascal (System calls real -> relocations, RTL linked)
- [x] Hand-written main program body (data/main_body.pas)
- [x] Full image + GAME.OVR identical (tools/fullcmp.py)
- [x] Release script (tools/release.sh, applies the 3-byte crack): TPC -> EP405 13AF/B3AF -> compare with gog/
- [x] Lessons appended to ~/notes/how-to-decompile.md
