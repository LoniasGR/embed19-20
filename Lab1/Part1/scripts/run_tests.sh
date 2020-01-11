#!/bin/bash

file="$2"
executable="$1"
B1="$3"
B2="$4"
rm -rf "$file"

for i in {1..10}
do 
    ./"$executable" "$B1" "$B2"  >> "$file"
done
