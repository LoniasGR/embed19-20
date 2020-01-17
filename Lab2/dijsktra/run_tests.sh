#!/bin/bash

execs=("dijkstra_SLL" "dijkstra_DLL" "dijkstra_DYNARR" "dijkstra" )

for e in "${execs[@]}"; do
    IFS='_'
    read -ra NAME <<< "$e"
    echo ${NAME[1]}
    valgrind --log-file="mem_accesses_log.txt" \
        --tool=lackey \
        --trace-mem=yes \
        ./"$e" input.dat
    cat mem_accesses_log.txt | grep 'I\| L' | wc -l
    valgrind --tool=massif --massif-out-file=./test.out ./"$e" input.dat
    ms_print ./test.out > results/mem_footprint_log_"${NAME[1]}".txt
    rm test.out
    rm mem_accesses_log.txt

done
