#!/bin/bash

filename=$(basename $1 | sed -e "s/[.]NGA\(.*\)xml//")
#echo "f : $filename"
title=$(grep title $1 | sed -e "s/<title>\(.*\)<\/title>/\1/" | sed -e 's/^[[:space:]]*//' | sed -e 's/[[:space:]]*$//')
t2=$(java Replacer "$title")
#echo "t1 - $title"
#echo "t2 - $t2"
#title=$(grep title $1 | sed -e "s/<title>\(.*\)<\/title>/\1/" | sed -e "s/[,.:-]//g" | sed -e 's/^[[:space:]]*//' | sed -e "s/ /_/g")
#echo "t : $title"

#title="$(echo $title)"
#filename="$(echo $filename)"

#if [[ $title == *"$filename"* ]]; then
if [[ $t2 == *"$filename"* ]]; then
    echo -e "match: f### $filename t### $t2"
else 
    echo -e "\nNO MATCH\nf### $filename\nt### $t2"
fi
