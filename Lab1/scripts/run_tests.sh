#!/bin/bash

file="$2"
executable="$1"
B="$3"

rm -rf "$file"

for i in {1..10}
do 
    ./"$executable" "$B"  >> "$file"
done
