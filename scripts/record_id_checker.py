import sys
from os import listdir
from os.path import dirname
from os.path import basename

recid = sys.argv[1]
fullfilepath = sys.argv[2]

mddir = dirname(fullfilepath)
filename = basename(fullfilepath)

match=None
matches = []

ls = listdir(mddir)

for fname in ls:
    hidden = fname.startswith('.')
    oldformat = fname[-1].isdigit() and not fname.endswith('.old')
    if recid in fname and not hidden and not oldformat:
        match = fname
        matches.append(fname)
onlyone = len(matches) <= 1

if not onlyone:
    print 'error'
    sys.exit(1)
    # for i in matches: print i
    # "more than one file with record id "+recid+" found"

if not match: sys.exit(0) # file is new
if match and match in filename: sys.exit(0)
else: print match
