-- Active: 1690646653992@@127.0.0.1@3306

-- Google SQL interview question
-- find companies who have atleast 2 users who speaks English and German both the languages

DROP DATABASE IF EXISTS SQL24;

CREATE DATABASE IF NOT EXISTS SQL24;

USE SQL24;

create table company_users 
(
company_id int,
user_id int,
language varchar(20)
);

insert into company_users values (1,1,'English')
,(1,1,'German')
,(1,2,'English')
,(1,3,'German')
,(1,3,'English')
,(1,4,'English')
,(2,5,'English')
,(2,5,'German')
,(2,5,'Spanish')
,(2,6,'German')
,(2,6,'Spanish')
,(2,7,'English');

SELECT * FROM company_users;