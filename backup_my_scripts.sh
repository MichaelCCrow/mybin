#!/bin/bash
#ABOUT:
# backup script to copy all of the directories I have created scripts in - including my custom bin
#:ABOUT

confirmgit=true
if [[ $# = 1 ]]
then if [[ "$1" = "nogit" ]];
then confirmgit=false; echo "skipping git backup"
#else echo "nogit is the only option - quitting"; exit
fi; fi

home="/Users/mcu"
mybin="/Users/mcu/Development/mybin"
today=$(date +%Y-%m-%d@%H:%M)

cd $mybin

dobak() {
    rsync -ahn --out-format="[%t]:%o:%f:Last Modified %M" $1 $mybin/$2 >> updates.log
	rsync -ai $1 $mybin/$2 >> differences.txt
}

dobak $home/bin
dobak $home/Development/scripts
dobak $home/.bash_profile "bash_profile"
dobak $home/.bash_aliases "bash_aliases"
dobak $home/.vimrc "vimrc"
if [[ $# > 0 ]]; then for i in ${@}; do if [[ $i != "nogit" ]]; then dobak $i; fi done; fi

dogit() {
    git status
	git add .
	git commit -am "$today commit of my custom scripts"
	git push -u origin master
	#git push -u mcc master
}

if [ -n "$(cat differences.txt)" ]; then
    rm differences.txt
    if [ $confirmgit ]; then dogit; fi
else 
    rm differences.txt
fi

