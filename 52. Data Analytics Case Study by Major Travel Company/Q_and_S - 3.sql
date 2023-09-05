-- Active: 1690646653992@@127.0.0.1@3306@SQL52

-- Question 3: Write a query to calculate the days between first and last booking of each USER
-- u1,44
-- u2,32
-- u4,34
-- u5,14
-- u6,16

SELECT
    user_id,
    datediff(max(`Booking_date`), min(`Booking_date`)) as no_of_days
FROM
    booking_table
GROUP BY user_id;