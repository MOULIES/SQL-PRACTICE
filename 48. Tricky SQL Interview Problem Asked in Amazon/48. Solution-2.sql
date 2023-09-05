-- Active: 1690646653992@@127.0.0.1@3306@SQL48
WITH criteria AS(
    SELECT 
        userid, 
        DENSE_RANK() OVER (PARTITION BY userid, productid ORDER BY purchasedate) as sameproduct, 
        DENSE_RANK() OVER (PARTITION BY userid ORDER BY purchasedate) as differentdays 
    FROM purchase_history
)
SELECT 
    userid
FROM 
    criteria
GROUP BY userid
HAVING MAX(sameproduct) = 1 AND MAX(differentdays) > 1;