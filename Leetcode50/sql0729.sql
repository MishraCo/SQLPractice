-- 17

select p.project_id, ROUND(sum(e.experience_years)/count(p.employee_id),2) as average_years
FROM Project p left join Employee e on p.employee_id=e.employee_id
group by p.project_id

--18

# Write your MySQL query statement below
select c.contest_id, ROUND((count(c.user_id)/(select count(*) from Users))*100,2) as percentage
from Register c left join Users u on c.user_id=u.user_id
group by 1
order by 2 desc, 1 asc 