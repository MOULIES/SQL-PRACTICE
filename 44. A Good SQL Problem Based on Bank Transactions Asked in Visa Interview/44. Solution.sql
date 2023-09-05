-- Active: 1690646653992@@127.0.0.1@3306@SQL44

-- https://youtu.be/D2vqqOfVBuc

with cte as (
    SELECT
        cast(transaction_date as date) transaction_date,
        sum(CASE WHEN type = 'deposit' then amount
            WHEN type = 'withdrawal' then -1 * amount END) as amount
    FROM    
        transactions
    GROUP BY cast(transaction_date as date)
    ORDER BY 1
)
SELECT 
    DATE_FORMAT(transaction_date, "%Y-%m-%d 00:00:00") transaction_date,
    sum(amount) over (PARTITION BY year(transaction_date), month(transaction_date) ORDER BY transaction_date) as balance
FROM 
    cte
ORDER BY transaction_date;