#sql
alias sql="mysql -u ngeeadmin -pngee4db! NGEE_Arctic"
alias psql-armdev="psql -h armdev-pgdb arm_all data_reception_user"
alias psqll="psql -U postgres"

pglogfile="/usr/local/psql/logs/pg.log"
alias pgctl="pg_ctl"
alias pg="pg_ctl"
#alias pg-start="pg_ctl -D $PGDATA -l $pglogfile start"
alias pg-start="pg_ctl -D /usr/local/psql/data -l pg-logfile.log start"
alias pg-stop="pg_ctl -D $PGDATA -l $pglogfile stop"
alias pg-restart="pg_ctl -D $PGDATA -l $pglogfile restart"

#screen
alias sc="screen"
alias aa="screen -R"
alias aals="screen -ls"
alias scrls="screen -ls"
alias screenrc="vi ~/.screenrc"

#maven (custom script in bin)
alias one="deploy local"
alias onea="deploy local clean"
alias two="testngm openstats"
alias testit="deployq; qq"
alias deployandtest="deploy local clean --full"

mvn-version() {
    mvn versions:set -DnewVersion="$1-SNAPSHOT"
}

sublime() { open -a Sublime\ Text $1; }
pycharm() { open -a PyCharm\ CE $1; }
eclipse() { open -a MyEclipse\ 2017\ CI $1; }

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
#alias linux-tomcat-start="ssh mcu@localhost -p 2222 'bash /usr/share/tomcat/start'"
#alias linux-tomcat-stop="ssh mcu@localhost -p 2222 'bash /usr/share/tomcat/stop'"

#lazy-ssh
export esd="esddrupal-prod"
export esdd="esddrupal-dev"

alias armp="ssh armdev-python"
alias armpp="ssh mcuarm@armdev-python"
alias armpa="ssh mcuarm@armdev-python"

alias armj="ssh armdev-java"
alias armjj="ssh mcutomcat@armdev-java"
alias armjt="ssh mcutomcat@armdev-java"

alias armr="ssh mcu@armdev-recep"
#alias armrr="ssh mcuarm@armdev-recep"

alias adcadmin="ssh adcadmin"
alias adcadmina="ssh mcuarm@adcadmin"
alias adc="ssh adcadmin"
alias adca="ssh mcuarm@adcadmin"

alias merc="ssh mercury"
export merc3="mercury3-rh"
export m3="mercury3-rh"
alias merc3="ssh mercury3-rh"
alias m3="ssh mercury3-rh"
alias merc3m="ssh mcumercury@mercury3-rh"
alias m3m="ssh mcumercury@mercury3-rh"

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
alias seebin="ls /Users/mcu/bin"
alias lsbin="ls /Users/mcu/bin"
alias binls="ls /Users/mcu/bin"
export mybin="/Users/mcu/bin"
alias mybin="cd $mybin"

  #tomcat
  export tngm="/Users/mcu/tomcat7/webapps/ngeemetadata"
  alias tngm="cd $tngm"
  export tc="/Users/mcu/tomcat7"
  alias tc="cd $tc"

export md="/metadata/ngee"

export dev="/Users/mcu/Development"
alias dev="cd $dev"
export devp="/Users/mcu/Development/projects"
alias devp="cd $devp"

export myscripts="/Users/mcu/Development/scripts"
alias myscripts="cd $myscripts"

#export ngm="/Users/mcu/Workspaces/MyEclipseMCC/ngeemetadata"
export ngm="$devp/ngeemetadata"
alias ngm="cd $ngm"

export workspace="/Users/mcu/Workspaces/MyEclipseMCC"
export ws=$workspace
alias ws="cd $workspace"

export armws="$devp/armwebsvc2/armwebsvc"
export armwebsvc="$devp/armwebsvc2/armwebsvc"
alias armws="cd $armws"
alias armwebsvc="cd $armwebsvc"

export pfd="$devp/partialfile_deleter"
alias pfd="cd $pfd"


export jenkhome="/Users/mcu/Documents/Kitematic/jenkins/var/jenkins_home"

url() { open -a Google\ Chrome $1; }
localurl() { open -a Google\ Chrome http://localhost:8080/$1; }

# for use with ngeemetadata
    ##alias updatepages="cd $ngm/src/main/webapp/WEB-INF/ && rsync -tv pages/* $tngm/WEB-INF/pages/; ngm"
    alias updatepages="rsync -tv src/main/webapp/WEB-INF/pages/* $tngm/WEB-INF/pages/"
    #webapp_path="$tc/$(basename `pwd`)"
    #alias updatepages="rsync -tv src/main/webapp/WEB-INF/pages/* $tc/$(basename `pwd`)/WEB-INF/pages/"
    ##alias updatejs="cd $ngm/src/main/webapp/ && rsync -tv js/* $tngm/js/; ngm"
    alias updatejs="rsync -tv src/main/webapp/js/* $tngm/js/"
    ##alias updatecss="cd $ngm/src/main/webapp/ && rsync -tv css/* $tngm/css/; ngm"
    alias updatecss="rsync -tv src/main/webapp/css/* $tngm/css/; ngm"

#ssh keys
newsshkey() {  cat ~/.ssh/id_rsa.pub | ssh $1 "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys && chmod 700 ~/.ssh/authorized_keys"; }
newsshkey2() { cat ~/.ssh/id_rsa.pub | ssh $1 "cat >> ~/.ssh/authorized_keys"; }


#tutorials
alias tut-pystring="open -a 'Google Chrome' https://www.tutorialspoint.com/python/python_strings.htm"


#ome
omesubmit() { python ~/Development/projects/ngeemetadata/src/test/python/submit.py $1 $2; } # $1)record_id $2)status<draft|submitted|accepted|approved>
