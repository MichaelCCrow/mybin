#!/usr/bin/python

import sys

if sys.argv[1].endswith('/'):
  l = len(sys.argv[1])
  print sys.argv[1][:l-1].rpartition('/')[2]
else: print sys.argv[1].rpartition('/')[2]


#def dothis(filename):
    #return filename.rpartition('/')[2]
    
#dothis(sys.argv[1])

#print filename.rpartition('/')[0]
#print filename.rpartition('/')[1]
#print filename.rpartition('/')[2]

#pieces = len(filename.split("/"))
#newFilename = filename.split("/")[pieces.len - 1]
#print newFilename
