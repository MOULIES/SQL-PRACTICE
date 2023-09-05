-- Active: 1690646653992@@127.0.0.1@3306@SQL55

use sql55;

# aam zindaagi(Normal Life)

with logins as (
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
    c.phone_number,
    c.isdefault
FROM 
    logins a 
    INNER JOIN 
    logouts b on a.employeeid = b.employeeid
    LEFT JOIN employee_details c on a.employeeid = c.employeeid and c.isdefault = 'true';