#show keyboard map
alias km="open /Users/mcu/Desktop/hhkbp2_basic_layout1500.png"
alias kmm="open 'http://elitekeyboards.com/products.php?sub=pfu_keyboards,hhkbpro2&pid=pdkb400bn'"

vibin() { vi /Users/mcu/bin/$1; }
vibinx() { vibin $1; chmod +x /Users/mcu/bin/$1; }
catbin() { cat /Users/mcu/bin/$1; }
lessbin() { less /Users/mcu/bin/$1; }

#sql
alias sql="mysql -u ngeeadmin -pngee4db! NGEE_Arctic_v2"
alias dumpdb="mysqldump -u ngeeadmin -pngee4db! NGEE_Arctic_v2 > dump.sql"
alias mysqlprocesses="/usr/local/mysql/bin/mysqladmin -u ngeeadmin -pngee4db! -i 1 processlist"
alias mysqlerrorlogs="sudo tail -f -n 100000 /usr/local/mysql/data/mysqld.local.err"

#postgres setup
#export pglogfile="/usr/local/psql/logs/pg.log"
#export PGDATA="/usr/local/psql/data"

#psql
#alias pg="pg_ctl"
#export pglogfile="/usr/local/psql/logs/pg.log"
#alias pg:start="pg_ctl -D $PGDATA -l $pglogfile start"
alias psql="/usr/local/bin/psql -p 6543"
alias pg:start="pg_ctl -D /usr/local/psql/data -l /usr/local/psql/logs/pg.log start"
alias pg:stop="pg_ctl -D $PGDATA -l $pglogfile stop"
alias pg:restart="pg_ctl -D $PGDATA -l $pglogfile restart"
    #connections
    pguser="websvc_user"
    uudr="data_reception_user"
    uuw="websvc_user"
    alias pg:users="echo uudr=$uudr uuw=$uuw"
    #pg:user() { pguser=$1; }
    alias pg:local="psql -U postgres arm_all"
    #alias pg:dev="psql -h armdev-pgdb -U $pguser arm_all"
    #alias pg:prod="psql -h armdb arm_all"
alias pg:arm="psql -h armdbprod"
alias pg:arm:websvc_user="psql -h armdbprod -U websvc_user arm_all"
alias pg:armdev="psql -h armdbdev"
alias pg:armdev:websvc_user="psql -h armdbdev -U websvc_user -p 6543 arm_all"

#git
alias cgit="vi ~/.gitconfig"
alias gitc="vi ~/.gitconfig"

#screen
alias sc="screen"
alias aa="screen -R main"
alias aar="screen -R"
alias aals="screen -ls"
alias scrls="screen -ls"
alias screenrc="vi ~/.screenrc"
alias logscreen="screen -c ~/.screenrc_logs -R logs"
alias aalogs="screen -c ~/.screenrc_logs -R logs"

#maven (custom script in bin)
alias deployandtest="deploy local clean --full"

alias deployall:dev="echo 'deploying api dev'; echo; deploy dev clean install; cd app; echo 'deploying gui to dev'; echo; npm run build:deploy:dev; cd .."

alias localdep="rm -rv /Users/mcu/tomcat7/webapps/ome-dev/* && cp -rv /Users/mcu/Development/projects/ome/app/dist/ /Users/mcu/tomcat7/webapps/ome-dev/"
alias devdep="ssh mcutomcat@esddrupal-dev 'rm -rv webapps/ome-dev/*' && scp -rv /Users/mcu/Development/projects/ome/app/dist/* mcutomcat@esddrupal-dev:webapps/ome-dev/"

#alias sb:run="mvn clean install spring-boot:run -Drun.profiles=local"
alias sb:run="custom-spring-boot"
custom-spring-boot() {
    mvn ${@:1} spring-boot:run -Drun.profiles=localjar
}

mvn-version() {
    mvn versions:set -DnewVersion="$1-SNAPSHOT"
}
function get-mvn-version() {
   # echo "mvn version"
    mvn -q -Dexec.executable=echo -Dexec.args='${project.version}' --non-recursive exec:exec
}

