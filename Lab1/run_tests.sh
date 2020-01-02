#!/bin/bash

file="$1"
rm -rf "$file"

for i in {1..10}
do 
    ./phods >> "$file"
done
