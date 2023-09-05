-- Active: 1690646653992@@127.0.0.1@3306@SQL49

-- https://youtu.be/m_oDI0bD6VQ

SELECT * FROM marketing_campaign;

-- sol:

with rnk_cte as (
    SELECT
        *,
        rank() over (partition by user_id ORDER BY created_at) as rnk
    FROM
        marketing_campaign
), first_app_purchase_cte as (
    SELECT * FROM rnk_cte where rnk = 1
), except_first_app_purchase_cte as (
    SELECT * FROM rnk_cte where rnk > 1
)
SELECT
    a.user_id, a.product_id
FROM
    except_first_app_purchase_cte a
        LEFT JOIN
    first_app_purchase_cte b on a.user_id = b.user_id 
    and a.product_id = b.product_id
where b.product_id is null;
