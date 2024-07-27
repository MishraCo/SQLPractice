--13

select e2.name
from Employee e1 join Employee e2 on e1.managerId=e2.id
group by e2.id
having count(*)>=5

--OR

with cte as(select e2.managerId, count(e1.id) as numReport 
from Employee e1 join Employee e2 on e1.id=e2.id
group by e2.managerId)

select t1.name from Employee t1 join cte t2 on t1.id=t2.managerID where t2.numReport >=5

--14 the average for the categorical column should be done using if else or case when conditional statements

select s.user_id, 
ROUND(AVG(if(c.action='confirmed', 1,0)),2) as confirmation_rate 
from Signups s 
left join 
Confirmations c 
on s.user_id=c.user_id 
group by s.user_id