-- Active: 1690646653992@@127.0.0.1@3306@SQL19
/*
    Question 3: 
    date wise find total of users who made the purchase same day they installed the app
    event_date   no_of_users_same_day_purchase
    2022-01-01   0
    2022-01-02   0
    2022-01-03   2
    2022-01-04   1
*/

SELECT
    event_date,
    count(new_user) as no_of_users_same_day_purchase
FROM
    (SELECT
        user_id,
        event_date,
        case when count(DISTINCT event_name) = 2 then user_id 
            else null end as new_user
    FROM
        activity
    GROUP BY
        user_id, event_date) a 
GROUP BY event_date;