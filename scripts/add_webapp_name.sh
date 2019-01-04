usage="\n[USAGE]\nbash $0 root/directory/of/project 'Webapp Display Name'\n\n\n(Use . for current directory)"

if [ $# = 0 ]; then
    echo -e $usage
    exit
fi

if [ ! $1 = "." ]; then 
    cd $1
fi

if [ -f src/main/webapp/WEB-INF/web.xml ]; then
    echo "don't use this"
    exit
fi

if [ ! -f pom.xml ]; then 
    echo "must be a maven project"
    echo $usage
    exit
fi

if [ ! -d src/main ]; then 
    echo "must be a maven structured project"
    echo $usage
    exit
fi

if [ ! -d src/main/webapp/WEB-INF ]; then
    mkdir -p src/main/webapp/WEB-INF
fi

echo "<web-app><display-name>$2</display-name></web-app>" > src/main/webapp/WEB-INF/web.xml

