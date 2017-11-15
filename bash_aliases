#screen
alias aa="screen -R"
alias aals="screen -ls"
alias scrls="screen -ls"

#maven (custom script in bin)
alias one="deploy local"
alias onea="deploy local clean"
alias two="testngm openstats"
alias testit="deployq; qq"
alias deployandtest="deploy local clean --full"

sublime() { open -a Sublime\ Text $1; }
pycharm() { open -a PyCharm\ CE $1; }

#deploy-check() {
#select op in "openstats" "savedraft"; do
#read -t 5 -p "what do you want to check: " op; echo "check $op"
    #case $op in    *) break; #esac
    #break; #deploy local; #done; #}


#tomcat
alias stop-tomcat="/Users/mcu/tomcat7/bin/shutdown.sh | tail -f /Users/mcu/tomcat7/logs/catalina.out"
alias start-tomcat="/Users/mcu/tomcat7/bin/startup.sh | tail -f /Users/mcu/tomcat7/logs/catalina.out"
alias tomcat-status="ps -ef | grep tomcat"
alias kill-tomcat="pkill -9 -f tomcat"
alias see-tomcat="tail -f /Users/mcu/tomcat7/logs/catalina.out"
alias tomcat-logs="tail -f /Users/mcu/tomcat7/logs/catalina.out"

#not sure if this actually works 
#totomcat() { 
#    ngpath=/Users/mcu/Workspaces/MyEclipseMCC/ngeemetadata
#    tcpath=/Users/mcu/tomcat7/webapps/ngeemetadata
#    cd $ngpath
#    if [ -f $ngpath/$1 && -f $tcpath/$1 ]; then 
#        cp $1 $tcpath/$1; #cp src/main/webapp/$1 /Users/mcu/tomcat7/webapps/ngeemetadata/$1; else 
#    else echo "failed to move $1"; 
#    fi
#}

#Virtual Box
alias vm-connect="ssh -p 2222 mcu@localhost"
alias linux-tomcat-start="ssh mcu@localhost -p 2222 'bash /usr/share/tomcat/start'"
alias linux-tomcat-stop="ssh mcu@localhost -p 2222 'bash /usr/share/tomcat/stop'"


#lazy-ssh
export esd="esddrupal-prod"
export esdd="esddrupal-dev"
alias armp="ssh armdev-python"
alias armpp="ssh mcuarm@armdev-python"
alias armj="ssh armdev-java"
alias armjj="ssh mcuarm@armdev-java"
alias armr="ssh mcu@armdev-recep"
#alias armrr="ssh mcuarm@armdev-recep"
alias adcadmin="ssh adcadmin"
alias merc="ssh mercury"
export merc3="mercury3-rh"
alias merc3="ssh mercury3-rh"
alias merc3m="ssh mcumercury@mercury3-rh"
export mnspruce="mnspruce-prod"
alias mnspruce="ssh mnspruce-prod"

alias ui1b="ssh ui1b"
alias s1b="ssh s1b"
alias s2b="ssh s2b"
alias s3b="ssh s3b"
alias s4b="ssh s4b"

#git
alias gitwebrootdiff="git diff --name-only HEAD^ WebRoot/"

#lazy-nav
export mybin="/Users/mcu/bin"
alias mybin="cd $mybin"

export dev="/Users/mcu/Development"
alias dev="cd $dev"
export devp="/Users/mcu/Development/projects"
alias devp="cd $devp"

export myscripts="/Users/mcu/Development/scripts"
alias myscripts="cd $myscripts"

#export ngm="/Users/mcu/Workspaces/MyEclipseMCC/ngeemetadata"
export ngm="/Users/mcu/Development/projects/ngeemetadata"
alias ngm="cd $ngm"

export tngm="/Users/mcu/tomcat7/webapps/ngeemetadata"
alias tngm="cd $tngm"

export tc="/Users/mcu/tomcat7"
alias tc="cd $tc"

export workspace="/Users/mcu/Workspaces/MyEclipseMCC"
export ws=$workspace
alias ws="cd $workspace"

export md="/metadata/ngee"


export jenkhome="/Users/mcu/Documents/Kitematic/jenkins/var/jenkins_home"

url() { open -a Google\ Chrome $1; }
localurl() { open -a Google\ Chrome http://localhost:8080/$1; }

#alias updatepages="cd $ngm/src/main/webapp/WEB-INF/ && rsync -tv pages/* $tngm/WEB-INF/pages/; ngm"
alias updatepages="rsync -tv src/main/webapp/WEB-INF/pages/* $tngm/WEB-INF/pages/"
#alias updatejs="cd $ngm/src/main/webapp/ && rsync -tv js/* $tngm/js/; ngm"
alias updatejs="rsync -tv src/main/webapp/js/* $tngm/js/"
#alias updatecss="cd $ngm/src/main/webapp/ && rsync -tv css/* $tngm/css/; ngm"
alias updatecss="rsync -tv src/main/webapp/css/* $tngm/css/; ngm"

#ssh
newsshkey() {  cat ~/.ssh/id_rsa.pub | ssh $1 "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys && chmod 700 ~/.ssh/authorized_keys"; }
newsshkey2() { cat ~/.ssh/id_rsa.pub | ssh $1 "cat >> ~/.ssh/authorized_keys"; }
