#!/bin/bash
if [ $# = 1 ]; then
    db="$1"
    exists=false
    #echo "if ! mysql -u ngeeadmin -pngee4db! -e "use $1""
    if ! /usr/local/mysql/bin/mysql -u ngeeadmin -pngee4db! -e "use $db"
    then echo "does not exist, cannot move forward"
    else 
        echo "the database exists, moving forward"
        exists=true
        /usr/local/mysql/bin/mysql -u ngeeadmin -pngee4db! -e "
    fi
else echo "Must provide database to copy"
fi
