-- Active: 1690646653992@@127.0.0.1@3306@SQL27

-- Q2: Write a sql query to get the percentage of students who score more than 90 in any subject amongst the students.ADD

SELECT
    (count(distinct case when marks > 90 then studentid else null end) * 100.0)/ count(DISTINCT studentid) as percentage
FROM
    students;