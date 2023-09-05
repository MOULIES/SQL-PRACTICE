-- Active: 1690646653992@@127.0.0.1@3306

-- https://youtu.be/eayyD51fIVY

SELECT * from drivers;


with cte as (
    SELECT
        *,
        lead(start_loc, 1) over(PARTITION BY id order by start_time) as nxt_st_loc
    FROM
        drivers)
SELECT
    id,
    count(*) as total_rides,
    sum(case when end_loc = nxt_st_loc then 1 else 0 end) as profit_rides
FROM
    cte
group by id;