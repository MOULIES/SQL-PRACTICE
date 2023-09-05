-- Write a sql query to find users who purchased different products on different dates
-- ie: products purchased on any given day are not repeated on any other day

DROP DATABASE IF EXISTS SQL48;

CREATE DATABASE IF NOT EXISTS SQL48;

USE SQL48;

DROP TABLE IF EXISTS purchase_history;

create table purchase_history
(userid int
,productid int
,purchasedate date
);

-- SET DATEFORMAT "%d-%M-%y";

insert into purchase_history values
(1,1,'2012-01-23')
,(1,2,'2012-01-23')
,(1,3,'2012-01-25')
,(2,1,'2012-01-23')
,(2,2,'2012-01-23')
,(2,2,'2012-01-25')
,(2,4,'2012-01-25')
,(3,4,'2012-01-23')
,(3,1,'2012-01-23')
,(4,1,'2012-01-23')
,(4,2,'2012-01-25')
;