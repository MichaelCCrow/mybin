#!/bin/bash
if [ $# = 1 ]; then

echo "dropping $1"
read answer
if [[ $answer =~ ^[Yy]$ || $answer =~ [yes] ]]; then

    mysql -u ngeeadmin -pngee4db! -e "DROP DATABASE $1"
    mysqldump -u ngeeadmin -pngee4db! NGEE_Arctic_v2 > dump.sql
    mysqladmin -u ngeeadmin -pngee4db! create $1 
    mysql -u ngeeadmin -pngee4db! $1 < dump.sql

fi

else echo "must provide database name to be created"
fi
