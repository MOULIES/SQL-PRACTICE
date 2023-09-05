-- Active: 1690646653992@@127.0.0.1@3306@SQL35

# Method 1
SELECT
    year(c1.business_date) as `year`,
    count(DISTINCT c1.city_id) as `#_new_cities`
FROM
    business_city c1
    left JOIN
    business_city c2 on year(c1.business_date) > year(c2.business_date) and c1.city_id = c2.city_id
WHERE c2.city_id is NULL
GROUP BY year(c1.business_date);

# Method 2
WITH cte as (
    
)