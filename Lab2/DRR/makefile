CC = gcc
CFLAGS = -pthread -lcdsl -no-pie -L./../synch_implementations -I./../synch_implementations

all: drr_SLLcl_SLLpk drr_DLLcl_SLLpk drr_SLLcl_DLLpk drr_DLLcl_DLLpk drr_DYNARRcl_DLLpk drr_DYNARRcl_SLLpk drr_DYNARRcl_DYNARRpk drr_SLLcl_DYNARRpk drr_DLLcl_DYNARRpk

drr_SLLcl_SLLpk: drr.c
	$(CC) $^ -o $@  -DSLL_CL -DSLL_PK $(CFLAGS)

drr_DLLcl_SLLpk: drr.c
	$(CC) $^ -o $@ -DDLL_CL -DSLL_PK $(CFLAGS)

drr_SLLcl_DLLpk: drr.c
	$(CC) $(CFLAGS) -DSLL_CL -DDLL_PK -o $@ drr.c

drr_DLLcl_DLLpk: drr.c
	$(CC) $(CFLAGS) -DDLL_CL -DDLL_PK -o $@ drr.c

drr_DYNARRcl_DLLpk: drr.c
	$(CC) $(CFLAGS) -DDYN_ARR_CL -DDLL_PK -$@ drr.c

drr_DYNARRcl_SLLpk: drr.c
	$(CC) $(CFLAGS) -DDYN_ARR_CL -DSLL_PK -$@ drr.c

drr_DYNARRcl_DYNARRpk: drr.c
	$(CC) $(CFLAGS) -DDYN_ARR_CL -DDYN_ADD_PK -o $@ drr.c

drr_SLLcl_DYNARRpk: drr.c
	$(CC) $(CFLAGS) -DSLL_CL -DDYN_ARR_PK -o $@ drr.c

drr_DLLcl_DYNARRpk: drr.c
	$(CC) $(CFLAGS) -DDLL_CL -D_DYN_ARR_PK -o $@ drr.c
	
.PHONY : clean

clean:
	-rm -f drr_SLLcl_SLLpk drr_DLLcl_SLLpk drr_SLLcl_DLLpk drr_DLLcl_DLLpk drr_DYNARRcl_DLLpk drr_DYNARRcl_SLLpk drr_DYNARRcl_DYNARRpk drr_SLLcl_DYNARRpk drr_DLLcl_DYNARRpk


