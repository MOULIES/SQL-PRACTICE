-- Active: 1690646653992@@127.0.0.1@3306

/*
A company wants to hire new employees. The budget of the company for the salaries is $70000.
The company's criteria for hiring are:
- Keep hiring the senior with the smallest salary until you cannot hire any more seniors.
- Use the remaining budget to hire the junior with the smallest salary
- Keep hiring the junior with the smallest salary until you cannot hire any more seniors.
- Write an sql query to find the seniors and juniors hired under mentioned criteria
*/

-- https://youtu.be/KLqRHJ-Eg2s

-- Follow up question video 56

DROP DATABASE IF EXISTS SQL42;

CREATE DATABASE IF NOT EXISTS SQL42;

USE SQL42;

DROP TABLE IF EXISTS candidates;

create table candidates (
emp_id int,
experience varchar(20),
salary int
);
delete from candidates;
insert into candidates values
(1,'Junior',10000),
(2,'Junior',15000),
(3,'Junior',40000),
(4,'Senior',16000),
(5,'Senior',20000),
(6,'Senior',50000);

SELECT * FROM candidates;