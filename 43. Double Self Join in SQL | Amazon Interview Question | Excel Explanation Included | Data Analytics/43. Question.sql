
-- Write a sql to list emp name along with their manager and senior manager name 
-- Note: Senior manager is manager's manager

-- Follow up question:
-- Employer salary greater than senior manager salary
-- manager salary greater than senior manager salary

DROP DATABASE IF EXISTS SQL43;

CREATE DATABASE IF NOT EXISTS SQL43;

USE SQL43;

DROP TABLE IF EXISTS employee;

create table employee(
emp_id int,
emp_name varchar(20),
department_id int,
salary int,
manager_id int,
emp_age int);

insert into employee
values
(1, 'Ankit', 100,10000, 4, 39),
(2, 'Mohit', 100, 15000, 5, 48),
(3, 'Vikas', 100, 12000,4,37),
(4, 'Rohit', 100, 14000, 2, 16),
(5, 'Mudit', 200, 20000, 6,55),
(6, 'Agam', 200, 12000,2, 14),
(7, 'Sanjay', 200, 9000, 2,13),
(8, 'Ashish', 200,5000,2,12),
(9, 'Mukesh',300,6000,6,51),
(10, 'Rakesh',500,7000,6,50);

SELECT * FROM employee;