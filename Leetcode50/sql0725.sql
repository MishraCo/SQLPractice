--11

select e.name, b.bonus from Employee e left join Bonus b on e.empId=b.empId where b.Bonus < 1000 OR
b.Bonus is NULL;


--12

# Write your MySQL query statement below
select s.student_id, s.student_name,r.subject_name, count(e.subject_name) as attended_exams 
from Students s 
cross join Subjects r
left join Examinations e 
on s.student_id = e.student_id and e.subject_name = r.subject_name
group by 1,2,3
order by 1,2,3