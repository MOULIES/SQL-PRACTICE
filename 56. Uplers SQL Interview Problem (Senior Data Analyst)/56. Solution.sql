-- Active: 1690646653992@@127.0.0.1@3306@SQL56

WITH running_cte as (
    SELECT
        *,
        sum(salary) over (PARTITION BY positions ORDER BY salary desc) as running_sal
    FROM
        candidates
),
seniors_cte as (
    SELECT  
        count(*) as seniors,
        -- coalesce(sum(salary), 0) as s_sal
        coalesce(max(salary), 0) as s_sal 
    FROM
        running_cte
    WHERE
        positions = 'senior' and running_sal <= 50000
),
juniors_cte as (
    SELECT  
        count(*) as juniors,
        -- coalesce(sum(salary), 0) as s_sal
        coalesce(max(salary), 0) as j_sal 
    FROM
        running_cte
    WHERE
        positions = 'JUNIOR' and running_sal <= 50000 - (select s_sal from seniors_cte)
)
SELECT 
    juniors,
    seniors
FROM
    seniors_cte, juniors_cte;
