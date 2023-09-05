-- Active: 1690646653992@@127.0.0.1@3306@SQL39

WITH cte1 as (
    SELECT 
        *,
        ROW_NUMBER() OVER (ORDER BY (SELECT null)) as rn
    FROM
        brands
), cte2 as (
    SELECT
        *,
        lead(rn, 1) OVER (ORDER BY rn) as next_rn
    FROM
        cte1
    WHERE category is not NULL
)
SELECT 
    cte2.category,
    cte1.brand_name
FROM
    cte1 JOIN cte2 on cte2.rn <= cte1.rn and (cte1.rn <= cte2.next_rn - 1 or  cte2.next_rn is null);