-- Active: 1690646653992@@127.0.0.1@3306@SQL20

SELECT
    *
FROM
    (SELECT
        *,
        SUM(case when is_empty = 'Y' 
                then 1 else 0 end) over (ORDER BY seat_no rows BETWEEN 2 PRECEDING and current row) as prev_2,
        SUM(case when is_empty = 'Y' 
                then 1 else 0 end) over (ORDER BY seat_no rows BETWEEN 1 PRECEDING and 1 FOLLOWING) as prev_next_1,
        SUM(case when is_empty = 'Y' 
                then 1 else 0 end) over (ORDER BY seat_no rows BETWEEN CURRENT ROW and 2 FOLLOWING) as next_2
    FROM
        bms) a
WHERE
    prev_2 = 3 or prev_next_1 = 3 or next_2 = 3;