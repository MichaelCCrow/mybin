#!/bin/bash
#last updated Oct 2017
#last updated Jan 2018 - to make dated error files

localfolder="/metadata/ngee/prod/"
prodsrc="esddrupal-prod:/metadata/ngee/"
devdest="mcutomcat@esddrupal-dev:/metadata/ngee/prod/"
logdir="/metadata/ngee/logs"
logfile="$logdir/metadatasync.log"
errorfile="$logdir/error.`date '+%y%m%d_%H%M'`.log"

#from prod to local
rsync -avz $prodsrc $localfolder >> $logfile 2> $errorfile

#from local to dev
rsync -avz $localfolder $devdest >> $logfile 2> $errorfile

#rsync -avz mcu@esddrupal-prod:/metadata/ngee/ /metadata/ngee/prod/ >> /metadata/ngee/logs/metadatasync.log 2> /metadata/ngee/logs/error.log

#rsync -avz mcutomcat@esddrupal-dev:/metadata/ngee/prod/ >> /metadata/ngee/logs/metadatasync.log 2> /metadata/ngee/logs/error.log
