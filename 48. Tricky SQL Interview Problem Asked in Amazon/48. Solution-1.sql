-- Active: 1690646653992@@127.0.0.1@3306@SQL48
-- https://youtu.be/FNUIqQbj_EE

-- solution

SELECT * FROM purchase_history;

SELECT
    userid
FROM
    purchase_history
GROUP BY userid
HAVING count(DISTINCT purchasedate) > 1 and count(productid) = count(DISTINCT productid);


