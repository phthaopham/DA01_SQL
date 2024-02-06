-- Ex 1
WITH job_count 
AS (SELECT company_id, 
title, 
description, 
COUNT(job_id) AS job_count
FROM job_listings
GROUP BY company_id, title, description)
SELECT COUNT(DISTINCT company_id) AS duplicate_companies
FROM job_count
WHERE job_count > 1
-- Ex 2
SELECT category,
product, 
SUM(spend) AS total_spend
FROM product_spend
WHERE EXTRACT (YEAR FROM transaction_date) = 2022
GROUP BY category,product
-- Ex 3
WITH total_call
AS (SELECT policy_holder_id, 
COUNT(case_id) as so_luong
FROM callers
GROUP BY policy_holder_id
HAVING COUNT(case_id)>=3)
SELECT COUNT(policy_holder_id) AS member_count
FROM total_call
-- Ex 4
SELECT page_id
FROM pages
WHERE page_id NOT IN 
(SELECT page_id FROM page_likes
WHERE page_id IS NOT NULL)
-- Ex 6
WITH monthly_trans
AS (SELECT DATE_FORMAT(trans_date, '%Y-%m') AS month,
country,
COUNT(id) AS trans_count,
SUM(amount) AS trans_total_amount
FROM transactions
GROUP BY month, country),
approved_trans 
AS (SELECT DATE_FORMAT(trans_date, '%Y-%m') AS month,
country,
SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM transactions
GROUP BY month, country)
SELECT
a.month,
a.country,
a.trans_count,
a.trans_total_amount,
b.approved_count,
b.approved_total_amount
FROM monthly_trans as a
JOIN approved_trans as b
ON a.month = b.month 
AND a.country = b.country
-- Ex 7
WITH product_firstyear 
AS (SELECT product_id,
MIN(year) AS first_year
FROM Sales
GROUP BY product_id)
SELECT a.product_id,b.first_year,a.quantity,a.price
FROM Sales AS a
INNER JOIN product_firstyear AS b
ON a.product_id = b.product_id
AND a.year = b.first_year;
-- Ex 8
WITH count_customer
AS ( SELECT customer_id, COUNT(DISTINCT product_key) AS so_luong
FROM Customer
GROUP BY customer_id )
SELECT customer_id
FROM count_customer
WHERE so_luong = (SELECT COUNT(DISTINCT product_key) FROM Product)
-- Ex 9
WITH left_manager 
AS (SELECT DISTINCT manager_id FROM Employees
WHERE manager_id IS NOT NULL)
SELECT a.employee_id
FROM Employees AS a
LEFT JOIN left_manager AS b ON a.manager_id = b.manager_id
WHERE a.salary < 30000 AND b.manager_id IS NULL
ORDER BY a.employee_id
-- Ex 10
WITH twt_job_count 
AS (SELECT company_id, title, description, COUNT(job_id) AS job_count
FROM job_listings
GROUP BY company_id, title, description)
SELECT COUNT(DISTINCT company_id) AS duplicate_companies
FROM twt_job_count
WHERE job_count > 1
-- Ex 12
WITH count_friend 
AS (SELECT accepter_id AS ban_be, COUNT(requester_id) AS so_luong
FROM RequestAccepted
GROUP BY accepter_id )
SELECT ban_be AS id, so_luong AS num
FROM count_friend
WHERE so_luong = (SELECT MAX(so_luong) FROM count_friend)
ORDER BY ban_be;

  


