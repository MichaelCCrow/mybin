#!/bin/python

import sys
import subprocess
import os.path
from xml.etree import ElementTree as et

# verify input and provide instructions
if len(sys.argv) != 3:
    print("\nnot enough arguments supplied")
    bashCommand = "add-instructions1 'the metadata file to modify' 'the status to be written in the metadata file'"
    output = subprocess.call(bashCommand, shell=True)
    sys.exit()


mfile = sys.argv[1]
newstatus = sys.argv[2]

print('mfile: ', mfile)

if os.path.exists(mfile):
    tree = et.parse(mfile)
    print(tree.find('.//ome_status').text)
    tree.find('.//ome_status').text = newstatus
    tree.write(mfile)
    print(tree.find('.//ome_status').text)
else:
    print("ERROR:: " + mfile + " -> element or file not found")
