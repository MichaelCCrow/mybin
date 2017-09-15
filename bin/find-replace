#!/bin/sh

#how to run:
#bash ./find-replace.sh DIR FROM TO

if [ $# -ne 3 ]
then
  echo usage: $0 dir from to
  exit 1
fi

find $1 -type f -exec sed -i "" "s/$2/$3/g" {} \;
