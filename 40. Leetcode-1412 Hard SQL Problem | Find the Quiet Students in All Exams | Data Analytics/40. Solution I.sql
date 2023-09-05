-- Active: 1690646653992@@127.0.0.1@3306@SQL40

WITH all_scores as (
    SELECT
        exam_id,
        min(score) as min_score,
        max(score) as max_score
    FROM
        exam
    GROUP BY exam_id
)
SELECT
    s.student_id,
    max(s.student_name)
FROM
    exam e join all_scores a on e.exam_id = a.exam_id
    join student s on e.student_id = s.student_id
GROUP BY s.student_id
having max(case when score = min_score or score = max_score then 1 else 0 end) = 0;