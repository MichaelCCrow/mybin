#!/bin/bash

#ABOUT:
# Simple script to calculate all given iterations of a given number incremented by a given percentage.
# 1) basenum 
# 2) iterations 
# 3) rate 
# 4) [optional]starting-iteration
#:ABOUT

if [ $# -lt 3 ]; then #echo -e "\n1)basenum\n2)iteration\n3)rate\n4)[optional]starting-iteration\n"; 
    about $0
    exit
fi

re='^[0-9]+$'
for i in $@; do
    if ! [[ $i =~ $re ]]; then 
        echo -e "\nERROR: $i is not a number\n" >&2; 
        about $0; 
        exit 1
    fi
done

b=$1
lvl=$2
percentage=$3
baselvl=1

p=$(echo "scale=2; $percentage/100" | bc)

echo

if [ $# -eq 4 ]; then 
    if [ $4 -gt $lvl ]; then 
        echo -e "\nERROR: starting-iteration: $2 cannot be larger than iterations: $4\n"; exit 0
    fi
    baselvl=$4; echo starting lvl: $baselvl
fi
echo base: $b lvl: $lvl rate: $p
echo

n=$baselvl

echo "$n: $b"
while [ $n -lt $lvl ]; do
    extra=$(echo "scale=1; $b*$p" | bc)
    b=$(echo "$b+$extra" | bc)
    #b=${b%.*}

    n=$[n + 1]
    echo "$n: $b"
done

echo max: $b
echo

echo "$n: $b"
n=$lvl
p=$(echo "$p+1" | bc)
while [ $n -gt 1 ]; do
    b=$(echo "scale=1; $b/$p" | bc)
    #b=${b%.*}

    n=$[n-1]
    echo "$n: $b"
done
echo
