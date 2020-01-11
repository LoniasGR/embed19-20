import numpy as np
import sys

if (len(sys.argv) < 1):
    print('Usage:')
    print('python fastest_rectangle.py namefile')
    exit(1)

fastest = 999999999.99

with open(sys.argv[1], 'r') as f:
    f.readline()
    for l in f.readlines():
        line = l.replace('\n', '').split(' ')
        if (float(line[6]) < fastest):
            fastest = float(line[6])
            result = l
print(l)
