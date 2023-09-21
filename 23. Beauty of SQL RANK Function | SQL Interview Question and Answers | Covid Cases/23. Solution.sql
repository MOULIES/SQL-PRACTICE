-- Active: 1690646653992@@127.0.0.1@3306@SQL24

with cte as (
    SELECT
        *,
        rank() over (PARTITION BY city ORDER BY days asc) as rn_days,
        rank() over (PARTITION BY city ORDER BY cases asc) as rn_cases,
        cast(rank() over (PARTITION BY city ORDER BY days asc) as signed) - cast(rank() over (PARTITION BY city ORDER BY cases asc) as signed) as diff
    FROM
        covid
)
SELECT
    city
FROM
    cte
GROUP BY city
HAVING count(DISTINCT diff) = 1 and avg(diff) = 0;