

-- Ex 6
SELECT product_name, SUM(unit) AS unit
FROM products AS a
INNER JOIN orders AS b
ON a.product_id = b.product_id
WHERE order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY product_name
HAVING SUM(unit) >= 100;
-- Ex 7
SELECT pages.page_id
FROM pages
LEFT JOIN page_likes
ON pages.page_id = page_likes.page_id
WHERE page_likes.user_id IS NULL
ORDER BY pages.page_id
