-- Active: 1690646653992@@127.0.0.1@3306@SQL19

/*
    Question 2: find total active users each week
    week_number   total_active_users
    1             3
    2             5
*/
SELECT
    week(event_date) + 1,
    count(distinct user_id) as total_active_users
FROM
    activity
GROUP BY  week(event_date) + 1
ORDER BY 1;

