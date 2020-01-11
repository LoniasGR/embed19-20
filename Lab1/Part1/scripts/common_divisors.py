import sys


num1 = int(sys.argv[1])
num2 = int(sys.argv[2])

if (num1 >= 1 and num2 >= 1):
    gc = [1]

    for i in range(2, min(num1, num2) + 1):
        if (num1%i==0 and num2%i==0):
            gc.append(i)

    print(gc)

else: 
    exit(1)