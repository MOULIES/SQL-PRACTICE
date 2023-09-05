-- Write a sql to populate category values to the last not null VALUES
DROP DATABASE IF EXISTS SQL39;

CREATE DATABASE IF NOT EXISTS SQL39;

USE SQL39;

DROP TABLE IF EXISTS brands;


create table brands 
(
    category varchar(20),
    brand_name varchar(20)
);

insert into brands values
('chocolates','5-star')
,(null,'dairy milk')
,(null,'perk')
,(null,'eclair')
,('Biscuits','britannia')
,(null,'good day')
,(null,'boost');

SELECT * FROM brands;