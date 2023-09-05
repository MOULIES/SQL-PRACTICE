DROP DATABASE IF EXISTS SQL53;

CREATE DATABASE IF NOT EXISTS SQL53;

USE SQL53;

DROP TABLE IF EXISTS HallEvents;

create table HallEvents
(
hall_id integer,
start_date date,
end_date date
);

delete from HallEvents;

insert into HallEvents 
values 
(1,'2023-01-13','2023-01-14')
,(1,'2023-01-14','2023-01-17')
,(1,'2023-01-15','2023-01-17')
,(1,'2023-01-18','2023-01-25')
,(2,'2022-12-09','2022-12-23')
,(2,'2022-12-13','2022-12-17')
,(3,'2022-12-01','2023-01-30');


SELECT * FROM HallEvents;