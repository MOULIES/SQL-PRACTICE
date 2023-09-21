-- Active: 1690646653992@@127.0.0.1@3306@SQL20

with diff_num as (
    SELECT
        *,
        ROW_NUMBER() over (order by seat_no) as rn,
        seat_no -  ROW_NUMBER() over (order by seat_no) as diff 
    FROM
        bms
    WHERE
        is_empty = 'Y'
), cnt as (
    SELECT
        diff, count(1)
    FROM
        diff_num
    GROUP BY 
        diff 
    HAVING count(1) >= 3
)
SELECT
    *
FROM
    diff_num
WHERE
    diff in (select diff from cnt);
