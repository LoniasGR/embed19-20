import sys

num1 = int(sys.argv[1])
num2 = int(sys.argv[2])

if (num1 > 2 and num2 > 2):
    gc = [1, 2]

    for i in range(3, min(num1, num2) + 1):
        if (num1%i==0 and num2%i==0):
            gc.append(i)

    print(gc)

else: 
    exit(1)