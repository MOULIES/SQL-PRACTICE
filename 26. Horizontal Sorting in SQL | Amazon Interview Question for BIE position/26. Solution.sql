-- Active: 1690646653992@@127.0.0.1@3306@SQL26

SELECT
    sms_date,
    p1,
    p2,
    sum(sms_no) as total_sms
FROM
    (SELECT
        *,
        CASE 
            WHEN sender < receiver THEN  sender 
            ELSE  receiver
        END as p1,
        CASE 
            WHEN sender > receiver THEN  sender 
            ELSE  receiver
        END as p2
    FROM
        subscriber) a 
GROUP BY sms_date, p1, p2;