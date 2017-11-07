#!/bin/bash
## script to make new directory and upload files to mnspruce ##

# Instructions:
#
##  NOTE: requires the companion python file splitStr.py
#
#   Call this script and pass it two arguments:
#     1) The full ftp link with the name of the 
#        new filepath and folder from Les
#     2) All files needing to be uploaded
##  !!IMPORTANT!: The first argument must NOT end with a slash!
#
#   Example:
#   -> bash uploadSpruceFiles.sh arg1 arg2
#   -> bash uploadSpruceFiles.sh 
#        ftp://mnspruce/SOME_NEW_FOLDER 
#        file1.csv file2.csv file3.csv
#
#   -> bash uploadSpruceFiles.sh ftp://mnspruce.ornl.gov/ SPRUCE_Pretreatment_Plant_Analyses_2009-2013 /Users/mcu/Archive/Spruce_tmp/April3/SPRUCE_example1.csv /Users/mcu/Archive/Spruce_tmp/April3/SPRUCE_example2.csv



uploadFiles() {
    newDirName=`python splitStr.py $1`
    newDirPath="/var/ftp/$newDirName/"
    
    echo "new dir name: $newDirName"
    echo "new dir path: $newDirPath"

    ssh mnspruce "if [ ! -d $newDirPath ]; then mkdir -v $newDirPath; fi"
    scp ${@:2} mcu@mnspruce:$newDirPath
}
uf=false

if [[ $# < 1 ]]; then
    echo -e "# Instructions:
    #
    ##  NOTE: requires the companion python file splitStr.py
    #
    #   Call this script and pass it two arguments:
    #     1) The full ftp link with the name of the 
    #        new filepath and folder from Les
    #     2) All files needing to be uploaded
    ##  !!IMPORTANT!: The first argument must NOT end with a slash!
    #
    #   Example:
    #   -> bash uploadSpruceFiles.sh arg1 arg2
    #   -> bash uploadSpruceFiles.sh 
    #        ftp://mnspruce/SOME_NEW_FOLDER 
    #        file1.csv file2.csv file3.csv
    #
    #   -> bash uploadSpruceFiles.sh ftp://mnspruce.ornl.gov/SPRUCE_Pretreatment_Plant_Analyses_2009-2013 /Users/mcu/Archive/Spruce_tmp/April3/SPRUCE_example1.csv /Users/mcu/Archive/Spruce_tmp/April3/SPRUCE_example2.csv"
else uploadFiles $1 ${@:2}
fi

#newDirName=`python splitStr.py $1`
#newDirPath="/var/ftp/$newDirName/"

#echo "new dir name: $newDirName"
#echo "new dir path: $newDirPath"

#ssh mnspruce "if [ ! -d $newDirPath ]; then; mkdir -v $newDirPath; fi"
#scp ${@:2} mcu@mnspruce:$newDirPath

#echo "ssh mnspruce mkdir $newDirPath"
#echo "scp ${@:2}  ---> mcu@mnspruce:$newDirPath"
