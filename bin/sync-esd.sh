#!/bin/bash

localfolder="/metadata/ngee/prod/"
prodsrc="esddrupal-prod:/metadata/ngee/"
devdest="mcutomcat@esddrupal-dev:/metadata/ngee/prod/"
logdir="/metadata/ngee/logs"
logfile="$logdir/metadatasync.log"
errorfile="$logdir/error.log"

#from prod to local
rsync -avz $prodsrc $localfolder >> $logfile 2> $errorfile

#from local to dev
rsync -avz $localfolder $devdest >> $logfile 2> $errorfile

#rsync -avz mcu@esddrupal-prod:/metadata/ngee/ /metadata/ngee/prod/ >> /metadata/ngee/logs/metadatasync.log 2> /metadata/ngee/logs/error.log

#rsync -avz mcutomcat@esddrupal-dev:/metadata/ngee/prod/ >> /metadata/ngee/logs/metadatasync.log 2> /metadata/ngee/logs/error.log
