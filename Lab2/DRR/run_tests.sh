#!/bin/bash

execs=("drr_SLLcl_SLLpk" "drr_DLLcl_SLLpk" "drr_SLLcl_DLLpk" \
    "drr_DLLcl_DLLpk" "drr_DYNARRcl_DLLpk" "drr_DYNARRcl_SLLpk" \
    "drr_DYNARRcl_DYNARRpk" "drr_SLLcl_DYNARRpk" "drr_DLLcl_DYNARRpk" )

for e in "${execs[@]}"; do
    IFS='_'
    read -ra NAME <<< "$e"
    echo ${NAME[1]} ", " ${NAME[2]}
    valgrind --log-file="mem_accesses_log.txt" \
        --tool=lackey \
        --trace-mem=yes \
        ./"$e"
    cat mem_accesses_log.txt | grep 'I\| L' | wc -l
    valgrind --tool=massif --massif-out-file=./test.out ./"$e"
    ms_print ./test.out > results/mem_footprint_log_"${NAME[1]}"_"${NAME[2]}".txt
    rm test.out
    rm mem_accesses_log.txt

done
