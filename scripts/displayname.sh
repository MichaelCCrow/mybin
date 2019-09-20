usage="bash $0 root/directory/of/project 'Webapp Display Name'"

if [ $# = 0 ]; then
    echo $usage
    exit
fi

cd $1

if [ -f src/main/webapp/WEB-INF/web.xml ]; then
    echo "don't use this"
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

