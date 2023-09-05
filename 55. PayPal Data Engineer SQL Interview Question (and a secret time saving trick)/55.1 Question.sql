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
-- employeeid , phone_number , isdefault, added_on
-- 1001 ,9999 , false, 2023-01-01
-- 1001 ,1111 , false, 2023-01-02
-- 1001 ,2222 , true,, 2023-01-03
-- 1000 ,3333 , false, 2023-01-01
-- 1000 ,4444 , false, 2023-01-02

-- https://tableconvert.com/csv-to-sql
-- We can use this site to convert csv value into sql code for table insert

-- Write an sql code to find output table as below
-- employeeid, employee_default_phone_number, totalentry, totallogin, totallogout, latestlogin, latestlogout

-- Note:
-- All employees should be present in output. if an employee doesn't have default phone number, it should have
-- latest add_on number 


DROP DATABASE IF EXISTS SQL55_1;

CREATE DATABASE IF NOT EXISTS SQL55_1;

USE SQL55_1;

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
    isdefault	VARCHAR(512),
    added_on date
);

delete from employee_details;

INSERT INTO employee_details 
(employeeid, phone_number, isdefault, added_on) 
VALUES 
("1001" ,"9999" , 'false', "2023-01-01"),
("1001" ,"1111" , 'false', "2023-01-02"),
("1001" ,"2222" , 'true', "2023-01-03"),
("1000" ,"3333" , 'false', "2023-01-01"),
("1000" ,"4444" , 'false', "2023-01-02");

-- SELECT * FROM employee_checkin_details;