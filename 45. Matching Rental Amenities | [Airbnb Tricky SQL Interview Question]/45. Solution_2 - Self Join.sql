-- Active: 1690646653992@@127.0.0.1@3306@SQL45

-- https://youtu.be/5O4Tx72-CKU

with cte as (SELECT
    rental_id,
    GROUP_CONCAT(amenity ORDER BY amenity) as amenity_list
FROM
    rental_amenities
GROUP BY rental_id)

SELECT
    count(*) as matching_airbnb
FROM
    cte c1
        INNER JOIN
    cte c2 on c1.rental_id < c2.rental_id and c1.amenity_list = c2.amenity_list;