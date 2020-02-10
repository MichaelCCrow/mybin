#!/bin/bash

f="/home/mcu/reports/ngeereport_`date "+%Y-%m-%d"`.txt"

mysql -u ngeeadmin -pngee4db! NGEE_Arctic -sN < queries/quarterly_report.sql > $f

sendemail() {
  msg="NGEE Report"
  while read i; do msg="$msg\n$i"; done < $f

  sub="NGEE Report `date "+%Y-%m-%d"`"
  from="support@ngee-arctic.ornl.gov"
  to="support@ngee-arctic.ornl.gov"
  #to="crowmc@ornl.gov"

  echo -e $msg | mail -s "$sub" -r $from $to
}
sendemail  
