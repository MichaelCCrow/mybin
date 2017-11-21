#!/bin/bash

approved="/metadata/ngee/approved/"
cd $approved

#grep accconst | cut -d '>' -f 2 | cut -d '<' -f 1

declare -a report=()
for f in `ls` #`ls $approved`
do
    authors=`grep -r origin $f | cut -d '>' -f 2 | cut -d '<' -f 1`
    access=`grep -r accconst $f | cut -d '>' -f 2 | cut -d '<' -f 1`

    row="$f:$authors:$access"
    report+=("$row\n")
done

#echo "report:"
#echo -e ${report[@]}
#echo -e "\n\n\n---------------------------------------------------------------\n\n\n"

echo -e ${report[@]} 
#echo -e ${report[@]} | cut -d ':' -f 2
#echo -e ${report[@]} | cut -d ':' -f 3

#for i in `echo -e "${report[@]}"`; do
#    echo $i
#done
