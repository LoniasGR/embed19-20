CC = gcc
CFLAGS = -pthread -lcdsl -L./../synch_implementations -I./../synch_implementations

all: drr_SLLcl_SLLpk drr_DLLcl_SLLpk drr_SLLcl_DLLpk drr_DLLcl_DLLpk drr_DYNARRcl_DLLpk drr_DYNARRcl_SLLpk drr_DYNARRcl_DYNARRpk drr_SLLcl_DYNARRpk drr_DLLcl_DYNARRpk

drr_SLLcl_SLLpk: drr.c drr.h trace.h
	$(CC) $(CFLAGS) -DSLL_CL -DSLL_PK drr.c drr.h trace.h

drr_DLLcl_SLLpk: drr.c drr.h trace.h
	$(CC) $(CFLAGS) -DDLL_CL -DSLL_PK drr.c drr.h trace.h

drr_SLLcl_DLLpk: drr.c drr.h trace.h
	$(CC) $(CFLAGS) -DSLL_CL -DDLL_PK drr.c drr.h trace.h

drr_DLLcl_DLLpk: drr.c drr.h trace.h
	$(CC) $(CFLAGS) -DDLL_CL -DDLL_PK drr.c drr.h trace.h

drr_DYNARRcl_DLLpk: drr.c drr.h trace.h
	$(CC) $(CFLAGS) -DDLL_PK drr.c drr.h trace.h

drr_DYNARRcl_SLLpk: drr.c drr.h trace.h
	$(CC) $(CFLAGS) -DSLL_PK drr.c drr.h trace.h

drr_DYNARRcl_DYNARRpk: drr.c drr.h trace.h
	$(CC) $(CFLAGS) drr.c drr.h trace.h

drr_SLLcl_DYNARRpk: drr.c drr.h trace.h
	$(CC) $(CFLAGS) -DSLL_CL drr.c drr.h trace.h

drr_DLLcl_DYNARRpk: drr.c drr.h trace.h
	$(CC) $(CFLAGS) -DDLL_CL drr.c drr.h trace.h
	
.PHONY : clean

clean:
	-rm -f drr_SLLcl_SLLpk
