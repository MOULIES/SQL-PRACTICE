-- Active: 1690646653992@@127.0.0.1@3306@SQL22

SELECT
    student_id,
    sum(case when subject = 'physics' then marks end) as Physics,
    sum(case when subject = 'Chemistry' then marks end) as Chemistry
FROM
    exams
GROUP BY student_id
having sum(case when subject = 'physics' then marks end) = sum(case when subject = 'Chemistry' then marks end);
