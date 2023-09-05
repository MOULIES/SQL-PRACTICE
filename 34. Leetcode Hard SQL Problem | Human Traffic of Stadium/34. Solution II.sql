-- Active: 1690646653992@@127.0.0.1@3306@SQL34

with t1 as (
        select
            id , visit_date, people, id - row_number() over() as row_num
        from
            Stadium
        where people >= 100
    ),
    b as (select 
        row_num
    from 
        t1 
    group by row_num 
    having count(*) >= 3) 
select 
    a.id , a.visit_date, a.people
from 
    t1 as a
    join
    b
on a.row_num = b.row_num
order by 2;