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
