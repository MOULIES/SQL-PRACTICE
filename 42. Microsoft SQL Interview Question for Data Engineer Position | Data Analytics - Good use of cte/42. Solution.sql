/*
A company wants to hire new employees. The budget of the company for the salaries is $70000.
The company's criteria for hiring are:
- Keep hiring the senior with the smallest salary until you cannot hire any more seniors.
- Use the remaining budget to hire the junior with the smallest salary
- Keep hiring the junior with the smallest salary until you cannot hire any more seniors.
- Write an sql query to find the seniors and juniors hired under mentioned criteria
*/

with total_salary as (
    SELECT 
        *,
        sum(salary) OVER (PARTITION BY experience order by salary asc rows between UNBOUNDED PRECEDING and current row) as running_sal
    FROM
        candidates
),
 senior_cte as (
    SELECT
        *
    FROM 
        total_salary
    WHERE running_sal <= 70000 and experience = 'Senior'
 ),
junior_cte as (
    SELECT
        *
    FROM 
        total_salary
    -- WHERE running_sal <= (select 70000 - MAX(running_sal) from senior_cte) and experience = 'Junior'
    WHERE running_sal <= (select SUM(running_sal) from senior_cte) and experience = 'Junior'
)
SELECT * FROM senior_cte
UNION ALL
SELECT * FROM junior_cte;