-- Normalisation
--  1NF - Columns should have atomic values - each cell should have 1 value
--  2NF - No partial dependencies
--  3NF - Remove Transitive Dependency - Non prime attribute should not give non prime attribute
-- To make Olympic_data - normalize  , we create two tables - player_info and medal 

use olympix;    # use data base olympix

ALTER TABLE olympix.olympix_data ADD id Int NOT NULL AUTO_INCREMENT PRIMARY KEY;  # add id into olympix_data and set primary key

-- create table player_info
create table player_info(
id int(11) not null primary key auto_increment,
name varchar(50),
age varchar(25),
country  varchar(50),
year int(11),
Date_Given varchar(30),
sports varchar(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;     #  we created table and set id as primary key

-- create table medal
create table medal(
id int(11) not null primary key auto_increment,
gold_medal int(11),
silver_medal int(11),
brone_medal  int(11),
total_medal int(11),
CONSTRAINT medal_fk
FOREIGN KEY (id) REFERENCES player_info (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;      #  we created table and set id as primary key and foreign key


-- inset values into table player_info from master table olympic_data
insert into player_info                      
select id, name, age, country, year, Date_Given, sports from olympix_data;   # here we selected specific columns to add values into player_info table

-- inset values into table medal from master table olympic_data
insert into medal 
select id, gold_medal, silver_medal, brone_medal, total_medal from olympix_data; # here we selected specific columns to add values into medal table
