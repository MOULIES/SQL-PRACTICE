-- Active: 1690646653992@@127.0.0.1@3306@SQL31

SELECT 
    company,
    avg(salary) as avg_salary
FROM
(SELECT 
    *,
    ROW_NUMBER() OVER (PARTITION BY company ORDER BY salary) as rn,
    count(1) OVER (PARTITION BY company) as total_cnt
FROM
    employee) b
WHERE rn BETWEEN total_cnt * 1.0 / 2 and (total_cnt * 1.0 / 2) + 1
GROUP BY company;