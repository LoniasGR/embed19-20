#!/bin/bash

B=($(python scripts/common_divisors.py "$1" "$2" | tr -d '[],'))
executable="$3"

for j in "${B[@]}"; do
    for i in {1..10}; do 
        ./"$executable" "$B" >> _test.txt
    done
    cat _test.txt
    avg=$(python scripts/statistics.py _test.txt avg)
    echo B: "$j", Average Time: "$avg"

    rm -f _test.txt
done
