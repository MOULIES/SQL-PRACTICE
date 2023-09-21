-- Active: 1690646653992@@127.0.0.1@3306@SQL19

/*
    Question 5: 
    Among all the users who installed the app on a given day, how many did in
    app purchase on the very next day -- day wise result


    event_date   cnt_users
    2022-01-01   0
    2022-01-02   1
    2022-01-03   0
    2022-01-04   0
*/

-- ANKIT
with prev_data as (
    SELECT
        *,
        lag(event_name, 1) over (PARTITION BY user_id ORDER BY event_date) as prev_event_name,
        lag(event_date, 1) over (PARTITION BY user_id ORDER BY event_date) as prev_event_date
    FROM
        activity
)
SELECT
    event_date,
    count( DISTINCT 
                CASE WHEN event_name = 'app-purchase' and prev_event_name = 'app-installed'
                        and datediff(event_date, prev_event_date) = 1
                        then user_id
                    ELSE NULL
                END  
        ) AS cnt_users
FROM
    prev_data
GROUP BY event_date;






--  own
SELECT
    a.event_date,
    count(distinct b.user_id)
FROM
    activity a 
    left JOIN
    activity b on a.user_id = b.user_id and 
                 (a.event_date - 1) = b.event_date and 
                 a.event_name = 'app-purchase' and 
                 b.event_name = 'app-installed'
GROUP BY
    a.event_date;