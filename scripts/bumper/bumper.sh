#!/bin/bash

#ABOUT:
# Custom version bumping script. 
# Bumps maven project version.
# Adds modified git files to CHANGELOG.txt.
# Uses python package 'bumpversion'.
# Requires a '.bumpversion.cfg' file in the project root directory containing:
# [bumpversion]
# current_version = <current.project.version>
# 
# Accepts one arg: [major|minor|patch]
#:ABOUT

if [[ $# != 1 || ! -f .bumpversion.cfg ]]
then 
    echo
    echo "##########################################################"
    echo "usage: $0 [major|minor|patch]"
    echo "##########################################################"
    echo
    about $0
    #echo "(Uses python package 'bumpversion')"
    #bumpversion
    echo
    exit
fi

curver=$(mvn -q -Dexec.executable=echo -Dexec.args='${project.version}' --non-recursive exec:exec)
newver=$(grep current_version .bumpversion.cfg | cut -d '=' -f2 | tr -d ' ')

echo "current maven version: $curver"
echo "current bumpversion version: $newver"

bumpversion --allow-dirty $1

newver=$(grep current_version .bumpversion.cfg | cut -d '=' -f2 | tr -d ' ')

echo "new bumped version: $newver"

mvn versions:set -DnewVersion="$newver-SNAPSHOT"

curver=$(mvn -q -Dexec.executable=echo -Dexec.args='${project.version}' --non-recursive exec:exec)
echo "new version in maven: $curver"
echo "new version in bumpversion.cfg: $newver"

echo >> CHANGELOG.txt
echo "-------------version: $newver-------------------" >> CHANGELOG.txt
date >> CHANGELOG.txt
git status -uno -s >> CHANGELOG.txt
echo "------------------------------------------------" >> CHANGELOG.txt
