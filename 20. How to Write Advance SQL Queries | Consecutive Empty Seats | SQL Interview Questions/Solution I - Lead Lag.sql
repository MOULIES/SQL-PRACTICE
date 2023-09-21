-- Active: 1690646653992@@127.0.0.1@3306@SQL20

SELECT
    *
FROM
    (SELECT
        *,
        lag(is_empty, 1) over (order by seat_no) as prev_1,
        lag(is_empty, 2) over (order by seat_no) as prev_2,
        lead(is_empty, 1) over (order by seat_no) as next_1,
        lead(is_empty, 2) over (order by seat_no) as next_2
    FROM
        bms) A
WHERE
    (is_empty = 'Y' and prev_1 = 'Y' and prev_2 = 'Y') OR
    (is_empty = 'Y' and prev_1 = 'Y' and next_1 = 'Y') OR
    (is_empty = 'Y' and next_1 = 'Y' and next_2 = 'Y');