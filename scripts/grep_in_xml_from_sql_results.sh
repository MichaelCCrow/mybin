sql -Ne "select xml from raw_fgdc" | while read -r xml; do echo -en "$xml"; done | grep 'record_id\|pubdate'
