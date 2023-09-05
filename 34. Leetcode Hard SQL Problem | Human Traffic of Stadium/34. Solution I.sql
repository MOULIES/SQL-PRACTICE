-- Active: 1690646653992@@127.0.0.1@3306@SQL34


WITH cte as (
    SELECT
        *,
        id - row_number() over (order by id) as diff
    FROM
        Stadium
    WHERE 
        people >= 100
), a as (
    SELECT
        *,
        count(*) over (partition by diff) as cnt
    FROM
        cte
)
SELECT
    id,
    visit_date,
    people
FROM
    a
WHERE
    cnt >= 3
ORDER BY visit_date;