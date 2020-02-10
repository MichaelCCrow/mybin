# all downloads before date
SELECT CONCAT('All downloads before ', CURDATE()-14, ': ', COUNT(*))  
FROM logstats 
WHERE date < CURDATE()-14
  AND user_email NOT IN ("zzr@ornl.gov", "a@b.c",
    "tkilleffer@iiaweb.com", "test@test.org", "les.hook@comcast.net",
    "krassovskimb@ornl.gov", "killefferts@ornl.gov", "hookla@ornl.gov", 
    "devarakondar@ornl.gov", "DEVARAKR@HOTMAIL.COM", "crowmc@ornl.gov", 
    "bodenta@ornl.gov", "les.hook@comcast.net", "tkilleffer@gmail.com", 
    "greened@ornl.gov", "palanisamyg@ornl.gov", "anonymous@anonymous.org"
);

# all time
SELECT CONCAT('All-time downloads: ', COUNT(*))  
FROM logstats 
WHERE user_email NOT IN ("zzr@ornl.gov", "a@b.c",
    "tkilleffer@iiaweb.com", "test@test.org", "les.hook@comcast.net",
    "krassovskimb@ornl.gov", "killefferts@ornl.gov", "hookla@ornl.gov", 
    "devarakondar@ornl.gov", "DEVARAKR@HOTMAIL.COM", "crowmc@ornl.gov", 
    "bodenta@ornl.gov", "les.hook@comcast.net", "tkilleffer@gmail.com", 
    "greened@ornl.gov", "palanisamyg@ornl.gov", "anonymous@anonymous.org"
);

# unique downloads before date
SELECT CONCAT('Unique downloads before ', CURDATE()-14, ': ', COUNT(DISTINCT(user_email)))
FROM logstats 
WHERE date < CURDATE()-14
  AND user_email NOT IN ("zzr@ornl.gov", "a@b.c",
	"tkilleffer@iiaweb.com", "test@test.org", "les.hook@comcast.net",
	"krassovskimb@ornl.gov", "killefferts@ornl.gov", "hookla@ornl.gov", 
	"devarakondar@ornl.gov", "DEVARAKR@HOTMAIL.COM", "crowmc@ornl.gov", 
	"bodenta@ornl.gov", "les.hook@comcast.net", "tkilleffer@gmail.com", 
	"greened@ornl.gov", "palanisamyg@ornl.gov", "anonymous@anonymous.org"
);

# all time unique downloads
SELECT CONCAT('All-time unique downloads: ', COUNT(DISTINCT(user_email)))
FROM logstats
WHERE user_email NOT IN ("zzr@ornl.gov", "a@b.c",
     "tkilleffer@iiaweb.com", "test@test.org", "les.hook@comcast.net",
     "krassovskimb@ornl.gov", "killefferts@ornl.gov", "hookla@ornl.gov",
     "devarakondar@ornl.gov", "DEVARAKR@HOTMAIL.COM", "crowmc@ornl.gov",
     "bodenta@ornl.gov", "les.hook@comcast.net", "tkilleffer@gmail.com",
     "greened@ornl.gov", "palanisamyg@ornl.gov", "anonymous@anonymous.org"
);




# all downloads this quarter
SELECT CONCAT('Downloads this quarter: ', COUNT(*))
FROM logstats
WHERE date >= NOW() - INTERVAL 3 MONTH
  AND user_email NOT IN ("zzr@ornl.gov", "a@b.c",
    "tkilleffer@iiaweb.com", "test@test.org", "les.hook@comcast.net",
    "krassovskimb@ornl.gov", "killefferts@ornl.gov", "hookla@ornl.gov",
    "devarakondar@ornl.gov", "DEVARAKR@HOTMAIL.COM", "crowmc@ornl.gov",
    "bodenta@ornl.gov", "les.hook@comcast.net", "tkilleffer@gmail.com",
    "greened@ornl.gov", "palanisamyg@ornl.gov", "anonymous@anonymous.org"
);

# unique downloads this quarter
SELECT CONCAT('Unique downloads this quarter: ', COUNT(DISTINCT(user_email)))
FROM logstats
WHERE date >= NOW() - INTERVAL 3 MONTH
  AND user_email NOT IN ("zzr@ornl.gov", "a@b.c",
    "tkilleffer@iiaweb.com", "test@test.org", "les.hook@comcast.net",
    "krassovskimb@ornl.gov", "killefferts@ornl.gov", "hookla@ornl.gov",
    "devarakondar@ornl.gov", "DEVARAKR@HOTMAIL.COM", "crowmc@ornl.gov",
    "bodenta@ornl.gov", "les.hook@comcast.net", "tkilleffer@gmail.com",
    "greened@ornl.gov", "palanisamyg@ornl.gov", "anonymous@anonymous.org"
);
