"""findruns.py EXE: map runs of a test EXE's image onto orig/START.bin (12-byte unique anchors)."""
import struct, sys
h = open(sys.argv[1], 'rb').read(); img = h[struct.unpack('<H', h[8:10])[0]*16:]
o = open('orig/START.bin', 'rb').read()
idx = {}
for i in range(0, len(o)-12): idx.setdefault(o[i:i+12], []).append(i)
runs = []
for i in range(0, len(img)-12):
    k = img[i:i+12]
    if k in idx and len(idx[k]) == 1:
        t = idx[k][0]
        if runs and runs[-1][1] + (i - runs[-1][0]) == t and i - runs[-1][2] < 40: runs[-1][2] = i; continue
        runs.append([i, t, i])
for a, t, b in runs:
    if b - a > 32: print('test %05X-%05X -> orig %05X-%05X (seg %04X+%X)' % (a, b+12, t, t+b-a+12, t >> 4, t & 15))
