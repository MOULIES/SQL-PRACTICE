-- Active: 1690646653992@@127.0.0.1@3306
DROP DATABASE IF EXISTS SQL46;

CREATE DATABASE IF NOT EXISTS SQL46;

USE SQL46;

DROP TABLE IF EXISTS tbl_orders;

create table tbl_orders (
order_id integer,
order_date date
);

create table tbl_orders_copy (
order_id integer,
order_date date
);

insert into tbl_orders
values (1,'2022-10-21'),(2,'2022-10-22'),
(3,'2022-10-25'),(4,'2022-10-25');

INSERT INTO tbl_orders_copy 
SELECT * from  tbl_orders;


insert into tbl_orders
values (5,'2022-10-26'),(6,'2022-10-26');
delete from tbl_orders where order_id=1;

select * from tbl_orders;
