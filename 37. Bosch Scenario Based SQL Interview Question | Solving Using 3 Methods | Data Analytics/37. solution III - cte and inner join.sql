-- Active: 1690646653992@@127.0.0.1@3306@SQL37

-- using cte and inner JOIN
with cte_out as (
    SELECT
        call_number,
        sum( call_duration) as out_duration
    From
        call_details
    WHERE call_type = 'OUT'
    GROUP BY call_number
), cte_in as (
    SELECT
        call_number,
        sum(call_duration) as inc_duration
    From
        call_details
    WHERE call_type = 'INC'
    GROUP BY call_number
)
SELECT
    cte_out.call_number
FROM
    cte_out join cte_in using (call_number) 
WHERE out_duration > inc_duration;