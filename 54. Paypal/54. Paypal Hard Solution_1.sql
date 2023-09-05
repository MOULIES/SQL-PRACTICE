
use sql54;


WITH each_dep_agg as (

    SELECT
        department_id,
        count(*) as dept_cnt,
        sum(salary) as dept_salary,
        avg(salary) as dept_avg_salary
    FROM
        emp
    GROUP BY department_id
), full_dep_agg as (
    SELECT 
        count(*) as no_of_emp,
        sum(salary) as total_salary
    FROM    
        emp
)

SELECT
    department_id,
     dept_avg_salary,
    (total_salary - dept_salary) / (no_of_emp - dept_cnt) as cmpny_avg_salary
FROM
    each_dep_agg
    CROSS JOIN
    full_dep_agg
WHERE dept_avg_salary < ((total_salary - dept_salary) / (no_of_emp - dept_cnt)) ;

