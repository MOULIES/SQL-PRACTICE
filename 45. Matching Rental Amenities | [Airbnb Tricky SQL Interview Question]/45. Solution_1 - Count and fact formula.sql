-- Active: 1690646653992@@127.0.0.1@3306@SQL45

-- https://youtu.be/5O4Tx72-CKU

with cte as (SELECT
    rental_id,
    GROUP_CONCAT(amenity ORDER BY amenity) as amenity_list
FROM
    rental_amenities
GROUP BY rental_id),
    amenity_cnt as (   
        SELECT
            amenity_list, count(rental_id) as cnt
        FROM
            cte
        GROUP BY amenity_list
        having count(rental_id) > 1
    )
SELECT
    floor(sum((cnt * (cnt - 1) / 2)) )  as matching_airbnb
FROM
    amenity_cnt;
    