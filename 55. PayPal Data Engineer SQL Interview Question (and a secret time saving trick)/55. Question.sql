-- Table1:
-- employee_checkin_details:
--   employeeid ,entry_details, timestamp_details 
--   1000 , login , 2023-06-16 01:00:15.34
--   1000 , login , 2023-06-16 02:00:15.34
--   1000 , login , 2023-06-16 03:00:15.34
--   1000 , logout , 2023-06-16 12:00:15.34
--   1001 , login , 2023-06-16 01:00:15.34
--   1001 , login , 2023-06-16 02:00:15.34
--   1001 , login , 2023-06-16 03:00:15.34
--   1001 , logout , 2023-06-16 12:00:15.34

-- Table2:
-- employee_details:
-- employeeid , phone_number , isdefault
-- 1001 ,9999 , false
-- 1001 ,1111 , false
-- 1001 ,2222 , true
-- 1003 ,3333 , false

-- https://tableconvert.com/csv-to-sql
-- We can use this site to convert csv value into sql code for table insert

-- Write an sql code to find output table as below
-- employeeid, employee_default_phone_number, totalentry, totallogin, totallogout, latestlogin, latestlogout

-- Note:
-- All employees should be present in output eventhough if he doesn't have default phone number



DROP DATABASE IF EXISTS SQL55;

CREATE DATABASE IF NOT EXISTS SQL55;

USE SQL55;

DROP TABLE IF EXISTS employee_checkin_details, employee_details;

CREATE TABLE employee_checkin_details 
(
    employeeid	INT,
    entry_details	VARCHAR(512),
    timestamp_details	datetime
);

delete from employee_checkin_details;

INSERT INTO employee_checkin_details (employeeid, entry_details, timestamp_details) 
VALUES ('1000', 'login', '2023-06-16 01:00:15.34'),
('1000', 'login', '2023-06-16 02:00:15.34'),
('1000', 'login', '2023-06-16 03:00:15.34'),
('1000', 'logout', '2023-06-16 12:00:15.34'),
('1001', 'login', '2023-06-16 01:00:15.34'),
('1001', 'login', '2023-06-16 02:00:15.34'),
('1001', 'login', '2023-06-16 03:00:15.34'),
('1001', 'logout', '2023-06-16 12:00:15.34');


CREATE TABLE employee_details 
(
    employeeid	INT,
    phone_number	INT,
    isdefault	VARCHAR(512)
);

delete from employee_details;

INSERT INTO employee_details 
(employeeid, phone_number, isdefault) 
VALUES ('1001', '9999', 'false'),
 ('1001', '1111', 'false'),
 ('1001', '2222', 'true'),
 ('1003', '3333', 'false');

SELECT * FROM employee_checkin_details;