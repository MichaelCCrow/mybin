#!/bin/bash

c=0
m=0
for i; do

if [[ $i == *" "* ]]; then i=$(echo $i | sed -e "s/ /_/g"); fi
if [[ $i == *".NGA"* ]]; then
    filename=$(basename $i | sed -e "s/[.]NGA\(.*\)xml//")
else
    filename=$(basename $i | sed -e "s/[.]xml//")
fi
#echo "f : $filename"

title=$(grep title $i | sed -e "s/<title>\(.*\)<\/title>/\1/" | sed -e 's/^[[:space:]]*//' | sed -e 's/[[:space:]]*$//')
t2=$(java Replacer "$title")
#echo "t1 - $title"
#echo "t2 - $t2"
#title=$(grep title $1 | sed -e "s/<title>\(.*\)<\/title>/\1/" | sed -e "s/[,.:-]//g" | sed -e 's/^[[:space:]]*//' | sed -e "s/ /_/g")
#echo "t : $title"

#title="$(echo $title)"
#filename="$(echo $filename)"

#if [[ $title == *"$filename"* ]]; then
if [[ $filename == *"$t2"* ]]; then
    c=$(( c + 1 ))
    #echo -e "match: f### $filename t### $t2"
else 
    m=$(( m + 1 ))
    #echo -e "\nNO MATCH\nf### $filename\nt### $t2"
    echo $(basename $i)
    #echo $t2
fi
done

#echo "titles matching filenames: $c"
#echo "nonmatching: $m"





# Use titles that don't match to identify the files in the ome that need to be updated on the search tool
