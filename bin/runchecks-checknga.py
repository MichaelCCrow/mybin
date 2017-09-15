import xml.etree.ElementTree as ET
import sys

path = sys.argv[1]
file = ET.parse(path)

status = file.find("ome/ome_status")
rid = file.find("ome/record_id")
origins = file.find("idinfo/citation/citeinfo")

print(' <'+status.tag + ">" + status.text + " -- <" + rid.tag + ">" + rid.text)
for origin in origins.findall('origin'):
    print("\t <origin>" + origin.text)
