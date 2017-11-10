#/usr/bin/python
import sys
import subprocess as sp
import os.path as p
import mysql.connector as conn
from time import strftime
from xml.etree import ElementTree as et

if len(sys.argv) != 4:
    print '1) file to add\n2) status\n3) creator'
    sys.exit(1)

global file
global file_location
global rid
global status
global owner
global updatedate
global dsid
global dbconfig

dbconfig = {
    'user':'ngeeadmin',
    'password':'ngee4db!',
    'host':'localhost',
    'database':'NGEE_Arctic',
    'raise_on_warnings':True,
}
file_location = 'metadata/status/'
updatedate = strftime("%Y_%m_%d_%H%M%S")
dsid = None

statuses = ['draft', 'submitted', 'accepted', 'approved', 'returned']


try:
    file = sys.argv[1].strip()
    status = sys.argv[2].strip()
    owner = sys.argv[3].strip()

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



def getdsid():
    cnx = conn.connect(**dbconfig)
    cur = cnx.cursor()
    getlastdsid = "SELECT dsid FROM files WHERE dsid < 100 ORDER BY dsid DESC LIMIT 1"
    cur.execute(getlastdsid)

    for d in cur: dsid = d
    dsid = int(*dsid)

    cur.close()
    cnx.close()

    dsid = int(dsid) + 1
    return dsid

def makenewrid(newdsid):
    return 'NGA0'+str(newdsid)

def appendrecordid(newrid):
    splitfile = p.basename(file).split(".")
    first = splitfile[0]
    ext = splitfile[1]
    if 'xml' not in ext:
        print 'filename already has a record id: ', ext
        sys.exit(1)
    else:
        newfilename = first + '.' + newrid + '.' + ext
        print 'filename appended with record_id'
        return newfilename

def updatedb(cursor, rid, file_location, creator, file_status, updatedate, dsid):
    fileinfo = (rid, file_location, creator, creator, file_status, updatedate, dsid)
    addfile = ("INSERT INTO files "
         "(id, file_location, creator, file_type, file_status, update_date, dsid)"
         "VALUES( %s, %s, %s, %s, %s, %s, %s)")
    try:
        cursor.execute(addfile, fileinfo)
        print 'database updated'
        return True
    except Exception: return False

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
    # global newfilelocation
    # newfilelocation = dest
    try:
        sp.check_output(['cp', file, dest])
        print 'file system updated'
        return dest
        # return True
    except Exception: return False

def updatexml(file, rid):
    tree = et.parse(file)
    e = tree.find('./ome/record_id')
    if e is not None:
        e.text = rid
    else:
        ometag = tree.find('.//ome')
        e = et.Element('record_id')
        ometag.append(e)
        e.text = rid
    tree.write(file)
    print 'xml updated with new record_id'


def addtoome(file):
    cnx = conn.connect(**dbconfig)
    cur = cnx.cursor()

    try:
        updatedb(cur, rid, file_location, owner, status, updatedate, dsid)
        newfilelocation = updatefiles(file)
        updatexml(newfilelocation, rid)
        cnx.commit()
        print 'new file location: ' + newfilelocation
    except Exception as ex: print ex

    cur.close()
    cnx.close()


dsid = getdsid()
rid = makenewrid(dsid)
file_location += appendrecordid(rid)

addtoome(file_location)




print '------------'
print rid
print file_location
print owner
print owner
print status
print updatedate
print dsid
print '------------'
