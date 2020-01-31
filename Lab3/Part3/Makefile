CC = gcc
CFLAGS = -Wall -g
OBJ = string_manipulation_sped_up.o strcmp.o strcpy.o strcat.o strlen.o
ASS = strcmp.s strcpy.s strcat.s strlen.s

all: string_manipulation.out 

string_manipulation_sped_up.o: string_manipulation_sped_up.c
	$(CC) -c -o $@ $^ $(CFLAGS)

%.o: $(ASS).s
	$(CC) -c -o $@ $< $(CFLAGS)

string_manipulation.out: $(OBJ)
	$(CC) -o $@ $^

test_strlen.o: test_strlen.c
	$(CC) -c -o $@ $^ $(CFLAGS)

test_strlen: test_strlen.o strlen.o
	$(CC) -o $@ $^

test_strcpy.o: test_strcpy.c
	$(CC) -c -o $@ $^ $(CFLAGS)

test_strcpy: test_strcpy.o strcpy.o
	$(CC) -o $@ $^

test_strcat.o: test_strcat.c
	$(CC) -c -o $@ $^ $(CFLAGS)

test_strcat: test_strcat.o strcat.o
	$(CC) -o $@ $^

test_strcmp.o: test_strcmp.c
	$(CC) -c -o $@ $^ $(CFLAGS)

test_strcmp: test_strcmp.o strcmp.o
	$(CC) -o $@ $^