#!/bin/python
#########################################################
# Generate Options Script

# 1) filename
# 2) option:arg

# This script first accepts a filename to write or overwrite if it exists.
# The remaining arguments are option:argument pairs separated by commas (no space after the comma). 
# This script is called by the bash script (same name without the extension) that relays those args.
# Example usage:
#   generate-options some/file/path/my_auto_opts.sh 'a:echo "Hello great world!"','b:echo "Goodbye cruel world!"','c:echo "you look nice today"'

#########################################################

from sys import argv

filename = argv[1]
opts = argv[2].split(',')

# isflag = "if $OPTARG; then valid=false; fi; \n\t\t   "

# First get option:arg pairs.
# Options are currently only supported as single characters

def generatelines(opts):
    startingline = """#!/bin/bash
# Auto-generated Bash Options Script

valid=true
# flag=false

while getopts '%s' opt ; do
    case $opt in
"""
    lines = ""
    op = ""
    c = 0

    for opt in opts:
        print opt
        i = opt.find(":")
        arg = opt[i+1:]

        # this is the flag that says it's a flag
        if arg.startswith('1'):
            print arg[0]
            # arg = arg.replace(arg[0], isflag)
            arg = arg[1:]
            op += opt[:i]
        else: 
            op += opt[:i] + ":"
        lines += "\t\t" + opt[:i] + ") " + arg + " ;;\n"
        print "op"+str(c), op
        c += 1
        #lines += "\t\t" + opt[:i] + ") " + opt[i+1:] + " ;;\n"
    startingline = startingline % (op)

    lines += """
        \?) valid=false
            echo "An invalid option has been entered: $OPTARG" ;;
        :)  valid=false
            echo "The additional argument for option $OPTARG was omitted." ;;
        *) valid=false ; echo "invalid from *"; break;;
    esac
done
"""
    lines = startingline + lines
    lines += """
if $valid ; then
    shift $((OPTIND-1))
fi

# if [[ $# -lt 3 ]]; then
if ! $valid ; then
    echo "Usage: $0 [options] args"
    exit 1
	# if $flag ; then echo "flag option does not require an argument"; fi
    # echo "Options: -a avalue (def: $av) | -b bvalue (def: $bv) | -c co (def: $co)"
fi
"""

    return lines

# opts = ['a:stuff for a', 'b:different stuff for b', 'j:and lastly lets just use j cuz y not']
# print generatelines(opts)

target = open(filename, 'w')
target.write(generatelines(opts))
target.close()
