
/*
    Find the largest order by value for each salesperson and display order details
    Get the result without using subquery, cte, window functions, temp tables
*/
DROP DATABASE IF EXISTS SQL28;

CREATE DATABASE IF NOT EXISTS SQL28;

USE SQL28;

DROP TABLE IF EXISTS int_orders;


CREATE TABLE SQL28.int_orders(
 order_number int NOT NULL PRIMARY key,
 order_date date NOT NULL,
 cust_id int NOT NULL,
 salesperson_id int NOT NULL,
 amount float NOT NULL
);

INSERT INTO SQL28.int_orders 
(order_number, order_date, cust_id, salesperson_id, amount) 
VALUES 
(30, CAST('1995-07-14' AS Date), 9, 1, 460),
(10, CAST('1996-08-02' AS Date), 4, 2, 540),
(40, CAST('1998-01-29' AS Date), 7, 2, 2400),
(50, CAST('1998-02-03' AS Date), 6, 7, 600),
(60, CAST('1998-03-02' AS Date), 6, 7, 720),
(70, CAST('1998-05-06' AS Date), 9, 7, 150),
(20, CAST('1999-01-30' AS Date), 4, 8, 1800);