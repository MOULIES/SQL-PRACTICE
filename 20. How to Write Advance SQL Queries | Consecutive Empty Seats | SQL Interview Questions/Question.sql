-- Active: 1690646653992@@127.0.0.1@3306

-- Question:
-- Find 3 or more consecutive empty seats

-- This question is related to SQL34

DROP DATABASE IF EXISTS SQL20;

CREATE DATABASE IF NOT EXISTS SQL20;

USE SQL20;

create table bms (seat_no int ,is_empty varchar(10));

DELETE from bms;

insert into bms values
(1,'N')
,(2,'Y')
,(3,'N')
,(4,'Y')
,(5,'Y')
,(6,'Y')
,(7,'N')
,(8,'Y')
,(9,'Y')
,(10,'Y')
,(11,'Y')
,(12,'N')
,(13,'Y')
,(14,'Y');

select * from bms;
