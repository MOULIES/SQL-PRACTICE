-- Active: 1690646653992@@127.0.0.1@3306@SQL32

-- https://youtu.be/UfL-dMxDOew

-- # you are given Buy and Sell table
-- Buy Table:
-- DATE     Time      Qty       per_share_price     total_value
-- 15       10        10        10                  100
-- 15       14        20        10                  200

-- Sell Table:
-- DATE     Time      Qty       per_share_price     total_value
-- 15       15        15        20                  300

-- # we need output as per below

-- # Expected o/p:
-- buy_time     buy_qty     sell_qty
-- 10           10          10
-- 14           5           5
-- 14           15          NULL


DROP DATABASE IF EXISTS SQL32;

CREATE DATABASE IF NOT EXISTS SQL32;

USE SQL32;

DROP TABLE IF EXISTS Buy, Sell;

Create Table Buy (
Date Int,
Time Int,
Qty Int,
per_share_price int,
total_value int );

Create Table Sell(
Date Int,
Time Int,
Qty Int,
per_share_price int,
total_value int );

INSERT INTO Buy (date, time, qty, per_share_price, total_value)
VALUES
(15, 10, 10, 10, 100),
(15, 14, 20, 10, 200);

INSERT INTO Sell(date, time, qty, per_share_price, total_value)
VALUES (15, 15, 15, 20, 300);

SELECT * FROM Buy;

SELECT * FROM Sell;

