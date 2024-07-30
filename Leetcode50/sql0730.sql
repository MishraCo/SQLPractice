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