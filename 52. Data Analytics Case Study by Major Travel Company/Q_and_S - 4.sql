-- Active: 1690646653992@@127.0.0.1@3306@SQL52
-- Q4 - Write a query to count the number of flight and hotel bookings
-- in each of the user segments for the year 2022
-- answer
-- segment flight_bookings hotel_bookings
-- s1       8               4
-- s2       3               3
-- s3       1               1


SELECT
    segment,
    sum(case when `Line_of_business` = 'Flight' then 1 else 0 end) as flight_bookings,
    sum(case when `Line_of_business` = 'Hotel' then 1 else 0 end) as hotel_bookings
FROM
    booking_table b 
        INNER JOIN
    user_table u on b.`User_id` = u.user_id
where year(`Booking_date`) = 2022
GROUP BY segment;