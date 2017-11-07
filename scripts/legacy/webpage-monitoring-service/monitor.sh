#!/bin/bash

url="https://fallmeeting.agu.org/2017/housing/"

cd /Users/mcu/dev/scripts/webpage-monitoring-service/
mv new.html old.html 2> /dev/null
curl $url -L --compressed -s > new.html
diffout="$(diff new.html old.html)"
if [ "0" != "${#diffout}" ]; then
    echo "it changed"
else 
    echo "same"
fi
