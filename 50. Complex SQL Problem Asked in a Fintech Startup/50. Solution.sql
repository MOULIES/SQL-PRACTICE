-- Active: 1690646653992@@127.0.0.1@3306@SQL50

SELECT
    t1.`Trade_Stock`,
    t1.`TRADE_ID`,
    t2.`TRADE_ID`,
    t1.`Trade_Timestamp`,
    t2.`Trade_Timestamp`,
    t1.`Price`,
    t2.`Price`,
   (abs(t1.Price - t2.price) * 1.0 / t1.Price) * 100 as DIFF_IN_PRICE
FROM
    Trade_tbl t1
        INNER JOIN
    Trade_tbl t2 on t1.`Trade_Stock` = t2.`Trade_Stock` and t1.Trade_Timestamp < t2.Trade_Timestamp 
    and TIME_TO_SEC(TIMEDIFF(t2.Trade_Timestamp, t1.Trade_Timestamp)) <= 10
WHERE (abs(t1.Price - t2.price) * 1.0 / t1.Price) * 100 > 10
ORDER BY t1.`TRADE_ID`;