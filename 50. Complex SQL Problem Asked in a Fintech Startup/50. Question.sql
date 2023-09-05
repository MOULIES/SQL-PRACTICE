
-- Write SQL to find all couples of trade for same stock that happened in the range of 10 seconds
-- and having price difference by more than 10%
-- Output result should also list the percentage of price difference between the 2 trade


DROP DATABASE IF EXISTS SQL50;

CREATE DATABASE IF NOT EXISTS SQL50;

USE SQL50;

DROP TABLE IF EXISTS Trade_tbl;

Create Table Trade_tbl(
TRADE_ID varchar(20),
Trade_Timestamp time,
Trade_Stock varchar(20),
Quantity int,
Price Float
);

Insert into Trade_tbl 
Values('TRADE1','10:01:05','ITJunction4All',100,20),
 ('TRADE2','10:01:06','ITJunction4All',20,15),
 ('TRADE3','10:01:08','ITJunction4All',150,30),
 ('TRADE4','10:01:09','ITJunction4All',300,32),
 ('TRADE5','10:10:00','ITJunction4All',-100,19),
 ('TRADE6','10:10:01','ITJunction4All',-300,19),
 ('TRADE1','10:10:00','Infosys',-100,19),
 ('TRADE2','10:10:01','Infosys',-300,19),
 ('TRADE3','10:01:05','Infosys',100, 20),
 ('TRADE4','10:01:06','Infosys',20,15);

 SELECT * FROM Trade_tbl;