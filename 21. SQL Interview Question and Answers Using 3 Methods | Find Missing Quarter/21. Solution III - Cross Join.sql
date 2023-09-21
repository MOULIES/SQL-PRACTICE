-- Active: 1690646653992@@127.0.0.1@3306@SQL21

-- CROSS JOIN

WITH cte as (
    SELECT
        distinct s1.store,
        s2.QUARTER
    FROM
        STORES s1, STORES s2
)
SELECT
    q.*
FROM
    cte q 
    LEFT JOIN
    STORES s on q.store = s.store and q.quarter = s.quarter
WHERE
    s.store is null;