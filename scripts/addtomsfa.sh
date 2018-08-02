#!/bin/bash

#ABOUT:
# To add a record from the msfa approved OME folder,
# give this script the filename. The file has to be 
# copied from its OME folder to the mercury3-rh harvested
# folder, and then the search is indexed.
#:ABOUT

if [ $# < 1 ]
then 
    echo "must provide filename"
    /Users/mcu/bin/about
    exit
fi

dest1=/metadata/msfa/approved/$1
dest2=/data/Mercury_instances/msfa/harvested
scp esddrupal-prod:$dest1 $dest1
scp $dest1 mcumercury@mercury3-rh:$dest2/
sleep 10
ssh mcumercury@mercury3-rh "msfa_index_search/indexsearch.sh"

#ssh mcutomcat@esddrupal-prod "bash addtomsfa $1"
#ssh esddrupal-prod "pwd; echo $1; ./addtomsfa $1"
#sleep 10
