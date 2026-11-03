"""rtlprobe.py DIR PAS: map System routines called by a TP5.5 probe program onto this game's System segment.
Each probe line's System far calls are named after the line's text; prints OFF-in-game, score, label."""
import sys, re, struct
D, src = sys.argv[1], sys.argv[2]
h = open(D + '/' + src.replace('.PAS', '.EXE'), 'rb').read()
img = h[struct.unpack('<H', h[8:10])[0]*16:]
mp = open(D + '/' + src.replace('.PAS', '.MAP')).read()
lines = [(int(a), int(b, 16)) for a, b in re.findall(r'(\d+) 0000:([0-9A-F]{4})', mp.split('Line numbers')[1])]
segs = re.findall(r'(?m)^ ([0-9A-F]{5})H [0-9A-F]{5}H [0-9A-F]{5}H (\w+) +CODE', mp.replace('\r', ''))
sysp = [int(a, 16) for a, n in segs if n == 'SYSTEM'][0] >> 4
text = open(D + '/' + src, encoding='latin1').read().splitlines()
game = open('out/u/System.bin', 'rb').read()
tsys = img[sysp*16:]
def best(off):
    pat = tsys[off:off+24]
    sc = max(range(len(game) - 24), key=lambda g: sum(a == b for a, b in zip(pat, game[g:g+24])))
    return sc, sum(a == b for a, b in zip(pat, game[sc:sc+24]))
for i, (ln, a) in enumerate(lines):
    b = lines[i+1][1] if i + 1 < len(lines) else a + 0x40
    k = 0; j = a
    while j < b:
        if img[j] == 0x9a and struct.unpack('<H', img[j+3:j+5])[0] == sysp:
            off = struct.unpack('<H', img[j+1:j+3])[0]
            g, s = best(off)
            print('%04X %2d  %s  #%d  (probe %04X)' % (g, s, text[ln-1].strip(), k, off)); k += 1
            j += 5
        else: j += 1
