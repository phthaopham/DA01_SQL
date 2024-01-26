-- Ex 1

-- Ex 2
SELECT ROUND(CAST(COUNT(b.email_id)) AS DECIMAL) / COUNT(DISTINCT a.email_id),2) AS activation_rate
FROM emails AS a 
LEFT JOIN texts AS b 
ON a.email_id = b.email_id
AND b.signup_action = 'Confirmed';
-- Ex 3

-- Ex 5
SELECT b.employee_id, b.name, COUNT(a.employee_id) AS reports_count, ROUND(AVG(a.age)) AS average_age
FROM employees AS a
JOIN employees AS b 
ON a.reports_to = b.employee_id
GROUP BY b.employee_id, b.name
HAVING COUNT(a.employee_id) > 0
ORDER BY b.employee_id;
-- Ex 6
SELECT product_name, SUM(unit) AS unit
FROM products AS a
INNER JOIN orders AS b
ON a.product_id = b.product_id
WHERE order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY product_name
HAVING SUM(unit) >= 100;
-- Ex 7
SELECT a.page_id
FROM pages AS a
LEFT JOIN page_likes AS b
ON a.page_id = b.page_id
WHERE b.user_id IS NULL
ORDER BY a.page_id ASC;

