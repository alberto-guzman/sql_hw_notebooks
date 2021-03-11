-- create a database for tb data
CREATE DATABASE bob_db;
USE bob_db;

-- create a table for artist
CREATE TABLE artist (
artist_id int NOT NULL,
artist text NOT NULL,
PRIMARY KEY (artist_id)
);
-- import data

-- create table for episode
CREATE TABLE episode (
season_num int NOT NULL,
episode_num int NOT NULL,
episode_title text NOT NULL,
PRIMARY KEY (season_num,episode_num)
);
-- import data

-- create table for painting_in_episode
CREATE TABLE painting_in_episode (
season_num int NOT NULL,
episode_num int NOT NULL,
feature text NOT NULL,
artist_id int NOT NULL,
PRIMARY KEY (season_num,episode_num),
FOREIGN KEY (artist_id) REFERENCES artist(artist_id),
FOREIGN KEY (season_num,episode_num) REFERENCES episode(season_num,episode_num)
);
-- import data

-- QUERIES 
SELECT *
FROM painting_in_episode
LEFT JOIN artist ON painting_in_episode.artist_id = artist.artist_id
LEFT JOIN episode 
	ON painting_in_episode.episode_num = episode.episode_num
    AND painting_in_episode.season_num = episode.season_num
WHERE artist = 'BOB_ROSS' AND feature = 'MOUNTAIN';


