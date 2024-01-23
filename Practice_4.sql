-- Ex 1
SELECT
SUM(CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END) AS laptop_reviews,
SUM(CASE WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE 0 END) AS mobile_views
FROM viewership;
-- Ex 2
SELECT x,y,z,
CASE
WHEN x + y > z AND x + z > y AND y + z > x THEN 'Yes'
ELSE 'No'
END AS triangle
FROM Triangle
-- Ex 3
SELECT 
ROUND (CAST(COUNT (CASE WHEN call_category = 'n/a' or call_category = ' ' then 1 end )
/COUNT (*)*100.0 AS DECIMAL),1) AS call_percentage 
FROM callers;
-- Ex 4
SELECT name
FROM customer
WHERE referee_id !=2 or referee_id is NULL;
-- Ex 5
