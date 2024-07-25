--1
select product_id from Products where low_fats = 'Y' AND recyclable = 'Y'; 
--2
select name from Customer where referee_id != 2 or referee_id is null;
--3
select name, population, area from World where area >= 3000000 or population >= 25000000; 
--4
select distinct author_id as id from Views where author_id = viewer_id order by 1 asc;
--5
select tweet_id from Tweets where length(content) > 15;
--6
select unique_id,name from Employees as e left join EmployeeUNI as u on e.id=u.id; 
--7
select product_name , year, price from Sales as s join Product as p on s.product_id=p.product_id;
--8
select distinct V.customer_id, count(V.visit_id) as count_no_trans from Visits as V where V.visit_id not in (select T.visit_id from Transactions as T)
group by V.customer_id
--9
--correct Solution: --07/24/2024
select w2.id from Weather w2 join Weather w1 on DATEDIFF(w1.recordDate,w2.recordDate) = -1 where w2.temperature > w1.temperature
--Wrong Solution
with CTE as(select id, temperature, lag(temperature) over(order by recordDate) as PrevTemp from Weather)
select id from CTE where temperature > PrevTemp -- does not consider gaps in the record dates captured
--10 [Interesting one] -- 07/24/2024
select a2.machine_id, round(avg(a2.timestamp - a1.timestamp),3) as processing_time 
from Activity a1 join Activity a2 on a1.machine_id=a2.machine_id and a1.process_id=a2.process_id 
and a1.activity_type='start' and a2.activity_type='end'
group by 1


