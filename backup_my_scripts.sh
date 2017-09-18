#!/bin/bash
#backup script to copy all of the directories I have created scripts in - including my custom bin

home="/Users/mcu"
mybin="/Users/mcu/Development/mybin"
today=$(date +%Y-%m-%d)

cd $mybin

dobak() {
	rsync -ai $1 $mybin/$2 >> differences.txt
}

dobak $home/bin
dobak $home/Development/scripts
dobak $home/.bash_profile "bash_profile"
dobak $home/.vimrc "vimrc"
if [[ $# > 0 ]]; then for i in ${@}; do dobak $i; done; fi

dogit() {
	git add .
	git commit -am "$today commit of my custom scripts"
	git push -u origin master
	#git push -u mcc master
}

if [ -n "$(cat differences.txt)" ]; then
    rm differences.txt
	dogit
else 
    rm differences.txt
fi

