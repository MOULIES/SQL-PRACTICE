-- Active: 1690646653992@@127.0.0.1@3306

DROP DATABASE IF EXISTS SQL44;

CREATE DATABASE IF NOT EXISTS SQL44;

USE SQL44;

DROP TABLE IF EXISTS transactions;

CREATE TABLE transactions(
    transaction_id integer,
    type enum('deposit', 'withdrawal'),
    amount Float,
    transaction_date timestamp
);

INSERT INTO transactions
values
(19153 ,             "deposit"     ,  15.80 ,          "2022-07-05 10:00:00"),
(19153 ,             "deposit"     ,  65.90 ,          "2022-07-10 10:00:00"),
(53151 ,            "deposit"     ,  178.55  ,        "2022-08-07 10:00:00"),
(29776 ,            "withdrawal" ,   25.90   ,        "2022-08-07 10:00:00"),
(16461 ,            "withdrawal",    45.99   ,        "2022-08-07 10:00:00"),
(77134 ,            "deposit"  ,     32.60   ,       "2022-07-10 10:00:00"),
(77135 ,            "deposit"  ,     132.60   ,       "2022-07-15 10:00:00"),
(77137 ,            "withdrawal"  ,   32.60   ,       "2022-07-15 10:00:00"),
(77138 ,            "deposit"  ,     50.60   ,       "2022-07-20 10:00:00"),
(77139 ,            "withdrawal"  ,   32.60   ,    "2022-07-20 12:00:00");


SELECT * FROM transactions;