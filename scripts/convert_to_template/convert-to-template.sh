#!/bin/bash
# Convert to Template
# requires companion python file 'convert_to_template.py'

if [[ $# < 2 ]]; then
    add-instructions "First arg is username folder." "Second arg is full filename with extension" "[optional] Third arg is a new destination that must be a username folder."
else

user=$1
f=$2

scp mcutomcat@esddrupal:/usr/local/tomcatb/metadata/ngee/users/$1/$2 $2

newname=$(python convert_to_template.py $2)

if [[ $# = 3 ]]; then
    scp $newname mcutomcat@esddrupal:/usr/local/tomcatb/metadata/ngee/users/$3/$newname
else
    scp $newname mcutomcat@esddrupal:/usr/local/tomcatb/metadata/ngee/users/$1/$newname
fi

rm $2 
rm $newname

fi