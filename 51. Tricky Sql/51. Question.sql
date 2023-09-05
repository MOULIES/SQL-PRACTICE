-- We have a table which stores data of multiple sections.
-- Every section has 3 numbers
-- We have to find top 4 numbers from any 2 sections(2 numbers each) whose addition should be maximum
-- so in this case we will choose section b where we have 19(10 + 9) then we need to choose either C or D
-- because both has sum of 18 but in D we have 10 which is bigger from 9 so we will give priority to D

DROP DATABASE IF EXISTS SQL51;

CREATE DATABASE IF NOT EXISTS SQL51;

USE SQL51;

DROP TABLE IF EXISTS section_data;

create table section_data (
  section varchar(5), 
  number integer
);

insert into section_data 
values 
  ('A', 5), 
  ('A', 7), 
  ('A', 10), 
  ('B', 7), 
  ('B', 9), 
  ('B', 10), 
  ('C', 9), 
  ('C', 7), 
  ('C', 9), 
  ('D', 10), 
  ('D', 3), 
  ('D', 8);

SELECT * from section_data;