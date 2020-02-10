# all downloads before date
SELECT COUNT(*)  
FROM logstats 
WHERE date < '2017-12-31' 
  AND user_email NOT IN ("zzr@ornl.gov", "a@b.c",
    "tkilleffer@iiaweb.com", "test@test.org", "les.hook@comcast.net",
    "krassovskimb@ornl.gov", "killefferts@ornl.gov", "hookla@ornl.gov", 
    "devarakondar@ornl.gov", "DEVARAKR@HOTMAIL.COM", "crowmc@ornl.gov", 
    "bodenta@ornl.gov", "les.hook@comcast.net", "tkilleffer@gmail.com", 
    "greened@ornl.gov", "palanisamyg@ornl.gov", "anonymous@anonymous.org"
  );

# all time
SELECT COUNT(*)  
  FROM logstats 
    WHERE user_email NOT IN ("zzr@ornl.gov", "a@b.c",
	  "tkilleffer@iiaweb.com", "test@test.org", "les.hook@comcast.net",
	  "krassovskimb@ornl.gov", "killefferts@ornl.gov", "hookla@ornl.gov", 
	  "devarakondar@ornl.gov", "DEVARAKR@HOTMAIL.COM", "crowmc@ornl.gov", 
	  "bodenta@ornl.gov", "les.hook@comcast.net", "tkilleffer@gmail.com", 
	  "greened@ornl.gov", "palanisamyg@ornl.gov", "anonymous@anonymous.org"
    );

# unique downloads before date
SELECT COUNT(DISTINCT(user_email))
  FROM logstats 
    WHERE user_email NOT IN ("zzr@ornl.gov", "a@b.c",
	  "tkilleffer@iiaweb.com", "test@test.org", "les.hook@comcast.net",
	  "krassovskimb@ornl.gov", "killefferts@ornl.gov", "hookla@ornl.gov", 
	  "devarakondar@ornl.gov", "DEVARAKR@HOTMAIL.COM", "crowmc@ornl.gov", 
	  "bodenta@ornl.gov", "les.hook@comcast.net", "tkilleffer@gmail.com", 
	  "greened@ornl.gov", "palanisamyg@ornl.gov", "anonymous@anonymous.org"
    )
    AND date < '2017-12-31' ;

# all time unique downloads
SELECT COUNT(DISTINCT(user_email))
  FROM logstats
    WHERE user_email NOT IN ("zzr@ornl.gov", "a@b.c",
      "tkilleffer@iiaweb.com", "test@test.org", "les.hook@comcast.net",
      "krassovskimb@ornl.gov", "killefferts@ornl.gov", "hookla@ornl.gov",
      "devarakondar@ornl.gov", "DEVARAKR@HOTMAIL.COM", "crowmc@ornl.gov",
      "bodenta@ornl.gov", "les.hook@comcast.net", "tkilleffer@gmail.com",
      "greened@ornl.gov", "palanisamyg@ornl.gov", "anonymous@anonymous.org"
    );
