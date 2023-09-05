-- Active: 1690646653992@@127.0.0.1@3306@SQL32

WITH running_sum_values as (
    SELECT
        Buy.time as Buy_time,
        Buy.qty as Buy_qty,
        Sell.qty as Sell_qty,
        sum(Buy.qty) over(ORDER BY Buy.time) as r_Buy_qty,
        IFNULL(sum(Buy.qty) over(ORDER BY Buy.time rows between UNBOUNDED PRECEDING and 1 PRECEDING), 0) as r_Buy_qty_prev
    FROM
        Buy JOIN Sell on Buy.date =Sell.date and Buy.time < Sell.time
)
(SELECT
    buy_time,
    CASE 
        WHEN  r_Buy_qty <= Sell_qty THEN  Buy_qty
        ELSE  Sell_qty - r_Buy_qty_prev
    END as buy_qty,
    CASE 
        WHEN  r_Buy_qty <= Sell_qty THEN  Buy_qty
        ELSE  Sell_qty - r_Buy_qty_prev
    END as sell_qty
FROM
    running_sum_values)
UNION ALL
(SELECT
    buy_time,
    r_Buy_qty - Sell_qty as buy_qty,
    NULL as sell_qty
FROM
    running_sum_values
WHERE
    Sell_qty < r_Buy_qty 
);