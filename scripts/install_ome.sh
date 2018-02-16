#!/bin/bash

#After copying the database tables and contents to new database
omedb=msfa
for i in `sql -Ns -e "select username from $omedb.users" 2> /dev/null`; do mkdir /metadata/$i; done
