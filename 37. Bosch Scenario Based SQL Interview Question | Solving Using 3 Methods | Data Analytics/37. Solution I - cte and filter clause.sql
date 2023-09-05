-- Active: 1690646653992@@127.0.0.1@3306@SQL37

with cte as (
    SELECT
        call_number,
        sum(CASE 
            WHEN call_type = 'OUT' THEN call_duration
            ELSE  NULL 
        END) as out_duration,
        sum(CASE 
            WHEN call_type = 'INC' THEN call_duration
            ELSE  Null
        END) as inc_duration
    From
        call_details
    GROUP BY call_number
)
SELECT
    call_number,
    out_duration,
    inc_duration
FROM
    cte 
WHERE
    out_duration is not null and inc_duration is not null and out_duration > inc_duration;