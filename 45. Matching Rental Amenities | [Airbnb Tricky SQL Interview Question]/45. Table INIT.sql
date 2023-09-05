-- Active: 1690646653992@@127.0.0.1@3306

DROP DATABASE IF EXISTS SQL45;

CREATE DATABASE IF NOT EXISTS SQL45;

USE SQL45;

DROP TABLE IF EXISTS rental_amenities;

CREATE TABLE rental_amenities(
    rental_id integer,
    amenity varchar(30)
);

INSERT INTO rental_amenities
values(123, 'pool'),
(123, 'kitchen'),
(234, 'hot tub'),
(234, 'fireplace'),
(345, 'kitchen'),
(345, 'pool'),
(456, 'pool');

SELECT * FROM rental_amenities;