-- Active: 1690646653992@@127.0.0.1@3306@SQL19

/*
    Question 1: find total active users each day
    event_date   total_active_users
    2022-01-01   3
    2022-01-02   1
    2022-01-03   3
    2022-01-04   1
*/

SELECT
    event_date,
    count(distinct user_id) as total_active_users
FROM
    activity
GROUP BY  event_date
ORDER BY event_date;