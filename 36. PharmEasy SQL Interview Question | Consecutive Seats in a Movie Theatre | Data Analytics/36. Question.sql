
-- there are 3 rows in a movie hall with 10 seats in each row
-- write a sql to find 4 consecutive empty seats

DROP DATABASE IF EXISTS SQL36;

CREATE DATABASE IF NOT EXISTS SQL36;

USE SQL36;

DROP TABLE IF EXISTS movie;

create table movie(
seat varchar(50),occupancy int
);
insert into movie 
values('a1',1),('a2',1),('a3',0),('a4',0),('a5',0),('a6',0),('a7',1),('a8',1),('a9',0),('a10',0),
('b1',0),('b2',0),('b3',0),('b4',1),('b5',1),('b6',1),('b7',1),('b8',0),('b9',0),('b10',0),
('c1',0),('c2',1),('c3',0),('c4',1),('c5',1),('c6',0),('c7',1),('c8',0),('c9',0),('c10',1);

SELECT * FROM movie;