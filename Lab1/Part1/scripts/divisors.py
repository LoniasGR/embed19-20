import sys

num1 = int(sys.argv[1])

if (num1 >= 1):
    gc = [1]
    for i in range(2, num1 + 1):
        if (num1%i==0):
            gc.append(i)
    print(gc)

else: 
    exit(1)