deployt() {
  dest="armweb-dev"
  if [ $# > 0 ]; then
    if [[ $1 = "dev" ]]; then
        dest="armweb-dev"
        echo "ssh -M -S arm-ctrl-socket -fnNT -L 8080:localhost:8080 mcu@armweb-dev"
    elif [[ $1 = "stage" ]]; then
        dest="armweb-stage"
        echo "ssh -M -S arm-ctrl-socket -fnNT -L 8080:localhost:8080 mcu@armweb-stage"
    elif [[ $1 = "prod" ]]; then
        echo "run you must tunnel to deploy to prod"
        echo "ssh -M -S arm-ctrl-socket -fnNT -L 8080:localhost:8080 mcu@ui1b"
        echo "then"
        echo "ssh -S arm-ctrl-socket -O exit mcu@ui1b"
    else "must give a profile"; return
    fi
    ssh -M -S arm-ctrl-socket -fnNT -L 8080:localhost:8080 mcu@$dest && \
    mvn -P $1 ${@:2} tomcat7:redeploy && \
    ssh -S arm-ctrl-socket -O exit mcu@$dest

    echo "verifying connection was closed:"
    ssh -S arm-ctrl-socket -O check mcu@$dest
  else echo "profile required"
  fi
}

export armTunnelName="arm-ctrl-socket"
defaultTunnelName="$armTunnelName"
createtunnel() {
    ssh -M -S "${1:-$defaultTunnelName}" -fnNT -L 8080:localhost:8080 "mcu@${2:-armweb-dev}"
}

closetunnel() {
    if [ $# != 2 ]; then
        echo "Usage: closetunnel [name] [server]"
        echo "default: ssh -S "${1:-$defaultTunnelName}" -O exit "mcu@${2:-armweb-dev}""
    fi
    ssh -S "${1:-$defaultTunnelName}" -O exit "mcu@${2:-armweb-dev}"
}



export sepline="\n-------------------------------------------------\n"

alias sublime="open -a Sublime\ Text"
alias pycharm="open -a PyCharm"
alias eclipse="open -a MyEclipse\ 2017\ CI"
alias intellij="open -a Intellij\ IDEA"
alias chrome="open -a Google\ Chrome"
alias vscode="open -a Visual\ Studio\ Code"

#sublime() { open -a Sublime\ Text $1; }
#pycharm() { open -a PyCharm $1; }
#eclipse() { open -a MyEclipse\ 2017\ CI $1; }
#intellij() { open -a Intellij\ IDEA $1; }

#tomcat
alias stop-tomcat="/Users/mcu/tomcat7/bin/shutdown.sh | tail -f /Users/mcu/tomcat7/logs/catalina.out"
alias start-tomcat="/Users/mcu/tomcat7/bin/startup.sh | tail -f /Users/mcu/tomcat7/logs/catalina.out"
alias tomcat-status="ps -ef | grep tomcat"
alias kill-tomcat="pkill -9 -f tomcat"
alias see-tomcat="tail -f /Users/mcu/tomcat7/logs/catalina.out"
alias tomcat-logs="tail -f /Users/mcu/tomcat7/logs/catalina.out"

#check if port is in use
checkport() { lsof -i :$1 -S; }
#alias checkport="lsof -Si "
#checkport() { if lsof -i :$1 -S; then echo "port $1 is active"; else echo "inactive port $1"; fi; }


#Virtual Box
alias vb="VBoxManage"
alias vb:start="vb startvm Fedora --type headless"
alias vb:stop="vb controlvm Fedora poweroff"
alias vb:list="vb list runningvms"
alias vb:conn="ssh crowhost"
alias vb:login="ssh crowhost"
alias vb:connect="ssh crowhost"

alias vm-connect="ssh -p 2222 mcu@localhost"
#alias linux-tomcat-start="ssh mcu@localhost -p 2222 'bash /usr/share/tomcat/start'"
#alias linux-tomcat-stop="ssh mcu@localhost -p 2222 'bash /usr/share/tomcat/stop'"

#lazy-ssh
export esd="esddrupal-prod"
export esdd="esddrupal-dev"
alias esdt="ssh mcutomcat@esddrupal-prod"
alias esddt="ssh mcutomcat@esddrupal-dev"

alias armp="ssh armdev-python"
alias armpp="ssh mcuarm@armdev-python"
alias armpa="ssh mcuarm@armdev-python"

alias armw="ssh armweb-dev"
alias armweb="ssh armweb-dev"
alias armwebd="ssh armweb-dev"
alias armwebs="ssh armweb-stage"
alias armj="ssh armdev-java"
alias armjj="ssh mcutomcat@armdev-java"
alias armjt="ssh mcutomcat@armdev-java"

alias armr="ssh mcu@armdev-recep"
#alias armrr="ssh mcuarm@armdev-recep"

alias adcadmin="ssh adcadmin"
alias adcadmina="ssh mcuarm@adcadmin"
alias adc="ssh adcadmin"
alias adca="ssh mcuarm@adcadmin"

alias ngeesolr="ssh ngeesolr"
alias ngeesolrm="ssh mcumercury@ngeesolr"
alias esdsolr="ssh esdsolr"
alias esdsolrs="ssh mcusolr@esdsolr"
alias esdsolrd="ssh esdsolr-dev"
alias esdsolrdev="ssh esdsolr-dev"
alias esdsolrdevs="ssh mcusolr@esdsolr-dev"

alias merc="ssh mercury"
export merc3="mercury3-rh"
export m3="mercury3-rh"
alias merc3="ssh mercury3-rh"
alias m3="ssh mercury3-rh"
alias merc3m="ssh mcumercury@mercury3-rh"
alias m3m="ssh mcumercury@mercury3-rh"

export mnspruce="mnspruce-prod"
alias mnspruce="ssh mnspruce-prod"

export ui1b="ui1b"
alias ui1b="ssh ui1b"
alias ui1bt="ssh mcutomcat@ui1b"
alias ret1b="ssh ret1b"
alias ret2b="ssh ret2b"
alias s1b="ssh s1b"
alias s2b="ssh s2b"
alias s3b="ssh s3b"
alias s4b="ssh s4b"


#lazy-nav ##############################################
alias tree="tree -C"
alias ll="ls -ltr"
alias lla="ls -ltra"
alias ltr="ls -ltr"
alias ls:webapps="ls -ltr /Users/mcu/tomcat7/webapps"
alias seebin='ls /Users/mcu/bin; echo -e "$sepline" run listbin for -ltr'
alias lsbin='ls /Users/mcu/bin; echo -e "$sepline" run listbin for -ltr'
alias binls='ls /Users/mcu/bin; echo -e "$sepline" run listbin for -ltr'
alias listbin="ls -ltr /Users/mcu/bin"
export mybin="/Users/mcu/bin"
alias mybin="cd $mybin"
export tcls="/Users/mcu/tomcat7/webapps"
alias tcls="ls -ltr /Users/mcu/tomcat7/webapps"
alias tmp="ls -altr /tmp/ | tail"
bin() {
    if [ -f $mybin/$1 ]; then vi $mybin/$1; fi
}

  #tomcat
  export tngm="/Users/mcu/tomcat7/webapps/ngeemetadata"
  alias tngm="cd $tngm"
  export tc="/Users/mcu/tomcat7"
  alias tc="cd $tc"
  export t8="/usr/local/opt/tomcat@8/libexec/"
  alias t8log="tail -f $t8/logs/*"

export md="/metadata/ngee"

export dev="/usr/local/dev"
alias dev="cd $dev"
export devp="/usr/local/dev/projects"
alias devp="cd $devp"
export proj="/Users/mcu/Development/projects" #home dev
alias proj="cd $proj"
export devpp="/Users/mcu/Development/projects" #home dev
alias devpp="cd $devpp"
export hdev="/Users/mcu/Development/projects" #home dev
alias hdev="cd $hdev"
export devh="/Users/mcu/Development/projects" #home dev
alias devh="cd $devpp"

export resources="/Users/mcu/Development/resources"
export res="/Users/mcu/Development/resources"

export myscripts="/usr/local/dev/scripts"
alias myscripts="cd $myscripts"

#export ngm="/Users/mcu/Workspaces/MyEclipseMCC/ngeemetadata"
export ngm="$devp/ngeemetadata"
alias ngm="cd $ngm"

export workspace="/Users/mcu/Workspaces/MyEclipseMCC"
export ws=$workspace
alias ws="cd $workspace"

export armlive="$devp/armlive"
alias armlive="cd $armlive"

export pfd="$devp/partialfile_deleter"
alias pfd="cd $pfd"

export omedir="/Users/mcu/Development/projects/ome"
alias omedir="cd $omedir"

########################################################

export jenkhome="/Users/mcu/Documents/Kitematic/jenkins/var/jenkins_home"

#Regex
#select parameter portion of function (used when replacing with arrow functions in javascript)
#https://regex101.com/r/uQtSMi/1

#utility
alias find-newest="find . -type f -printf "%A@,%t,%p\n" | sort -nr -t, -k1"
alias show-largest="du -h | grep -E '^\d.*M'"
biggestfiles() {
    du -h ${1:-.} | grep -E "M\s"
}
alias grepp="grep --exclude='.*' --exclude='xml.' --exclude='.old'"

# Open Chrome in insecure mode for testing
alias openChromeInsecure="open -n -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --user-data-dir='/tmp/chrome_dev_test' --disable-web-security"

#serverstuff
alias startnpm="screen -c test -S npm -dm npm run dev; sleep 2; if eval checkport 8889; then echo webpack/vue/npm server started on 8889; else echo failed to start server on port 8889; fi"
alias stopnpm="screen -S npm -X -p 0 stuff $'\003'; if eval checkport 8889; then echo server still running on port 8889; else echo stopped server on port 8889; fi"

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
newsshkey() {  cat ~/.ssh/id_rsa.pub | ssh $1 "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys && chmod 700 ~/.ssh/authorized_keys && chmod 700 ~/.ssh"; }
newsshkey2() { cat ~/.ssh/id_rsa.pub | ssh $1 "cat >> ~/.ssh/authorized_keys"; }


solrdir="/Users/mcu/Development/solr/"
alias solr="/Users/mcu/Development/solr/bin/solr"


#tutorials
alias tut-pystring="open -a 'Google Chrome' https://www.tutorialspoint.com/python/python_strings.htm"

#ome
omesubmit() { python ~/Development/projects/ngeemetadata/src/test/python/submit.py $1 $2; } # $1)record_id $2)status<draft|submitted|accepted|approved>


#NPM Utility
alias dryprune="npm prune --dry-run --production=true --json | jq '.removed[].name'"

#Curls
alias dod:primary="curl https://pcm.arm.gov/pcmserver/dods/30ecor.b1/versions/2.2 | jq --color-output '.vars[] | select(.props|length > 0) | .atts[] | .value' | less -R"
export headerngee="X-TenantID: ngee"
export hngee="X-TenantID: ngee"
alias curlh="curl --header 'X-TenantID: ngee'"

# Synergy
alias synergys="/Applications/QuickSynergy.app/Contents/Resources/synergys"
alias quicksynergy="/Applications/QuickSynergy.app/Contents/MacOS/QuickSynergy"

#alias makexsl="xsltproc -o result.html src/main/resources/HTMLStylesheet.xsl /metadata/ngee/prod/approved/Vegetation_Warming_Experiment_Thaw_Depth_Barrow_Alaska_2017.NGA151.xml; if [ -f result.html ]; then echo 'good to go'; else echo 'no bueno'; fi; open result.html"
#alias updatexsl="cp -v src/main/resources/HTMLStylesheet.xsl /var/lib/tomcat/webapps/ngeemetadata/HTMLStylesheet.xsl"

alias makexsl="xsltproc -o result.html src/main/resources/HTMLStylesheet.xsl /metadata/ngee/submitted/Test_Landing_Page_With_Full_Data_Answers.NGA536.xml; if [ -f result.html ]; then echo 'good to go'; else echo 'no bueno'; fi; open result.html"
alias updatexsl="cp -v src/main/resources/HTMLStylesheet.xsl /var/lib/tomcat/webapps/ngeemetadata/HTMLStylesheet.xsl"
alias msfaxsl="xsltproc -o result.html src/main/resources/MSFA_HTMLStylesheet.xsl /metadata/msfa/approved/*.SFA516.xml; if [ -f result.html ]; then echo 'good to go'; else echo 'no bueno'; fi; open result.html"
