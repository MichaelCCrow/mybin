#!/bin/bash

if [[ $# < 2 ]]; then 
    add-instructions1 "path" "new status to write"
    exit
fi
for f in `ls $1`; do
    python changestatus.py "$1/$f" $2
done
echo "done"
