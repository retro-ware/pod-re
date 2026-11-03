"""exedis.py EXE [START [LEN]]: disassemble an MZ load image (hex offsets)."""
import struct, sys, subprocess
h = open(sys.argv[1], 'rb').read(); img = h[struct.unpack('<H', h[8:10])[0]*16:]
a = int(sys.argv[2], 16) if len(sys.argv) > 2 else 0
n = int(sys.argv[3], 16) if len(sys.argv) > 3 else 0x100
print(subprocess.run(['ndisasm', '-b16', '-o', str(a), '-'], input=img[a:a+n], capture_output=True).stdout.decode())
