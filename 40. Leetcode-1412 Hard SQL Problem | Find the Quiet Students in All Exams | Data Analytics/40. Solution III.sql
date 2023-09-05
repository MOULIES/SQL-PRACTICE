-- Active: 1690646653992@@127.0.0.1@3306@SQL40


with t1 as (
    SELECT
        exam_id, 
        min(score) as least_score,
        max(score) as top_score
    FROM
        exam
    group by exam_id
),
top_or_least_score as (
    SELECT
        distinct e.student_id
    FROM
        t1
        join exam e 
        on t1.exam_id = e.exam_id 
        and (score = least_score 
        or score = top_score)
)
SELECT
    distinct s.student_id,
    s.student_name
FROM
    student s 
        join
    exam e 
    on e.student_id = s.student_id
where s.student_id not in (select distinct student_id from top_or_least_score);

-- SELECT
--     s.student_id,
--     s.student_name
-- FROM
--     student s left join
--     t2
--     on t2.student_id = s.student_id
-- where t2.student_id is null and s.student_id in (select distinct student_id from exam);