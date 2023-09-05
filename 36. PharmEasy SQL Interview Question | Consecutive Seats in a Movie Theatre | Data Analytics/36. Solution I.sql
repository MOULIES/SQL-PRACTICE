-- Active: 1690646653992@@127.0.0.1@3306@SQL36

with cte1 as (
    SELECT
        *,
        LEFT(seat, 1) as row_id,
        CAST(substring(seat, 2, 2) as signed)  as seat_id
    FROM
        movie
), cte2 as (
    SELECT
        *,
        max(occupancy) over (PARTITION BY row_id ORDER BY seat_id ROWS BETWEEN CURRENT ROW and 3 FOLLOWING) as is_4_empty,
        count(occupancy) over (PARTITION BY row_id ORDER BY seat_id ROWS BETWEEN CURRENT ROW and 3 FOLLOWING) as cnt
    FROM
        cte1
), cte3 as (
    SELECT
        *
    FROM
        cte2
    WHERE is_4_empty = 0 and cnt = 4
)
SELECT
    cte2.*
FROM
    cte2 join cte3 on cte2.row_id = cte3.row_id and cte2.seat_id BETWEEN cte3.seat_id and cte3.seat_id + 3;