-- Active: 1690646653992@@127.0.0.1@3306@SQL27

-- Question 1:
-- Write an SQL query to get the list of students who scored above the average marks in each subject

with avg_cte as (
    SELECT
        subject,
        avg(marks) as avg_marks
    FROM
        students
    GROUP BY subject
)
SELECT
    s.*,
    ac.*
FROM
    students s 
        JOIN
    avg_cte ac on s.subject = ac.subject
WHERE
    s.marks > ac.avg_marks;
