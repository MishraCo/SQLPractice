--19

with total_entries as (select query_name, count(*) as total_count from Queries group by query_name)

select q1.query_name, 
       ROUND((SUM(q2.rating/q2.position))/t.total_count,2) as quality,
       ROUND((SUM(case when q2.rating < 3 then 1 else 0 end)/t.total_count)*100,2) as poor_query_percentage
FROM queries q1
join total_entries t on q1.query_name=t.query_name
join queries q2
on q1.query_name=q2.query_name and q1.result=q2.result
group by q1.query_name

--OR

select
query_name,
round(avg(cast(rating as decimal) / position), 2) as quality,
round(sum(case when rating < 3 then 1 else 0 end) * 100 / count(*), 2) as poor_query_percentage
from
queries
group by
query_name;


--20

# Write your MySQL query statement below

select LEFT(trans_date,7) as month,
       country,
       count(*) as trans_count,
       sum(case when state='approved' then 1 else 0 end) as approved_count,
       sum(amount) as trans_total_amount,
       sum(case when state='approved' then amount else 0 end) as approved_total_amount
from Transactions
group by 1,2     

--date_format(trans_date, "%Y-%m") as month
--EXTRACT(Year_month from trans_date)
--SUBSTR(trans_date,1,7)