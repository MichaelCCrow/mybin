#!/usr/local/mysql/bin/mysql

# Run with:
# sql -sN -e "set @colname = 'dsid'; \. q.sql"

set @query = CONCAT('select ', @colname, ' from files');
prepare stmt from @query;
execute stmt;
deallocate prepare stmt;
