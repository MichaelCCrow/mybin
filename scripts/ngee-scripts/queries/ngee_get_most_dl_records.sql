SELECT COUNT(DISTINCT(user_email)), COUNT(*), dataset_title, dataset_author 
  FROM logstats 
  WHERE DATE(date) 
    BETWEEN DATE("2016-10-01") AND DATE("2017") 
      AND user_email NOT IN ("zzr@ornl.gov", 
		"tkilleffer@iiaweb.com", "test@test.org", "les.hook@comcast.net",
		"krassovskimb@ornl.gov", "killefferts@ornl.gov", "hookla@ornl.gov", 
		"devarakondar@ornl.gov", "DEVARAKR@HOTMAIL.COM", "crowmc@ornl.gov", 
		"bodenta@ornl.gov", "les.hook@comcast.net", "tkilleffer@gmail.com", 
		"greened@ornl.gov", "palanisamyg@ornl.gov", "anonymous@anonymous.org", "a@b.c"
      ) 
  GROUP BY dataset_author ORDER BY COUNT(DISTINCT(user_email)) DESC;
