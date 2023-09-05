-- Active: 1690646653992@@127.0.0.1@3306@SQL28

SELECT
    a.*
FROM
    int_orders a
        LEFT JOIN
    int_orders b on a.salesperson_id = b.salesperson_id
GROUP BY a.order_number, a.order_date, a.cust_id, a.salesperson_id, a.amount
having a.amount >= max(b.amount);