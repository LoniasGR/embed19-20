import numpy as np
import sys

if (len(sys.argv) < 1):
    print('Usage:')
    print('python statistics.py namefile')
    exit(1)

values = []
with open(sys.argv[1], 'r') as f:
    for l in f.readlines():
        values.append(int(l))

if (len(sys.argv) < 2):
    print('Average time: ' + str(np.average(values)) + 'ms.')
    print('Maximum time ' + str(np.max(values)) + 'ms.')
    print('Minimum time ' + str(np.min(values)) + 'ms.')

else:
    print(str(np.average(values)))