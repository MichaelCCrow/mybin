-- delete u1 from users u1 

select u1.username, u1.user_id
from users u1
inner join 
    users u2 
    where u1.user_id < u2.user_id and u1.email = u2.email;
    
 
 
 select email from people group by email having count(email) > 1;