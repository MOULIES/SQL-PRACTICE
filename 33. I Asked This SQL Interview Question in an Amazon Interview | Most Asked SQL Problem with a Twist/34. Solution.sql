-- Active: 1690646653992@@127.0.0.1@3306@SQL33

with cte as (
    SELECT
        emp_id,
        emp_name,
        salary,
        dep_id,
        dep_name,
        RANK() over (PARTITION BY dep_id ORDER BY salary desc) as rnk,
        count(1) over (PARTITION BY dep_id) as cnt
    FROM
        employee
)
SELECT
    *
FROM
    cte
WHERE
    rnk = 3 or (cnt < 3 and rnk = cnt);