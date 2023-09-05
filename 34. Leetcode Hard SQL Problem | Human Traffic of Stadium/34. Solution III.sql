-- Active: 1690646653992@@127.0.0.1@3306@SQL34

with grp_cte as (
        select
            id , 
            visit_date, 
            people, 
            id - row_number() over(ORDER BY visit_date) as grp
        from
            Stadium
        where people >= 100
    )
select 
    id , visit_date, people
from 
    grp_cte
WHERE
    grp in  (select 
        grp
    from 
        grp_cte
    group by grp 
    having count(*) >= 3) 
ORDER BY visit_date ;