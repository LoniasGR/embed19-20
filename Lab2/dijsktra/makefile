CC = gcc
CFLAGS = -pthread -lcdsl -no-pie -L./../synch_implementations -I./../synch_implementations

all: dijkstra dijkstra_SLL dijkstra_DLL dijkstra_DYNARR 

dijkstra: dijkstra_original.c
	$(CC) $^ -o $@
dijkstra_SLL: dijkstra.c
	$(CC) $^ -o $@  -DSLL $(CFLAGS)

dijkstra_DLL: dijkstra.c
	$(CC) $^ -o $@  -DDLL $(CFLAGS)

dijkstra_DYNARR: dijkstra.c
	$(CC) $^ -o $@  -DDYNARR $(CFLAGS)

	
.PHONY : clean

clean:
	-rm -f dijkstra_SLL dijkstra_DLL dijkstra_DYNARR dijkstra

