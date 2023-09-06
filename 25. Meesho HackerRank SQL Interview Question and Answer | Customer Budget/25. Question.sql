-- Active: 1690646653992@@127.0.0.1@3306@SQL27

-- MEESHO HACKERRANK ONLINE SQL TEST
-- find how many products falls into customer budget along with list of products
-- In case of clash, choose less costly product

-- Expected o/p:
-- cutomer_id  budget  no_of_products  list_of_products
-- 100         400     1               p1
-- 200         800     2               p1, p2
-- 300         1500    3               p1, p2, p3


DROP DATABASE IF EXISTS SQL25;

CREATE DATABASE IF NOT EXISTS SQL25;

USE SQL25;

create table products
(
product_id varchar(20) ,
cost int
);

insert into products values 
('P1',200),
('P2',300),
('P3',500),
('P4',800);

create table customer_budget
(
customer_id int,
budget int
);

insert into customer_budget values 
(100,400),
(200,800),
(300,1500);

SELECT * from customer_budget;

SELECT * from products;
