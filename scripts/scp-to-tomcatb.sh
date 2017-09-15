#!/bin/bash

tomcatb="/usr/local/tomcatb"
#echo "This is the path: $1 -- These are the inputs: ${@:2}"
echo -e "\n############################"
echo "The current path is $tomcatb"
echo -e "Add the subdirectory here followed by [ENTER]\nor just hit [ENTER] to scp to the tomcatb directory."
echo "###"
echo -e " NOTE:: If the intended destination is ngeemetadataV2,\n\tconsider the current path to be\n\t$tomcatb/webapps/ngeemetadataV2"
echo "###"
echo -e "\nOptions are:\n\t'/') \t\t$tomcatb/\n\t[nothing]) \t$tomcatb/fromlocalscript/\
    \n\t'some/path') \t$tomcatb/webapps/ngeemetadataV2/some/path\n\t'.') \t\t$tomcatb/webapps/ngeemetadataV2/\
    \n\t'pages')\t$tomcatb/webapps/ngeemetadataV2/WEB-INF/pages/\
    \n\t'classes')\t$tomcatb/webapps/ngeemetadataV2/WEB-INF/classes/\
    \n\n\t'q' or 'quit') Do nothing and quit\n"
echo "Files that will be transferred: ${@:1}"

read path

if [ $path ]; then
    v2="webapps/ngeemetadataV2"
    case $path in
    #if [ $path == "/" ]; then
        "/")
            path="$tomcatb/"
        ;;
    #if [ $path == "." ]; then
        ".")
            path="$tomcatb/$v2/"
        ;;
    #if [ $path == "pages" ]; then
        "pages")
            path="$tomcatb/$v2/WEB-INF/pages/"
        ;;
    #if [ $path == "classes" ]; then
        "classes") 
            echo "Are you sure you want to move class files?"
            read answer
            if ([ $answer ]) && ([ $answer == "yes" ] || [ $answer == "y" ]); then 
                path="$tomcatb/$v2/WEB-INF/classes/"
            else 
                echo "exiting"
                exit 
            fi
        ;;
    #else
        "q") exit ;;
        "quit") exit ;;
        
        *)  
            path="$tomcatb/webapps/ngeemetadataV2/$path/"
        ;;
    esac

else 
    path="$tomcatb/fromlocalscript/"
    echo "Nothing entered -- diverting to default fromlocalscript directory"
fi

echo "'scp'ing to path: $path"
echo -e "\n############################\n"
#echo "scp ${@:1} mcutomcat@esddrupal:$path"
scp ${@:1} mcutomcat@esddrupal:$path



# old way to do it
#scp ${@:2} mcutomcat@esddrupal:/usr/local/tomcatb/$1


#git diff --name-only WebRoot/WEB-INF/pages | cut -d'/' -f2-
