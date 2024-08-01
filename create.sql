-- creating database
create database airbnb;
use airbnb;

-- create table:
create table airbnb_list (
id int primary key auto_increment,
city varchar(50) not null,
country varchar(50) not null,
no_of_rooms int not null,
year_listed bigint not null
);