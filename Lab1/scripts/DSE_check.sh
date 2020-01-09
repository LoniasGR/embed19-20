#!/bin/bash

B=`python scripts/common_divisors.py "$1" "$2"`
executable="$1"

for j in "${B[@]}"; do
    for i in {1..10}; do 
        ./"$executable" "$B" > _test.txt
    done

    avg=`python scripts/statistics _test.txt avg`
    echo 'B: "$j", Average Time: "$avg"'
done