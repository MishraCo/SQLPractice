--15

-- Write your MySQL query statement below
select id,movie,description,rating 
from Cinema 
-- floor division happens with MOD() in sql
where description !="boring" and MOD(id,2)=1
order by rating desc

-- 16

select p.product_id, IFNULL(ROUND(sum(p.price*s.units)/sum(s.units),2),0) as average_price 
from Prices p left join UnitsSold s 
on p.product_id=s.product_id 
and  s.purchase_date between p.start_date and p.end_date
group by 1
