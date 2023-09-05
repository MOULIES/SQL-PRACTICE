-- Write a query to idenify users whose first booking was hotel booking
-- ANS: U6

# Method 1 - row number or rank
with cte as (SELECT
    *,
    row_number() over (PARTITION BY `User_id` order by `Booking_date`) as rno
FROM
    booking_table)
SELECT
    *
FROM
    cte
where rno = 1 and `Line_of_business` = 'Hotel';


with cte as (SELECT
    *,
    FIRST_VALUE(`Line_of_business`) over (PARTITION BY `User_id` order by `Booking_date`) as first_booking
FROM
    booking_table)
SELECT
    DISTINCT `User_id`
FROM
    cte
where `first_booking` = 'Hotel';
