#!/bin/bash

# File is the output file
# Executable is the executable 
# B1 B2 are parameters (optional). If no input arguments exist, they are empty

file="$2"
executable="$1"
B1="$3"
B2="$4"
rm -rf "$file"

for i in {1..10}
do 
    ./"$executable" "$B1" "$B2"  >> "$file"
done
