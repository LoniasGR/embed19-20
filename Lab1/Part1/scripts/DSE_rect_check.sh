#!/bin/bash

Bx=($(python scripts/divisors.py "$1" | tr -d '[],'))
By=($(python scripts/divisors.py "$2" | tr -d '[],'))

executable="$3"

echo "$executable" results > results/"$executable".txt

for j in "${Bx[@]}"; do
    for k in "${By[@]}"; do 
        echo bx: "$j" by "$k"
        for i in {1..10}; do 
            ./"$executable" "$j" "$k" >> _test.txt
        done
        avg=$(python scripts/statistics.py _test.txt avg)
        echo Bx: "$j", By: "$k" Average Time: "$avg" >> results/"$executable".txt
    done
    rm -f _test.txt
done
