-- Active: 1690646653992@@127.0.0.1@3306@SQL55
-- mentos zindaagi(Mentos Life)


SELECT
    a.employeeid, 
    c.phone_number,
    count(*) as totalentry,
    count(CASE WHEN entry_details = 'login' THEN timestamp_details ELSE null END) as totallogins,
    count(CASE WHEN entry_details = 'logout' THEN timestamp_details END) as totallogouts,
    max(CASE WHEN entry_details = 'login' THEN timestamp_details ELSE null END) as latestlogin,
    max(CASE WHEN entry_details = 'logout' THEN timestamp_details END) as latestlogout
FROM
    employee_checkin_details a 
    LEFT JOIN
    employee_details c on a.employeeid = c.employeeid and c.isdefault = 'True'
GROUP BY
    a.employeeid, c.phone_number;