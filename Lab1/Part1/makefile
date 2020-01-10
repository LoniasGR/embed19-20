CC = gcc
CFLAGS = -O0 -c

all: phods phods_optimized phods_DSE phods_DSE_rectangle

phods.o: phods.c
	$(CC) $(CFLAGS) phods.c -o phods.o

phods: phods.o
	$(CC) phods.o -o phods

phods_optimized.o: phods_optimized.c
	$(CC) $(CFLAGS) phods_optimized.c -o phods_optimized.o

phods_optimized: phods_optimized.o
	$(CC) phods_optimized.o -o phods_optimized

phods_DSE.o: phods_DSE.c
	$(CC) $(CFLAGS) phods_DSE.c -o phods_DSE.o

phods_DSE: phods_DSE.o
	$(CC) phods_DSE.o -o phods_DSE

phods_DSE_rectangle.o: phods_DSE_rectangle.c
	$(CC) $(CFLAGS) phods_DSE_rectangle.c -o phods_DSE_rectangle.o

phods_DSE: phods_DSE_rectangle.o
	$(CC) phods_DSE_rectangle.o -o phods_DSE_rectangle
clean:
	-rm -f phods.o phods_optimized.o phods_DSE.o phods_DSE_rectangle.o
