-- Active: 1690646653992@@127.0.0.1@3306@SQL21

-- RECURSIVE CTE
with rcte as (
    SELECT 
        DISTINCT store, 
        1 as q_no
    FROM
        STORES

    UNION ALL

    SELECT
        store,
        q_no + 1 as q_no
    FROM
        rcte
    WHERE   
        q_no < 4
), 
cte as (
        SELECT
            store,
            CONCAT('Q', cast(q_no as char(1)) as q_no
            -- 'Q' || cast(q_no as char(1)) as q_no
        FROM
            rcte
    )
SELECT
    q.*
FROM
    cte q 
    left JOIN
    STORES s on q.store = s.store and q.q_no = s.quarter
WHERE
    s.quarter is null;
