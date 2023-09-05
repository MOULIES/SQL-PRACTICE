-- Active: 1690646653992@@127.0.0.1@3306@SQL54
USE SQL54;

WITH dept_agg as (
    SELECT
        department_id,
        count(*) as no_of_emp,
        sum(salary) as total_salary,
        avg(salary) as dept_avg_salary
    FROM
        emp
    group by department_id
)

-- SELECT
--     e1.department_id, 
--     e1.dept_avg_salary, 
--     sum(e2.no_of_emp) as no_of_emp,
--     sum(e2.total_salary) as total_salary,
--     (sum(e2.total_salary) / sum(e2.no_of_emp)) as cmp_avg_salary
-- FROM
--     dept_agg e1
--         INNER JOIN
--     dept_agg e2 on e1.department_id != e2.department_id
-- GROUP BY e1.department_id, dept_avg_salary
-- having e1.dept_avg_salary < cmp_avg_salary
-- ORDER BY e1.department_id;

SELECT 
    * 
FROM
    (
        SELECT
            e1.department_id, 
            e1.dept_avg_salary, 
            sum(e2.no_of_emp) as no_of_emp,
            sum(e2.total_salary) as total_salary,
            (sum(e2.total_salary) / sum(e2.no_of_emp)) as cmp_avg_salary
        FROM
            dept_agg e1
                INNER JOIN
            dept_agg e2 on e1.department_id != e2.department_id
        GROUP BY e1.department_id, dept_avg_salary
    ) A
WHERE dept_avg_salary < cmp_avg_salary;