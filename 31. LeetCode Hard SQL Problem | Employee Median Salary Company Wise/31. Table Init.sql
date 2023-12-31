-- Active: 1690646653992@@127.0.0.1@3306
DROP DATABASE IF EXISTS SQL31;

CREATE DATABASE IF NOT EXISTS SQL31;

USE SQL31;

DROP TABLE IF EXISTS employee;

create table employee 
(
emp_id int,
company varchar(10),
salary int
);

DELETE FROM employee;

insert into employee 
values (1,'A',2341),
(2,'A',341),
(3,'A',15),
(4,'A',15314),
(5,'A',451),
(6,'A',513),
(7,'B',15),
(8,'B',13),
(9,'B',1154),
(10,'B',1345),
(11,'B',1221),
(12,'B',234),
(13,'C',2345),
(14,'C',2645),
(15,'C',2645),
(16,'C',2652),
(17,'C',65);

SELECT * FROM employee;