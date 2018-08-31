#!/bin/bash

if [ $# = 1 ]
then
    blankjava="BlankJava"
    cp -v ~/Development/scripts/BlankJava.java $1
    filename=$(basename $1)
    projectname="${filename%.*}"
    echo $projectname
    sed -i "" "s/BlankJava/$projectname/g" $1
else echo "provide the full path ending with the name of the new java project"
fi
