-- Active: 1690646653992@@127.0.0.1@3306@SQL24


SELECT 
    company_id
FROM
    (
        SELECT
            company_id, user_id
        FROM
            company_users
        WHERE language in ('English', 'German')
        GROUP BY company_id, user_id
        HAVING count(1) = 2
    ) b
GROUP BY company_id
HAVING count(1) = 2;