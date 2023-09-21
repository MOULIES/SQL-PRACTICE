-- Active: 1690646653992@@127.0.0.1@3306@SQL21

-- AGGREGATION METHOD
SELECT
    store, 
    concat("Q", cast(10 - sum(cast(right(`Quarter`, 1) as unsigned)) as char(2))) as q_no
FROM
    STORES
GROUP BY store;