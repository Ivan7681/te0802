import os
import mmap
import struct
import time

# open dev/mem file
foo = os.open("/dev/mem", os.O_RDWR | os.O_SYNC)

# Create peripheral
disp = mmap.mmap(foo, 0x10000, flags=mmap.MAP_SHARED, prot=(mmap.PROT_READ | mmap.PROT_WRITE), offset=0x80000000)

# Counter
for index in range(0,16):
    data2write = index*4096+index*256+index*16+index;
    disp[0:2] = struct.pack("=H", data2write)
    time.sleep(1)
