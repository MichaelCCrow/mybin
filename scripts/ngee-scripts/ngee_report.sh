#!/bin/bash

#How to run:
#bash ngee_report.sh | cut -d ':' -f $one_two_or_three

approved="/metadata/ngee/approved/"
cd $approved

#grep accconst | cut -d '>' -f 2 | cut -d '<' -f 1

declare -a report=()
for f in `ls` #`ls $approved`
do
    authors=`grep -r origin $f | cut -d '>' -f 2 | cut -d '<' -f 1`
    access=`grep -r accconst $f | cut -d '>' -f 2 | cut -d '<' -f 1`
    taskname=`grep -r taskname $f | cut -d '>' -f 2 | cut -d '<' -f 1`
    task=`python /home/mcu/scripts/taskdict.py $taskname`
    echo "$access $task"

    row="$f:$authors:,$access$taskname"
    report+=("$row\n")
done

#echo "report:"
#echo -e ${report[@]}
#echo -e "\n\n\n---------------------------------------------------------------\n\n\n"

#declare -a rr=()
#python taskdict.py 
#for i in `echo -e ${report[@]} | cut -d ':' -f $1`; do
#  task=`echo $i | cut -d ',' -f 2
#  acc=`echo $i | cut -d ',' -f 1
#echo $task
#echo $acc
#  task=`python /home/mcu/scripts/taskdict.py $task`
#  rr+=("$acc - $task\n")
#done
#echo $rr
