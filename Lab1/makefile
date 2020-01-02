CC = gcc
CFLAGS = -O0 -c

all: phods phods_optimized clean

phods.o: phods.c
	$(CC) $(CFLAGS) phods.c -o phods.o

phods: phods.o
	$(CC) phods.o -o phods

phods_optimized.o: phods_optimized.clean
	$(CC) $(CFLAGS) phods_optimized.c -o phods_optimized.o

phods_optimized: phods_optimized.o
	$(CC) phods_optimized.o -o phods_optimized
clean:
	-rm -f phods.o phods_optimized.o