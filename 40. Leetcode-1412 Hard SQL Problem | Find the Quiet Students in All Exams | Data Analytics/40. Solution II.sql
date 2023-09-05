-- Active: 1690646653992@@127.0.0.1@3306@SQL40


with min_max_cte as (
    select
        exam_id,
        student_id,
        max(score) over (partition by exam_id) as max_score,
        min(score) over (partition by exam_id) as min_score,
        case when score = max(score) over (partition by exam_id) then 1
            when score = min(score) over (partition by exam_id) then 1
            else 0 end as flag
    from
        exam
),
non_quiet_cte as (
    select 
        distinct student_id
    from
        min_max_cte
    where
        flag = 1
)
select
    distinct s.student_id,
    s.student_name
from
    student s 
        inner join
    exam e on s.student_id = e.student_id
        left join
    non_quiet_cte qc on qc.student_id = s.student_id
where qc.student_id is null;