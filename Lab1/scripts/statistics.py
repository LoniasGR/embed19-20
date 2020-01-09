import numpy as np
import sys

if (len(sys.argv) < 1):
    print('Usage:')
    print('python statistics.py namefile')
    exit(1)

values = []
with open(sys.argv[1], 'r') as f:
    for l in f.readlines():
        values.append(float(l))

if (len(sys.argv) < 3):
    print('Average time: ' + format(np.average(values), '.6f') + 's.')
    print('Maximum time ' + format(np.max(values), '.6f') + 'ms.')
    print('Minimum time ' + format(np.min(values), '.6f') + 'ms.')

else:
    print(format(np.average(values), '.6f'))
