-- create a database for tb data
CREATE DATABASE stock_db;
USE stock_db;


-- create a table for company_info
CREATE TABLE company_info (
company_id int NOT NULL,
company text NOT NULL,
symbol text,
sector text,
PRIMARY KEY (company_id)
);
-- import data


-- create table for exchange_info
CREATE TABLE exchange_info (
exchange_id int NOT NULL,
exchange text NOT NULL,
PRIMARY KEY (exchange_id)
);
-- import data

-- create table for tb_per_year
CREATE TABLE stock_per_day (
id int NOT NULL AUTO_INCREMENT,
company_id int NOT NULL,
exchange_id int NOT NULL,
date text,
close int,
high int,
open int,
year int,
month int,
day int,
wday int,
quarter int,
o_c_diff int,
PRIMARY KEY (id),
FOREIGN KEY (company_id) REFERENCES company_info(company_id),
FOREIGN KEY (exchange_id) REFERENCES exchange_info(exchange_id)
);
-- import data


-- QUERIES 

-- Query the close price for Tesla for all trading days.

SELECT close, company
FROM stock_per_day
LEFT JOIN company_info USING (company_id) 
LEFT JOIN exchange_info USING (exchange_id)
WHERE symbol = 'TSLA';

-- Query the low and high prices for Gamestop for all trading days.

SELECT 
	MAX(close) AS 'High Price'
    , MIN(close) AS 'Low Price'
FROM stock_per_day
LEFT JOIN company_info USING (company_id) 
LEFT JOIN exchange_info USING (exchange_id)
WHERE symbol = 'GME';

-- Query the maximum close price for all companies.

SELECT company,
	MAX(close) AS 'Max Close Price'
FROM stock_per_day
LEFT JOIN company_info USING (company_id) 
LEFT JOIN exchange_info USING (exchange_id)
GROUP BY company;

-- Query the average close price for all companies in each month.

SELECT company, month,
	AVG(close) AS 'Average Close Price'
FROM stock_per_day
LEFT JOIN company_info USING (company_id) 
LEFT JOIN exchange_info USING (exchange_id)
GROUP BY company, month
ORDER BY company, month;