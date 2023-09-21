-- Active: 1690646653992@@127.0.0.1@3306

-- Find missing stores in each quarter

DROP DATABASE IF EXISTS SQL21;

CREATE DATABASE IF NOT EXISTS SQL21;

USE SQL21;

CREATE TABLE STORES (
    Store varchar(10),
    Quarter varchar(10),
    Amount int
);

INSERT INTO STORES (Store, Quarter, Amount)
VALUES ('S1', 'Q1', 200),
('S1', 'Q2', 300),
('S1', 'Q4', 400),
('S2', 'Q1', 500),
('S2', 'Q3', 600),
('S2', 'Q4', 700),
('S3', 'Q1', 800),
('S3', 'Q2', 750),
('S3', 'Q3', 900);

SELECT * FROM STORES;