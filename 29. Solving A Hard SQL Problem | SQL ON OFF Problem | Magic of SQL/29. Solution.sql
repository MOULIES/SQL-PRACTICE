-- Active: 1690646653992@@127.0.0.1@3306@SQL29
with cte as (
    SELECT
        *,
        sum(case 
                when status = 'on' and prev_status = 'off' THEN 1 
                else 0 
            end) over (ORDER BY event_time asc) as grp_key
    FROM
        (SELECT
            *,
            lag(status, 1, status) over (ORDER BY event_time asc) as prev_status
        FROM
            event_status) a
)
SELECT
    min(event_time) as login, 
    max(event_time) as logout,
    count(*) - 1 as on_count
FROM
    cte
GROUP BY grp_key;