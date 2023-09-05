-- Active: 1690646653992@@127.0.0.1@3306@SQL46

-- https://youtu.be/QHwHS4AMmQM

with cte as (
    SELECT
        order_id,
        ifnull(cur.order_date, 'D') as Flag
    FROM 
        tbl_orders_copy old
            LEFT JOIN
        tbl_orders cur using (order_id)

    UNION

    SELECT
        order_id,
        ifnull(old.order_date, 'I')  as Flag
    FROM 
        tbl_orders_copy old
            RIGHT JOIN
        tbl_orders cur using (order_id)
    )
SELECT * FROM cte where flag in ('D', 'I');

-- Note:
-- To apply the full outer join concept in MySQL, we have to use UNION operator at all cost.