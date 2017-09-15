#!/bin/bash

#git archive --format=tar dev src/* | gzip -9c | tar --directory=test -xvzf -; mv -fv test/src/* test/; rm -rv test/src;

bch=`git branch | grep \* | cut -d ' ' -f2` #the current branch
remuser="mcutomcat"
remserv="ngee-arctic.ornl.gov"
remdir="/usr/local/tomcat/webapps/ngeemetadata"
isdev=false
outlog="output.txt"
tmp="tmp-deploy-files.txt"
tmp2="tmp2.txt"
tmp3="tmp3.txt"

        #returns all files that are NOT staged or added to the next commit
        #git ls-files --others --exclude-standard > $tmp

#git diff-tree --no-commit-id --name-only -r $(git rev-parse HEAD) > $tmp
git diff --name-only HEAD^ Webroot/ > $tmp
dnames=$(cat $tmp | xargs -n 1 dirname | uniq)
fnames=$(cat $tmp | xargs -n 1 basename)
listofallfiles=$(cat $tmp)
#ftd=$(for i in $dnames; do echo "$i"; done)
noroot=$(for i in $listofallfiles; do echo ${i#*/}; done)

### set up deployment area ###
for d in $dnames; do
    if [ $d != '.' ]; then
        mkdir -vp ${d#*/}
        echo "directories made"
    fi
done

# same as noroot
for i in $listofallfiles; do
    cp -v $i ${i#*/}
    echo "files copied"
done
##############################

#filestodeploy=$(echo $ftd | tr -d '.')
filestodeploy=$noroot

        #filestodeploy=$(for i in $(cat $tmp | xargs -n 1 dirname | uniq); do echo "$i"; done)

#
#if [ $# -eq 0 ] ; then #No args supplied
#    echo "Choose which settings to use:"
#    select dp in "Dev" "Prod" "Test"; do
#        case $dp in
#            Dev ) echo "Dev settings"; isdev=true; break;;
#            Prod ) echo "Prod settings"; isdev=false; break;;
#            * ) echo "type 1 or 2";
#        esac
#    done
#else
#    #isdev=true
#    #remuser=""
#    #remserv=""
#    remdir=$1
#fi


echo "Is branch $bch the branch you wish to deploy?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo "you chose YES -- branch $bch will be the deployed branch"; break;;
        No ) echo "you chose NO"; exit;;
        * ) echo "type 1 for Yes or 2 for No";;
    esac
done

### formatting ###
    #fnms=$(for i in $fnames; do echo "$i\n"; done)
abc=$(for i in $fnames; do echo "$i"; echo "\n"; done)
echo -e "$abc" | column > $tmp2
    #fnms=$(cat $tmp2)
dnms=$(for i in $dnames; do echo "$i\n"; done)
echo -e "$dnms" | column > $tmp3
##################

### log info ###
echo -e "\n"
log="Deployment on: $(date)\n\n\
### The following files were the last files added to the commit, \
and will be included with the deployment:\
\n----------\n$(cat $tmp2)\n----------\n\
    \n### Deployment directories include:\
    \n----------\n$(cat $tmp3)\n----------\n\
    \n----------------------------------------\n"
echo -e "$log"
logparam="\
    ### The following parameters will be used:\
    \nbranch: $bch\
    \nremote-user: $remuser\
    \nremote-server: $remserv\
    \nremote-directory: $remdir\
    \n----------------------------------------\n\
    \n### Commit reference: $(git rev-parse HEAD)\n"
echo -e "$logparam"
log2="\n\n\n\n\nFull file paths:\n\n\n--------------------\n\
    \n$(cat $tmp)"
### writing log to file ###
echo -e "$log" > $outlog
echo -e "$logparam" >> $outlog
echo -e "$log2" >> $outlog
rm $tmp; rm $tmp2; rm $tmp3
###########################

confirmdeploy=false
if $isdev; then
    confirmdeploy=true
fi

### verification for production deployment ###
echo "Are these configurations correct?"
select yn in "Yes" "No" "ReviewFiles"; do
    case $yn in
        Yes ) echo "Last chance: Are you sure?"; 
           select yn2 in "Yes" "No"; do
              case $yn2 in
                  Yes ) echo "it will be done"; confirmdeploy=true; break;;
                  No ) exit;;
                  * ) echo "type 1 for Yes or 2 for No";;
              esac
           done
        break;;
        
        No ) exit;;
        
        ReviewFiles ) echo -e "$log"; 
            echo "Are these configurations correct?"; 
            echo "(type 1 for Yes or 2 for No or 3 to review the files and directories being deployed)";;
        
        * ) echo "type 1 for Yes or 2 for No or 3 to review the files and directories being deployed";;
    esac
done
###############################################


if $confirmdeploy; then
    outputlog="logs/deployment.$(date +%m_%d_%y-%H%M%S).log"
    echo "deploy confirmed"
        #git archive --format=tar $bch $filestodeploy | gzip -9c | tar --directory=$remdir -xvzf -;
        #git archive --format=tar $bch $filestodeploy | gzip -9c | ssh $remuser@$remserv "tar --directory=$remdir -xvzf -; cd $remdir; mv -fv WebRoot/* .;"
        #git archive --format=tar HEAD "$filestodeploy" | gzip -9c | ssh $remuser@$remserv "tar --directory=$remdir/ -xvzf -;" 
    tar -c $filestodeploy | gzip -9c | ssh $remuser@$remserv "tar --directory=$remdir/ -xvzf -;" 
    echo "theoretically deployed successfully"
    mv -v $outlog $outputlog
    for f in $filestodeploy; do 
        if [[ -e $f ]]; then
            if [[ "$(dirname $f)" != '.' ]]; then
                rm -rv $(dirname $f)
            else rm -v $f
            fi
        fi
    done
fi
    #git archive --format=tar dev src/* | gzip -9c | tar --directory=test -xvzf -; mv -fv test/src/* test/; rm -rv test/src;

if [[ ( ! $isdev ) && ( $confirmdeploy ) ]] ; then
    #mv $outlog logs/deployment.$(date +%m_%d_%y-%H%M%S).log
    mv -v $outlog $outputlog
fi
if ! $confirmdeploy; then
    rm $outlog
fi

#git archive --format=tar $bch WebRoot/* | gzip -9c | ssh $remuser@$remserv "tar --directory=$remdir -xvzf -; mv -fv $remdir/WebRoot/* $remdir/; rm -rv $remdir/WebRoot;"
