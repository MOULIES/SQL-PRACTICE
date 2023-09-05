-- Active: 1690646653992@@127.0.0.1@3306@SQL55_1


WITH cte as (
Select e2.employeeid, e2.isdefault,e2.phone_number,e2.added_on
, COUNT(entry_details)  as totalentry
, COUNT(CASE WHEN entry_details = 'login' THEN timestamp_details END)  as totallogin
, COUNT(CASE WHEN entry_details = 'logout' THEN timestamp_details END) as totallogout
, MAX(CASE WHEN entry_details = 'login' THEN timestamp_details END) as latestlogin
, MAX(CASE WHEN entry_details = 'logout' THEN timestamp_details END) as latestlogout
, DENSE_RANK() over(PARTITION BY e2.employeeid ORDER BY isdefault DESC, e2.added_on DESC) as RNK
from employee_checkin_details as e1 LEFT JOIN employee_details as e2
on e1.employeeid = e2.employeeid 
group by  e2.employeeid,e2.isdefault,e2.phone_number,e2.added_on )
select 
    *
from 
    cte
where RNK = 1;
