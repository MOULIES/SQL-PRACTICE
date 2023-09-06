-- Active: 1690646653992@@127.0.0.1@3306@SQL27

-- Question 4:
-- For each student and test, identify if their marks increased or decreased from the previous test

SELECT
    *,
    CASE WHEN marks > prev_marks then 'inc'
         WHEN marks < prev_marks then 'decr'
         else NULL
    END as status
FROM
        (SELECT
            *,
            lag(marks, 1) over (PARTITION BY studentid ORDER BY testdate, subject) as prev_marks
        FROM
            students) A;

