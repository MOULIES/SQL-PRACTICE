-- Active: 1690646653992@@127.0.0.1@3306
DROP DATABASE IF EXISTS SQL56;

CREATE DATABASE IF NOT EXISTS SQL56;

USE SQL56;

DROP TABLE IF EXISTS candidates;

Create table candidates(
    id int primary key,
    positions varchar(10) not null,
    salary int not null
);

-- Test case 1
delete from candidates;
insert into candidates values
(1,'junior',5000),
(2,'junior',7000),
(3,'junior',7000),
(4,'senior',10000),
(5,'senior',30000),
(6,'senior',20000);

-- Test case 2
delete from candidates;
insert into candidates values(20,'junior',10000);
insert into candidates values(30,'senior',15000);
insert into candidates values(40,'senior',30000);


-- Test case 3
delete from candidates;
insert into candidates values(1,'junior',15000);
insert into candidates values(2,'junior',15000);
insert into candidates values(3,'junior',20000);
insert into candidates values(4,'senior',60000);

-- Test case 4
delete from candidates;
insert into candidates values(10,'junior',10000);
insert into candidates values(40,'junior',10000);
insert into candidates values(20,'senior',15000);
insert into candidates values(30,'senior',30000);
insert into candidates values(50,'senior',15000);

SELECT * FROM candidates;