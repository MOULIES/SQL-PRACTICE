-- Active: 1690646653992@@127.0.0.1@3306@SQL22

SELECT
    student_id
FROM
    exams
WHERE
    subject in ('physics', 'chemistry')
GROUP BY student_id
having count(DISTINCT subject) = 2 and  count(DISTINCT marks) = 1 ;