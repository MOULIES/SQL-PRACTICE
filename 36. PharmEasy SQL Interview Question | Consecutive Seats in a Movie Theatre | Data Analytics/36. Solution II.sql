-- Active: 1690646653992@@127.0.0.1@3306@SQL36

WITH cte as (
    SELECT
        *,
        LEFT(seat, 1) as row_id,
        CAST(SUBSTRING(seat, 2, 2) as SIGNED) as seat_id,
        ROW_NUMBER() over (PARTITION BY LEFT(seat, 1) ORDER BY CAST(SUBSTRING(seat, 2, 2) as SIGNED)) as rn,
        (CAST(SUBSTRING(seat, 2, 2) as SIGNED) -  ROW_NUMBER() 
                over (PARTITION BY LEFT(seat, 1) ORDER BY CAST(SUBSTRING(seat, 2, 2) as SIGNED))) as diff
    FROM
        movie
    WHERE occupancy = 0
), cte_part as (
    SELECT
        seat,
        row_id,
        seat_id,
        count(diff) OVER (PARTITION BY row_id, diff) as cnt
    FROM
        cte
)
SELECT
    *
FROM
    cte_part
WHERE
    cnt = 4
ORDER BY seat;
