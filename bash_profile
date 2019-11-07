export CLICOLOR=1
#export LSCOLORS=GxFxCxDxbxegedabagacad
TERM=xterm-256color

export origIFS=$IFS

HISTSIZE=100000
HISTFILESIZE=200000
HISTCONTROL=ignoredups
shopt -s histappend

javahome="/Library/Java/JavaVirtualMachines/"
#export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-12.0.1.jdk/Contents/Home"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_221.jdk/Contents/Home"

#get my aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_queries ]; then
    . ~/.bash_queries
fi

#########################
#### system aliases #####
#########################

alias today='export today="$(date)"; echo $today'

#mysql
alias mysql=/usr/local/mysql/bin/mysql
alias mysqldump=/usr/local/mysql/bin/mysqldump
alias sqlroot="/usr/local/mysql/bin/mysql -u root -plocalpw"

#alias mysql=/usr/local/mariadb/server/bin/mariadb
#alias mysqldump=/usr/local/mariadb/server/bin/mysqldump


#postgres setup
export pglogfile="/usr/local/psql/logs/pg.log"
export PGDATA="/usr/local/psql/data"

#bash_profile
alias rbash=". ~/.bash_profile"
alias bashpr="vi ~/.bash_profile"
alias bashal="vi ~/.bash_aliases"
alias bashq="vi ~/.bash_queries"
alias vimrc="vi ~/.vimrc"
alias grep="grep --color=auto"
# Edit this file to add files to be recognized by vim as bash source files.
#/usr/local/Cellar/macvim/8.0-142/MacVim.app/Contents/Resources/vim/runtime/filetype.vim

#change window title
title() { echo -e '\033k'$1'\033\\'; }

#python
alias py="/usr/bin/python2.7"
alias py3="python3.8"
alias ipy="ipython"
alias ipy3="ipython3"
#alias py3="/usr/local/bin/python3"
#alias py3="/Library/Frameworks/Python.framework/Versions/3.5/bin/python3"


# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"
pypath2="/Users/mcu/Library/Python/2.7/bin"
pypath3="/Library/Frameworks/Python.framework/Versions/3.5/bin"
#pypath3="/usr/local/bin/python3"
#pypath2="/usr/local/bin/python"
mypath="/Users/mcu/bin"
brewpath="/usr/local/sbin"
export PATH="$PATH:$mypath:$brewpath:$pypath2:$pypath3" # :$pypath36"
#export PYTHONPATH="$PYTHONPATH:/usr/local/lib/python2.7/bin"

MANPATH="/Users/mcu/bin/man:$MANPATH"

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

underline='\033[4m'
export undln='\033[4m'
export rstundln='\033[0m'


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
        alias cdb="cd $OLDPWD"
        OLDPWD="$PWD"
        echo -e "\t\t\t $PWD"
        echo "----------------------------------------------------------------------------------"
        ls
        echo "----------------------------------------------------------------------------------"
        if [[ "$PWD" == "/metadata/ngee" ]]; then
            echo -e "\nNOTE:: You can also use the command 'md' to get here\n"
        fi
    fi
    #print_before_the_prompt
}
     
PROMPT_COMMAND=dirchange
#PS1='$: '

#[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

source /Users/mcu/Library/Python/2.7/lib/python/site-packages/powerline/bindings/bash/powerline.sh

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

echo "bash profile reloaded"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/mcu/.sdkman"
[[ -s "/Users/mcu/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/mcu/.sdkman/bin/sdkman-init.sh"

# Setting PATH for Python 3.8
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"
export PATH
# added by Miniconda3 4.7.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
condastuff() {
__conda_setup="$(CONDA_REPORT_ERRORS=false '/opt/miniconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
}
# <<< conda init <<<
