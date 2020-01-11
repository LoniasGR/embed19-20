CC = gcc
CFLAGS = -O0 -c

all: tables tables_exh tables_rand_simpl

tables.o: tables.c 
	$(CC) $(CFLAGS) tables.c

tables: tables.o
	$(CC) tables.o -o tables

tables_exh.o: tables_exh.c 
	$(CC) $(CFLAGS) tables_exh.c

tables_exh: tables_exh.o
	$(CC) tables_exh.o -o tables_exh

tables_rand_simpl.o: tables_rand_simpl.c 
	$(CC) $(CFLAGS) tables_rand_simpl.c

tables_rand_simpl: tables_rand_simpl.o
	$(CC) tables_rand_simpl.o -o tables_rand_simpl

.PHONY : clean

clean:
	-rm -f tables.o tables_exh.o tables_rand_simpl.o
