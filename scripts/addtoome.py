#/usr/bin/python
import sys
import subprocess as sp
import os.path as p
from time import strftime
import mysql.connector as conn

global file
global file_location
global rid
global status
global owner
global updatedate
global dsid

file_location = 'metadata/status/'
updatedate = strftime("%Y_%m_%d_%H%M%S")
dsid = None

statuses = ['draft', 'submitted', 'accepted', 'approved', 'returned']

try:
    file = sys.argv[1].strip()
    # file = p.basename(file)

    owner = sys.argv[3].strip()

    status = sys.argv[2].strip()
    if status not in statuses:
        print 'unacceptible status: ', status
        exit(1)
    else:
        if status is 'draft' or status is 'returned':
            file_location = '/users/'+str(owner)+'/'
        else: file_location = file_location.replace('status', status)

    print file_location



except Exception:
    print "improper args given"
    sys.exit(1)

global dbconfig
dbconfig = {
    'user':'ngeeadmin',
    'password':'ngee4db!',
    'host':'localhost',
    'database':'NGEE_Arctic',
    'raise_on_warnings':True,
}




def getdsid():
    cnx = conn.connect(**dbconfig)
    cur = cnx.cursor()
    getlastdsid = "SELECT dsid FROM files WHERE dsid < 100 ORDER BY dsid DESC LIMIT 1"
    cur.execute(getlastdsid)

    for d in cur: dsid = d
    dsid = int(*dsid)

    cur.close()
    cnx.close()

    # dsid = sp.check_output(['bash', '/Users/mcu/Development/scripts/addtoome.sh'])
    dsid = int(dsid) + 1
    print 'dsid ', dsid
    return dsid

def makenewrid(newdsid):
    # dsid = getdsid()
    # return 'NGA0'+str(dsid)
    return 'NGA0'+str(newdsid)

def appendrecordid(newrid):
    splitfile = p.basename(file).split(".")
    first = splitfile[0]
    ext = splitfile[1]
    if 'xml' not in ext:
        print 'must already have a record id: ', ext
        sys.exit(1)
    else:
        newfilename = first + '.' + newrid + '.' + ext
        return newfilename

def updatedb(cursor, rid, file_location, creator, file_status, updatedate, dsid):
    fileinfo = (rid, file_location, creator, creator, file_status, updatedate, dsid)
    addfile = ("INSERT INTO files "
         "(id, file_location, creator, file_type, file_status, update_date, dsid)"
         "VALUES( %s, %s, %s, %s, %s, %s, %s)")
    try:
        cursor.execute(addfile, fileinfo)
        return True
    except Exception: return False

    # fileinfo = {
    #     'id':rid,
    #     'file_location':file_location,
    #     'creator':creator,
    #     'file_type':creator,
    #     'file_status':file_status,
    #     'update_date':updatedate,
    #     'dsid':dsid,
    # }
    # q = ("INSERT INTO files "
    #      "(id, file_location, creator, file_type, file_status, update_date, dsid)"
    #      "VALUES( %(id)s, %(file_location)s, )"



def updatefiles(file_location):
    if file_location.startswith('metadata'):
        dest = file_location.replace('metadata', '/metadata/ngee').strip()
    else:
        if file_location.startswith('users'):
            dest = file_location.replace('users', '/metadata/ngee/users').strip()
        else:
            print "something wrong with file_location"
            sys.exit(1)
    print "src file: " + file
    print "dest for file: " + dest
    try:
        sp.check_output(['cp', file, dest])
        return True
    except Exception: return False



dsid = getdsid()
rid = makenewrid(dsid)
file_location += appendrecordid(rid)



def addtoome(file):
    cnx = conn.connect(**dbconfig)
    cur = cnx.cursor()

    success = updatedb(cur, rid, file_location, owner, status, updatedate, dsid)
    if not success:
        print "something went wrong in the db"
        cur.close()
        cnx.close()
        sys.exit(1)

    success = updatefiles(file)
    if not success:
        print "something went wrong trying to copy the file"
        cur.close()
        cnx.close()
        sys.exit(1)

    cnx.commit()
    cur.close()
    cnx.close()


print '------------'
print rid
print file_location
print owner
print owner
print status
print updatedate
print dsid
print '------------'

addtoome(file_location)


