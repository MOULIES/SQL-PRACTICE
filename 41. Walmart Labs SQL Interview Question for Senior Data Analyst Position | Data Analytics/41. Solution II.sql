-- Active: 1690646653992@@127.0.0.1@3306@SQL41
# Method 1: first_value 
WITH cte as (
    SELECT
         *,
        cast(Datecalled as date) as dated,
        FIRST_VALUE(Recipientid) over w as first_recipient,
        case when FIRST_VALUE(Recipientid) over w 
        = FIRST_VALUE(Recipientid) over w1 then 1 else 0 end as flg
    FROM 
        phonelog
Window w as (partition by Callerid,cast(Datecalled as date) order by Datecalled asc),
      w1 as (partition by Callerid,cast(Datecalled as date) order by Datecalled desc)
)
SELECT
    distinct callerid,
    dated,
    first_recipient
FROM
    cte
where flg = 1;


# Method 2: first_value and LAST_VALUE -> window definition is important
-- UNBOUNDED PRECEDING and UNBOUNDED FOLLOWING
WITH cte as (
    SELECT
         *,
        cast(Datecalled as date) as dated,
        FIRST_VALUE(Recipientid) over w as first_recipient,
        case when FIRST_VALUE(Recipientid) over w 
        = LAST_VALUE(Recipientid) over w then 1 else 0 end as flg
    FROM 
        phonelog
Window w as (partition by Callerid,cast(Datecalled as date) order by Datecalled asc rows between unbounded PRECEDING and UNBOUNDED FOLLOWING)
)
SELECT
    distinct callerid,
    dated,
    first_recipient
FROM
    cte
where flg = 1;