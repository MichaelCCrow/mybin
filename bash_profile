export CLICOLOR=1
#export LSCOLORS=GxFxCxDxbxegedabagacad
TERM=xterm-256color

HISTSIZE=100000
HISTFILESIZE=200000

export origIFS=$IFS

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

#mysql
alias mysql=/usr/local/mysql/bin/mysql

#bash_profile
alias bashpr="vi ~/.bash_profile"
alias rbash=". ~/.bash_profile"

title() {
    echo -e '\033k'$1'\033\\'
}

#screen
alias aa="screen -R"

#python
alias py="/usr/bin/python2.7"
alias py3="/usr/local/bin/python3.5"

#maven (custom script in bin)
alias deployandtest="deploy local clean --full"

#tomcat
alias stop-tomcat="/Users/mcu/tomcat7/bin/shutdown.sh | tail -f /Users/mcu/tomcat7/logs/catalina.out"
alias start-tomcat="/Users/mcu/tomcat7/bin/startup.sh | tail -f /Users/mcu/tomcat7/logs/catalina.out"
alias tomcat-status="ps -ef | grep tomcat"
alias kill-tomcat="pkill -9 -f tomcat"
alias see-tomcat="tail -f /Users/mcu/tomcat7/logs/catalina.out"
alias tomcat-logs="tail -f /Users/mcu/tomcat7/logs/catalina.out"

alias linux-tomcat-start="ssh mcu@localhost -p 2222 'bash /usr/share/tomcat/start'"
alias linux-tomcat-stop="ssh mcu@localhost -p 2222 'bash /usr/share/tomcat/stop'"

#ssh
newsshkey() {
    cat ~/.ssh/id_rsa.pub | ssh $1 "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys && chmod 700 ~/.ssh/authorized_keys"
}
newsshkey2() {
    cat ~/.ssh/id_rsa.pub | ssh $1 "cat >> ~/.ssh/authorized_keys"
}
#lazy-ssh
alias armp="ssh armdev-python"
alias armpp="ssh mcuarm@armdev-python"
alias armj="ssh armdev-java"
alias armjj="ssh mcuarm@armdev-java"
alias armr="ssh mcuarm@armdev-recep"
alias adcadmin="ssh adcadmin"
alias merc="ssh mercury"
export merc3="mercury3-rh"
alias merc3="ssh mercury3-rh"

#git
alias gitwebrootdiff="git diff --name-only HEAD^ WebRoot/"

#lazy-nav
export mybin="/Users/mcu/bin"
alias mybin="ls $mybin"

export dev="/Users/mcu/Development"
alias dev="cd $dev"

export myscripts="/Users/mcu/Development/scripts"
alias myscripts="cd $myscripts"

export ngm="/Users/mcu/Workspaces/MyEclipseMCC/ngeemetadata"
alias ngm="cd $ngm"

export tngm="/Users/mcu/tomcat7/webapps/ngeemetadata"
alias tngm="cd $tngm"

export tc="/Users/mcu/tomcat7"
alias tc="cd $tc"

export workspace="/Users/mcu/Workspaces/MyEclipseMCC"
export ws=$workspace
alias ws="cd $workspace"

export jenkhome="/Users/mcu/Documents/Kitematic/jenkins/var/jenkins_home"

url() { open -a Google\ Chrome $1; }
localurl() { open -a Google\ Chrome http://localhost:8080/$1; }




# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
pypath="/Library/Frameworks/Python.framework/Versions/3.5/bin"
mypath="/Users/mcu/bin"
brewpath="/usr/local/sbin"
export PATH="$PATH:$pypath:$mypath:$brewpath"









### template from https://code.tutsplus.com/tutorials/how-to-customize-the-command-prompt--net-20586 ###
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset


print_before_the_prompt () {
    #recentfiles=$(stat -f "%m%t%Sm %N" * | sort -rn | head -3 | cut -f2-)
    
    #default
    #printf "\n $txtred%s: $bldgrn%s $txtpur%s\n$txtrst" "$USER" "$PWD" "$(vcprompt)"
    
    #mcc-custom
    #for homebrew theme
    #printf "$txtrst$bldwht%s $txtpur%s\n$txtrst" "\$\$: $PWD" "$(vcprompt)"
    #for monokai theme
    #maxlen=50
    len=$(($(pwd | wc -m) + 6 ))
    #pdubbs=$PWD
    #curdir=$(echo $pdubbs | sed s/'\/Users\/mcu'/'~'/)
    #curdir=$(filter_dir $curdir)
        #cutlen=$(( $len - $maxlen ))
        #curdir=$(pwd | cut -c $cutlen-)
        #curdir=$(echo ".../$(echo $curdir | cut -d / -f 2-)")
        #len=$(( $maxlen + 5 )); 
    #if [[ $len > $maxlen ]]; then #printf "$txtgrn%s [$txtrst$txtwht%s] $txtpur%s\n$txtrst" "\$\$:" "$curdir/" "$(vcprompt)" #else #fi

    for i in $(seq 1 $len); do echo -n "_"; done; echo
    printf "$txtgrn%s $txtrst[$txtwht%s$txtrst] $txtpur%s\n$txtrst" "\$\$:" "$PWD/" "$(vcprompt)"

    #printf "$txtblk$bakwht%s: $txtrst$bldwht%s $txtpur%s\n$txtrst" "$USER" "$PWD" "$(vcprompt)"
}

dirchange () {
    if [ "$PWD" != "$OLDPWD" ]; then
        OLDPWD="$PWD"
        echo -e "\t\t\t $PWD"
        echo "----------------------------------------------------------------------------------"
        ls
        echo "----------------------------------------------------------------------------------"
    fi
    print_before_the_prompt
}
     
PROMPT_COMMAND=dirchange
#PS1='\]->\]\]\]\]'
PS1='-> '
#PS1='$: '

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
