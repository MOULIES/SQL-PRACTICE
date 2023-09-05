-- Active: 1690646653992@@127.0.0.1@3306

DROP DATABASE IF EXISTS SQL40;

CREATE DATABASE IF NOT EXISTS SQL40;

USE SQL40;

DROP TABLE IF EXISTS student, exam;


create table student
(
student_id int,
student_name varchar(20)
);

insert into student values
(1,'Daniel'),(2,'Jade'),(3,'Stella'),(4,'Jonathan'),(5,'Will');

create table exam
(
exam_id int,
student_id int,
score int);

insert into exam values
(10,1,70),(10,2,80),(10,3,90),(20,1,80),(30,1,70),(30,3,80),(30,4,90),(40,1,60)
,(40,2,70),(40,4,80);

select * from exam;

select * from student;