-- Active: 1690646653992@@127.0.0.1@3306@SQL47

-- https://youtu.be/eayyD51fIVY

with rides as (
    SELECT
        *,
        ROW_NUMBER() over (PARTITION BY id ORDER BY start_time) as rn
    FROM
        drivers
)
SELECT
    r1.id,
    count(1) as total_rides,
    count(r2.id) as profit_rides
FROM
    rides r1 
        left join 
    rides r2 on r1.id = r2.id and r1.rn + 1 = r2.rn and r1.end_loc = r2.start_loc
GROUP BY r1.id;