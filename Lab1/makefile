CC =\ gcc
CFLAGS = -O0 -c

all: phods

phods.o: phods.c
	$(CC) $(CFLAGS) phods.c -o phods.o

phods: phods.o
	$(CC) -o phods phods.o

clean:
	-rm -f phods.o