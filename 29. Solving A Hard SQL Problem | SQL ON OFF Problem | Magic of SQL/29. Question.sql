-- Active: 1690646653992@@127.0.0.1@3306@SQL29


/*
    Given the input table. Print the results per output table
*/
DROP DATABASE IF EXISTS SQL29;

CREATE DATABASE IF NOT EXISTS SQL29;

USE SQL29;

DROP TABLE IF EXISTS event_status;


create table event_status
(
event_time varchar(10),
status varchar(10)
);

insert into event_status 
values
('10:01','on'),
('10:02','on'),
('10:03','on'),
('10:04','off'),
('10:07','on'),
('10:08','on'),
('10:09','off'),
('10:11','on'),
('10:12','off');

-- Output table:
-- login logout on_count
-- 10:01 10:04  3
-- 10:07 10:09  2
-- 10:11 10:12  1