-- create a database for tb data
CREATE DATABASE tb_db;
USE tb_db;


-- create a table for country_info
CREATE TABLE country_info (
country_id int NOT NULL,
country text NOT NULL,
PRIMARY KEY (country_id)
);
-- import data


-- create table for sex_info
CREATE TABLE sex_info (
sex_id int NOT NULL,
sex text NOT NULL,
PRIMARY KEY (sex_id)
);
-- import data

-- create table for tb_per_year
CREATE TABLE tb_per_year (
id int NOT NULL AUTO_INCREMENT,
country_id int NOT NULL,
sex_id int NOT NULL,
total_number int,
year int,
PRIMARY KEY (id),
FOREIGN KEY (country_id) REFERENCES country_info(country_id),
FOREIGN KEY (sex_id) REFERENCES sex_info(sex_id)
);
-- import data


-- QUERIES 

-- Query all columns for all age groups and genders in the country AO.

SELECT *
FROM tb_per_year
LEFT JOIN country_info ON tb_per_year.country_id = country_info.country_id
LEFT JOIN sex_info ON tb_per_year.sex_id = sex_info.sex_id
WHERE country = 'AO';

-- Query all columns for all age groups and genders for country AO or AR.

SELECT *
FROM tb_per_year
LEFT JOIN country_info ON tb_per_year.country_id = country_info.country_id
LEFT JOIN sex_info ON tb_per_year.sex_id = sex_info.sex_id
WHERE country = 'AO' OR country = 'AR';

-- Query all columns for females in all age groups for country AF.

SELECT *
FROM tb_per_year
LEFT JOIN country_info ON tb_per_year.country_id = country_info.country_id
LEFT JOIN sex_info ON tb_per_year.sex_id = sex_info.sex_id
WHERE country = 'AO' AND sex = 'f';

-- Write a query which returns all columns and rows consistent with the long-format tidy data set.

SELECT country, year, sex, total_number
FROM tb_per_year
LEFT JOIN country_info ON tb_per_year.country_id = country_info.country_id
LEFT JOIN sex_info ON tb_per_year.sex_id = sex_info.sex_id