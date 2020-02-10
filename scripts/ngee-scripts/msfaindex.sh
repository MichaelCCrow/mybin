#!/bin/bash

cp -v /metadata/msfa/approved/* /data/Mercury_instances/msfa/harvested/
/data/Mercury_instances/msfa/update-new.sh msfa 
echo "done"
