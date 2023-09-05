-- Active: 1690646653992@@127.0.0.1@3306@SQL30


with cte as (
    SELECT
        *,
        ROW_NUMBER() over (PARTITION BY Continent ORDER BY name) as rnum
    FROM
        Student
)
SELECT
    max(case WHEN  continent = 'America' then name END) as America,
    max(case WHEN  continent = 'Asia' then name END) as Asia,
    min(case WHEN  continent = 'Europe' then name END) as Europe
FROM
    cte
GROUP BY rnum 
ORDER BY rnum;
