#!/bin/bash

B=($(python scripts/common_divisors.py "$1" "$2" | tr -d '[],'))
executable="$3"

echo "$executable" results > results/"$executable".txt

for j in "${B[@]}"; do
    for i in {1..10}; do 
        ./"$executable" "$j" >> _test.txt
    done
    avg=$(python scripts/statistics.py _test.txt avg)
    echo B: "$j", Average Time: "$avg" >> results/"$executable".txt

    rm -f _test.txt
done
