-- Active: 1690646653992@@127.0.0.1@3306

-- Write a query to print total rides and profit rides for each driver
-- Profit ride is when the end location of current ride is same as start location of next ride

DROP DATABASE IF EXISTS SQL47;

CREATE DATABASE IF NOT EXISTS SQL47;

USE SQL47;

DROP TABLE IF EXISTS drivers;

create table drivers(id varchar(10), start_time time, end_time time, start_loc varchar(10), end_loc varchar(10));
insert into drivers 
values('dri_1', '09:00', '09:30', 'a','b'),
('dri_1', '09:30', '10:30', 'b','c'),
('dri_1','11:00','11:30', 'd','e'),
('dri_1', '12:00', '12:30', 'f','g'),
('dri_1', '13:30', '14:30', 'c','h'),
('dri_2', '12:15', '12:30', 'f','g'),('dri_2', '13:30', '14:30', 'c','h');