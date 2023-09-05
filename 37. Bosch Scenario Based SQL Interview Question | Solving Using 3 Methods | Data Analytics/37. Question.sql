/* 
    Write a sql to determine phone numbers that satisfy below conditions:
    1- the numbers have both incoming and outgoing calls
    2- the sum of duration of outgoing calls should be greater than sum of 
    duration of incoming calls
*/

DROP DATABASE IF EXISTS SQL37;

CREATE DATABASE IF NOT EXISTS SQL37;

USE SQL37;

DROP TABLE IF EXISTS call_details;

create table call_details  (
call_type varchar(10),
call_number varchar(12),
call_duration int
);

DELETE from call_details;

insert into call_details
values ('OUT','181868',13),('OUT','2159010',8)
,('OUT','2159010',178),('SMS','4153810',1),('OUT','2159010',152),('OUT','9140152',18),('SMS','4162672',1)
,('SMS','9168204',1),('OUT','9168204',576),('INC','2159010',5),('INC','2159010',4),('SMS','2159010',1)
,('SMS','4535614',1),('OUT','181868',20),('INC','181868',54),('INC','218748',20),('INC','2159010',9)
,('INC','197432',66),('SMS','2159010',1),('SMS','4535614',1);

SELECT * FROM call_details;