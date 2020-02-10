flags=$(/usr/bin/mysql -u ngeeadmin -pngee4db! -D NGEE_Arctic -sN -e "SELECT COUNT(*) FROM cron_update" 2> /dev/null)
if [[ $flags < 1 ]]; then exit; fi
echo "flags found: $flags"

/usr/local/etc/data_staging_sync
/data/Mercury_instances/ngee/update-new.sh ngee
/usr/local/etc/createIndexFileNGEE

#indexer
/data/mercury3_development/ngee/update.sh

#/data/mercury3_development/GCMDOAI/update_ngee.sh

