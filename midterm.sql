-- Ex 1
SELECT DISTINCT replacement_cost
FROM film;
SELECT MIN(replacement_cost)
FROM film;
-- Ex 2
SELECT 
SUM(CASE WHEN replacement_cost between 9.99 AND 19.99 THEN 1 ELSE 0 END) AS low,
SUM(CASE WHEN replacement_cost between 20.00 AND 24.99 THEN 1 ELSE 0 END) AS medium,
SUM(CASE WHEN replacement_cost between 25.00 AND 29.99 THEN 1 ELSE 0 END) AS high
FROM film
-- Ex 3
SELECT a.category_id,b.title,b.length, c.name FROM film_category as a
JOIN film as b
ON a.film_id = b.film_id
JOIN category as c
ON a.category_id=c.category_id
WHERE c.name IN ('Drama','Sports')
ORDER BY b.length DESC
-- Ex 4
SELECT COUNT(DISTINCT b.title), c.name FROM film_category as a
JOIN film as b
ON a.film_id = b.film_id
JOIN category as c
ON a.category_id=c.category_id
GROUP BY c.name 
ORDER BY COUNT(DISTINCT b.title) DESC
-- Ex 5
SELECT a.first_name || ' ' || a.last_name as hoten, COUNT(b.film_id) as soluong
from actor as a
JOIN film_actor as b
ON a.actor_id=b.actor_id
JOIN film as c
ON b.film_id=c.film_id
GROUP BY hoten
ORDER BY soluong DESC
-- Ex 6
SELECT COUNT(a.address_id) as soluong
FROM address as a 
LEFT JOIN customer AS b 
ON a.address_id=b.address_id
WHERE b.customer_id is null
-- Ex 7
SELECT d.city, SUM(a.amount) from payment as a
JOIN customer as b
ON a.customer_id=b.customer_id
JOIN address as c
ON b.address_id=c.address_id
JOIN city as d
ON c.city_id=d.city_id
GROUP BY d.city
ORDER BY SUM DESC
-- Ex 8
SELECT d.city||','||e.country as city_country,SUM(a.amount) from payment as a
JOIN customer as b
ON a.customer_id=b.customer_id
JOIN address as c
ON b.address_id=c.address_id
JOIN city as d
ON c.city_id=d.city_id
JOIN country as e
ON d.country_id=e.country_id
GROUP BY d.city||','|| e.country
ORDER BY SUM 
