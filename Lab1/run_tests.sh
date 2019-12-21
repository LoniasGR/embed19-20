#!/bin/bash

rm -f results.txt

for i in {1..10}
do 
    ./phods >> resuts.txt
done
