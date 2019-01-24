import json
import requests
import urllib

# jsonstr = '''{"record":{"creatorsblock":[{"first_name":"Wade","last_name":"Darnell","private_email":"email@email"},{"first_name":"John","last_name":"Smith","private_email":"email@email"}],"osti_id":1374232,"title":"Test #2","publication_date":"11/30/2018","site_url":"https://adc.arm.gov/armdoi?test9","keywords":"test","description":"test","doi":"10.5072/1374232","dataset_size":"1GB"}}'''

# jsonob = json.loads(jsonstr)

# print(jsonob['record']['osti_id'])
# jsonob['record']['osti_id'] = '09809809890890890809890809809'
# print(jsonob['record']['osti_id'])

# print('-------------------------')
# print(json.dumps(jsonob))

# print(requests.get('https://google.com'))


# dois = []


def getdoijson(doi):
    # contents = requests.get('https://msfa.ornl.gov/doitool/getdoi?auth=4f662a110e781c0c&doi_string='+doi)
    contents = requests.get('http://esddrupal-dev.ornl.gov:8080/genericdoi/getdoi?auth=4f662a110e781c0c&doi_string='+doi)
    print(contents.text)
    try:
        print(contents.json())
        return contents.json()
        # return json.loads(contents.text)
    except: pass
    # return contents.text

def getupdatedjson(oldjson, newurl):
    print(oldjson['record']['site_url'])
    oldjson['record']['site_url'] = newurl
    return str(oldjson)
    # return json.dumps(oldjson)
    # return oldjson

def postnewjson(newjson):
    # requests.post('https://msfa.ornl.gov/doitool/postdoi', newjson)
    requests.post('https://esddrupal-dev.ornl.gov:8443/genericdoi/postdoi', data=newjson)

# print(getupdatedjson(getdoijson('10.5072/1374232'), 'newurl'))
# testlink = urllib.parse.quote_plus('https://msfa.ornl.gov/msfa/#fq=titlestr:"[Data Set] East Fork Poplar Creek Discharge at Kilometer 5.4 Water Year 2013"&q=:')
testlink = 'https://msfa.ornl.gov/msfa/#fq=titlestr:"[Data Set] East Fork Poplar Creek Discharge at Kilometer 5.4 Water Year 2013"&q=:'
testjson = {'record': {'site_url': testlink, 'doi': '10.5072/1374232', 'dataset_size': '1GB', 'osti_id': 1374232, 'creatorsblock': [{'first_name': 'Smitty', 'private_email': 'email@email', 'last_name': 'Smith'}], 'title': 'API TEST', 'description': 'Testing', 'publication_date': '11/28/2018', 'keywords': 'Testing'}}
# postnewjson(testjson)
postnewjson(json.dumps(testjson))

# with open("dois.txt") as file:
#     for line in file:
#         parts = line.split(' doi:')
#         link = parts[0].strip()
#         doi = parts[1].strip()
#         doijson = getdoijson(doi)
#         if doijson is None: print('none found')
#         else:
#             print('old: ',doijson)
#             newjson = getupdatedjson(doijson, link)
#             print('new: ',newjson)
#             postnewjson(newjson)
#             print('------------done--------------')








# def getdoijson():
#     for i in dois:



# def modifyjson(jsonstr):


