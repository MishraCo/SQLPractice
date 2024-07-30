
-- https://datalemur.com/questions/signup-confirmation-rate
-- LEFT JOIN to get all the emails who tried signing up and the ones for which confirmed flag isn't present , divide both the counts to find activation rate

select 
ROUND(COUNT(t.email_id)::DECIMAL/COUNT(DISTINCT e.email_id),2) AS activation_rate
from emails e 
LEFT join texts t 
on e.email_id=t.email_id AND t.signup_action ='Confirmed';
