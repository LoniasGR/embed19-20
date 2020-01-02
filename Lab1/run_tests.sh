#!/bin/bash

file="$2"
executable="$1"

rm -rf "$file"

for i in {1..10}
do 
    ./"$executable" >> "$file"
done
