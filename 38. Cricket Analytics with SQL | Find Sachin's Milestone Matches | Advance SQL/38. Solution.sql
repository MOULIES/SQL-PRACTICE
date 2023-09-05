-- Active: 1690646653992@@127.0.0.1@3306@SQL38


SELECT * FROM sachin_score;

WITH cte1 as (
    select 
        `match`, 
        innings, 
        runs,
        sum(runs) over (ORDER BY `match` rows BETWEEN UNBOUNDED PRECEDING and current row) as rolling_sum
    FROM
        sachin_score
),
cte2 as (
    select 1 as milestone_number, 1000 as milestone_runs
    union ALL
    select 2 as milestone_number, 5000 as milestone_runs
    union ALL
    select 3 as milestone_number, 10000 as milestone_runs
    union ALL
    select 4 as milestone_number, 15000 as milestone_runs
)
SELECT 
    milestone_number, 
    milestone_runs,
    min(`match`) as milestone_match,
    min(innings) as milestone_innings
FROM
    cte1 join cte2 on cte1.rolling_sum > cte2.milestone_runs
GROUP BY milestone_number, milestone_runs
ORDER BY milestone_number, milestone_runs;