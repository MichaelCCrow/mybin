#!/bin/bash

#/usr/local/mysql/bin/mysql -u ngeeadmin -p 
#/usr/local/mysql/bin/mysqldump -u ngeeadmin -p
#mysqldump -u ngeeadmin -pngee4db! msfa | mysql -P 3307 -h 127.0.0.1 -u ngeeadmin -pngee4db! msfa

#After copying the database tables and contents to new database
omedb=msfa
for i in `sql -Ns -e "select username from $omedb.users" 2> /dev/null`; do mkdir /metadata/$i; done
