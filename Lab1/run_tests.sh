#!/bin/bash

rm -rf results.txt

for i in {1..10}
do 
    ./phods >> results.txt
done
