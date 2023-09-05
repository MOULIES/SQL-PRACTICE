
-- https://youtu.be/XsbqEx_3GiM
-- Write a sql query that gives the below output
-- Output: Summary at Segment Level
-- Segment	Total_user_count	User_who_booked_flight_in_apr2022
-- s1	    3	                2
-- s2	    2	                2
-- s3	    5	                1

SELECT
    u.`Segment`,
    COUNT(DISTINCT u.user_id) as Total_user_count,
    COUNT(DISTINCT CASE 
        WHEN b.`Line_of_business`='Flight' AND b.`Booking_date` BETWEEN '2022-04-01' and '2022-04-30' THEN  b.user_id
    END) as User_who_booked_flight_in_apr2022
FROM
    booking_table b
    RIGHT JOIN
    user_table u on u.`User_id` = b.`User_id`
GROUP BY u.`Segment`;