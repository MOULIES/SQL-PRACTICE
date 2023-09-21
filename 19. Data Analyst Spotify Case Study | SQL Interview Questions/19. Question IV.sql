-- Active: 1690646653992@@127.0.0.1@3306@SQL19

/*
    Question 4: Percentage of paid users in India, USA and any other country
    should be tagged as others.
    country  percentage_users
    India    40
    USA      20
    others   40
*/

-- Ankit solution
with country_users as (
    SELECT
        case 
            when country not in ('INDIA', 'USA') then 'others'
            else country
        end as new_country,
        count(distinct user_id) as user_count
    FROM
        activity
    WHERE
        event_name = 'app-purchase'
    GROUP BY
        (case 
            when country not in ('INDIA', 'USA') then 'others'
            else country
        end)
), total as (
    SELECT sum(user_count) as total_users from country_users
)
SELECT
    new_country as country,
    (user_count * 1.0/ total_users) * 100 as percentage_users
FROM
    country_users, total;





-- own solution
WITH CTE AS (
    SELECT
        *,
        case when country not in ('INDIA', 'USA') then 'others'
        else country
        end as new_country,
        count(*) over() as total_users
    FROM
        activity
    WHERE
        event_name = 'app-purchase'
)
SELECT
    new_country as country,
    (count(*) * 1.0/ max(total_users)) * 100 as percentage_users
FROM
    CTE
GROUP BY
    new_country;