-- Active: 1690646653992@@127.0.0.1@3306@SQL43

-- https://youtu.be/8glk10JlvKE

SELECT
    e.emp_name as `Employee Name`, 
    m.emp_name as `Manager Name`,
    sm.emp_name as `Senior Manager Name`,
    e.salary as 'Employee Salary',
    m.salary as 'Manager Salary',
    sm.salary as 'Senior Manager Salary'
FROM
    employee e
        LEFT JOIN
    employee m on e.manager_id = m.emp_id
        LEFT JOIN
    employee sm on  m.manager_id = sm.emp_id 
;

