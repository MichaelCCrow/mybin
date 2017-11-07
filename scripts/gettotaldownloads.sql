SELECT dataset_author, COUNT(dataset_author) AS downloads
FROM logstats 
WHERE user_email NOT IN ("zzr@ornl.gov", "tkilleffer@iiaweb.com", "test@test.org", "les.hook@comcast.net", "krassovskimb@ornl.gov", "killefferts@ornl.gov", "hookla@ornl.gov", "devarakondar@ornl.gov", "DEVARAKR@HOTMAIL.COM", "crowmc@ornl.gov", "bodenta@ornl.gov", "les.hook@comcast.net", "tkilleffer@gmail.com", "greened@ornl.gov", "palanisamyg@ornl.gov", "anonymous@anonymous.org", "a@b.c") 
GROUP BY dataset_author
ORDER BY downloads DESC;
