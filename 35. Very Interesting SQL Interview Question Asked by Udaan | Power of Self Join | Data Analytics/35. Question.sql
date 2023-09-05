-- business_city table has data from the day udaan has started operation
-- Write a sql to identify yearwise count of new cities where udaan started their operations


DROP DATABASE IF EXISTS SQL35;

CREATE DATABASE IF NOT EXISTS SQL35;

USE SQL35;

DROP TABLE IF EXISTS business_city;

create table business_city (
business_date date,
city_id int
);

delete from business_city;

insert into business_city
values
(cast('2020-01-02' as date),3),
(cast('2020-07-01' as date),7),
(cast('2021-01-01' as date),3),
(cast('2021-02-03' as date),19),
(cast('2022-12-01' as date),3),
(cast('2022-12-15' as date),3),
(cast('2022-02-28' as date),12),
(cast('2022-04-29' as date),12);

SELECT * FROM business_city;

-- Expected o/p:
-- year     #_new_cities
-- 2020    2
-- 2021    1
-- 2022    1