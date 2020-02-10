import sys

task = {
  'LC':'Landscape Characterization',
  'RS':'Representative and Scaling',
  'CM':'Climate-Scale Modeling',
  'IM':'Intermediate-Scale Modeling',
  'FM':'Fine-Scale Modeling',
  'S':'Site Characterization and Design',
  'HG':'Hydrology and Geomorphology',
  'BGC':'Biogeochemistry',
  'V':'Vegetation Dynamics',
  'I':'Itegrated Model-Data Evaluation',
  'G':'Geospatial'
}

#print task['LC']
#print task.keys()

#if 'V' in task.keys(): print 'yes'
#else: print 'no'

a = 0

def parsefromfile():
  with open ('/home/mcu/reports/ngeeTasks.txt', 'r') as f:
    for l in f.readlines():
        a = a + 1
        if a % 3 == 0: 
            #print l
            if l.strip() in task.keys():
                print task[l.strip()]
                #print 'good'+l.strip()
            else: print 'nogood:',l

try:
    print task[sys.argv[1].strip()]
except Exception:
    print ''
