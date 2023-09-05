-- Active: 1690646653992@@127.0.0.1@3306@SQL55_1


use sql55_1;

-- # aam zindaagi(Normal Life)

with phones as (
    SELECT * FROM
    (
        SELECT 
            *,
            ROW_NUMBER() OVER (PARTITION BY employeeid ORDER BY added_on desc) as rnk
        FROM
            employee_details
        WHERE 
            isdefault = 'False'
    ) a1
    WHERE rnk = 1
),logins as (
    SELECT
        employeeid,
        count(*) as totallogin,
        max(timestamp_details) as latestlogin
    FROM  
        employee_checkin_details
    WHERE
        entry_details = 'login'
    GROUP BY employeeid
), logouts as (
    SELECT
        employeeid,
        count(*) as totallogout,
        max(timestamp_details) as latestlogout
    FROM  
        employee_checkin_details
    WHERE
        entry_details = 'logout'
    GROUP BY employeeid
)
SELECT
    a.employeeid,
    a.totallogin,
    a.latestlogin,
    b.totallogout,
    b.latestlogout,
    a.totallogin + b.totallogout as totalentry,
    -- c.phone_number as default_phoneno,
    --  d.phone_number as nondefault_phoneno,
    coalesce(c.phone_number, d.phone_number) as final_phone_number,
    c.isdefault
FROM 
    logins a 
    INNER JOIN 
    logouts b on a.employeeid = b.employeeid
    LEFT JOIN employee_details c on a.employeeid = c.employeeid and c.isdefault = 'true'
    LEFT JOIN phones d on a.employeeid = d.employeeid;
