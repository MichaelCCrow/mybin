#!/bin/bash

#echo "checking db"
#prod #/usr/bin/mysql
/usr/local/mysql/bin/mysql -u ngeeadmin -pngee4db! NGEE_Arctic -sN -e "SELECT dsid FROM files WHERE dsid < 100 ORDER BY dsid DESC LIMIT 1" 2> /dev/null
