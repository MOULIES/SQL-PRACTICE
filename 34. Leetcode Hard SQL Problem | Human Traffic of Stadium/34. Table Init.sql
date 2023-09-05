

DROP DATABASE IF EXISTS SQL34;

CREATE DATABASE IF NOT EXISTS SQL34;

USE SQL34;

DROP TABLE IF EXISTS Stadium;

create table Stadium (
id int,
visit_date date,
people int
);

delete from Stadium;

insert into Stadium
values (1,'2017-07-01',10)
,(2,'2017-07-02',109)
,(3,'2017-07-03',150)
,(4,'2017-07-04',99)
,(5,'2017-07-05',145)
,(6,'2017-07-06',1455)
,(7,'2017-07-07',199)
,(8,'2017-07-08',188);



