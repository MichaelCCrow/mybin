#!/bin/bash

if [ $# != 1 ]; then
    echo "must provide full path for new directory"
    exit 1
fi

if [ -d $1 ]; then
    echo "directory already exists"
    exit 1
fi

mkdir $1
cd $1

cat >> readme << EOF
This is an auto-generated git project for quickly
setting up a new git project with multiple commits
and branches to use for testing.
Summary of branch contents as of the last commit 'H':
master:  A  B  C  G
staging: A  B  C  D  E+ F
develop: A  B  C  D  E  H
EOF


git init
touch A; git add A; git commit -m "A"
touch B; git add B; git commit -m "B"
touch C; git add C; git commit -m "C"

git co -b develop
touch D; git add D; git commit -m "D"
touch E; git add E; git commit -m "E"

git co -b staging
echo "staging stuff" >> E
touch F; git add E F; git commit -m "F"

git co master
touch G; git add G; git commit -m "G"

git co develop
touch H; git add H; git commit -m "H"

echo
git lgd
echo
echo "/*------------------------------------------------*/"
cat readme
echo "/*------------------------------------------------*/"
echo
