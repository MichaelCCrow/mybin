#!/bin/bash

#ABOUT:
# This script dumps the table `files` from the given database (dev or prod) 
# and copies it to the local database table.
#:ABOUT

if [ $# != 1 ]; then about $0; exit; fi

if [ $1 = 'dev' ]; then db='esddrupal-dev'
elif [ $1 = 'prod' ]; then db='esddrupal-prod'
else echo "options are 'dev' or 'prod'"; exit
fi
dbconn="-u ngeeadmin -pngee4db! NGEE_Arctic"
dbdump="/Users/mcu/Development/dev-testing/dbdump.sql"

echo "...syncing with $1 db..."

ssh $db "mysqldump -v $dbconn files" > $dbdump
mysql $dbconn < $dbdump 2> /dev/null
