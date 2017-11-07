#!/bin/python

import sys
import xml.etree.ElementTree as ET

f = sys.argv[1]
e = ET.parse(f)
rid = e.find('ome/record_id')
rid.text = ''

index = f.find('.xml')
f0 = f[:index]
f1 = f0 + '.tmpl.xml'
f = f1
print(f)
e.write(f)