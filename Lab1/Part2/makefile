CC = gcc
CFLAGS = -O0 -c

all: tables

tables.o: tables.c 
	$(CC) $(CFLAGS) tables.c

tables: tables.o
	$(CC) tables.o -o tables

.PHONY : clean

clean:
	-rm -f tables.o
