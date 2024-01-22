-- Ex 1
SELECT (name,3) from STUDENTS 
WHERE marks >75
ORDER BY RIGHT(name,3),id
-- Ex 2
SELECT user_id,
CONCAT (UPPER (LEFT (name,1)), LOWER (RIGHT(name, LENGTH (name)-1))) AS name
from Users
ORDER by user_id
-- Ex 3 
SELECT manufacturer,
'$' || ROUND (sum (total_sales)/1000000,0)|| ' ' || 'milion' AS sale
FROM pharmacy_sales
GROUP BY (manufacturer)
ORDER BY sale DESC , manufacturer 
-- Ex 4
SELECT EXTRACT (month from submit_date) AS mth,
product_id,
ROUND(avg(stars),2) as avg_starts
FROM reviews
GROUP BY mth, product_id
ORDER BY mth, product_id
-- Ex6
SELECT tweet_id from Tweets
WHERE LENGTH (content) >15
-- Ex 7
-- Ex 8
select count (id) AS number_employee from employees
where extract (month from joining_date) between 1 and 7
and extract (year from joining_date) = '2022'
-- Ex 9
select position ('a' in first_name) as position 
from worker
where first_name =  'Amitah'
-- Ex 10 
