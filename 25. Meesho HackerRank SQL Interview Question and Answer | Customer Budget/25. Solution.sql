-- Active: 1690646653992@@127.0.0.1@3306@SQL25


with cte as (SELECT
    *,
    sum(cost) over (order by cost,product_id rows BETWEEN UNBOUNDED PRECEDING and CURRENT ROW) as running_cost
FROM
    products)
SELECT
    customer_id, 
    budget,
    count(1) as no_of_products,
    group_concat(product_id ORDER BY product_id) as product_list
FROM
    customer_budget c 
        left JOIN
    cte on c.budget >= cte.running_cost
group by customer_id, budget;