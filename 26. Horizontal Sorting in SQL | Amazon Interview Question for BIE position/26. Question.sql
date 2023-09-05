
/*
        AMAZON SQL INTERVIEW QUESTION FOR BIE POSITION
        Find total no of messages exchanged between each person per day
*/

DROP DATABASE IF EXISTS SQL26;

CREATE DATABASE IF NOT EXISTS SQL26;

USE SQL26;

DROP TABLE IF EXISTS subscriber;

CREATE TABLE subscriber (
 sms_date date ,
 sender varchar(20) ,
 receiver varchar(20) ,
 sms_no int
);

INSERT INTO subscriber 
VALUES 
('2020-4-1', 'Avinash', 'Vibhor',10),
('2020-4-1', 'Vibhor', 'Avinash',20),
('2020-4-1', 'Avinash', 'Pawan',30),
('2020-4-1', 'Pawan', 'Avinash',20),
('2020-4-1', 'Vibhor', 'Pawan',5),
('2020-4-1', 'Pawan', 'Vibhor',8),
('2020-4-1', 'Vibhor', 'Deepak',50);

SELECT * FROM subscriber;