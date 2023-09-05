-- Active: 1690646653992@@127.0.0.1@3306@SQL53
USE SQL53;

with cte as (
  select 
    *, 
    ROW_NUMBER() over(
      ORDER BY 
        hall_id, 
        start_date
    ) as event_id 
  from 
    HallEvents
), 
rcte as (
  select 
    hall_id, 
    start_date, 
    end_date, 
    event_id, 
    1 as Flag 
  from 
    cte 
  where 
    event_id = 1 
  UNION ALL 
  select 
    cte.hall_id, 
    cte.start_date, 
    cte.end_date, 
    cte.event_id, 
    case when rcte.hall_id = cte.hall_id 
    and (
      cte.start_date between rcte.start_date 
      and rcte.end_date 
      or rcte.start_date between cte.start_date 
      and cte.end_date
    ) then 0 else 1 end + Flag as Flag 
  from 
    rcte 
    inner join cte on rcte.event_id + 1 = cte.event_id
) 
SELECT 
  hall_id, 
  min(start_date) as start_date, 
  max(end_date) as end_date 
FROM 
  `rcte` 
group by 
  hall_id, 
  flag;


