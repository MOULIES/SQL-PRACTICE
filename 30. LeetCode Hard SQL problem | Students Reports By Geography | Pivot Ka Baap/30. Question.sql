-- Active: 1690646653992@@127.0.0.1@3306@SQL30

DROP DATABASE IF EXISTS SQL30;

CREATE DATABASE IF NOT EXISTS SQL30;

USE SQL30;

DROP TABLE IF EXISTS Student;


create table Student
(
 name varchar(20),
continent varchar(20)
);

delete from Student;

insert into Student
values 
('Jack','America'),
('Pascal','Europe') , 
('Xi','Asia'),
('Jane','America'),
('Dhoni','Asia');

SELECT * FROM Student;