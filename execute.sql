-- QUESTIONS:                                             QUERY TABLE:
-- 1. Get all the columns from a table
select * from airbnb_list;

-- 2. Get the city column from the table
select city from airbnb_list;

-- 3. Get the city and year_listed columns from the table
select city,year_listed from airbnb_list;

-- 4. Get the listing id, city, ordered by the number_of_rooms in ascending order
select id,city from airbnb_list
order by no_of_rooms asc;

-- 5. Get the listing id, city, ordered by the number_of_rooms in descending order
select id, city from airbnb_list
order by no_of_rooms desc;

-- 6. Get the first 5 rows from the airbnb_listings table
select * from airbnb_list
limit 5;

-- 7. Get a unique list of cities where there are listings
select distinct city from airbnb_list;

-- Questions:											FILTERING DATA:
-- 1. Get all the listings where number_of_rooms is more or equal to 3
select * from airbnb_list
where no_of_rooms >= 3;

-- 2. Get all the listings where number_of_rooms is more than 3
select * from airbnb_list
where no_of_rooms >3;

-- 3. Get all the listings where number_of_rooms is exactly equal to 3
select * 
from airbnb_list
where no_of_rooms = 3;

-- 4. Get all the listings where number_of_rooms is lower or equal to 3
select * from airbnb_list
where no_of_rooms <= 3;

-- 5. Get all the listings where number_of_rooms is lower than 3
select * from airbnb_list
where no_of_rooms <3;

-- 6. Get all the listings with 3 to 6 rooms
select * from airbnb_list
where no_of_rooms between 3 and 6;

-- Questions:											FILTERING ON TEXT COLUMN:

-- 7. Get all the listings that are based in 'Paris'--
select * from airbnb_list
where city = 'paris';

-- 8. Get the listings based in the an 'USA' and in 'France'
select * from airbnb_list
where country in ('usa','france');

-- 9. Get all the listings where the city starts with an 'j' and where the city does not end in 't'
select * from airbnb_list
where city like 'p%' and city not like '%t';

-- Questions:											FILTERING ON MULTIPLE COLUMNS:

-- 10. Get all the listings in 'Paris' where number_of_rooms is bigger than 3
select *  from airbnb_list
where city = 'paris' and no_of_rooms > 3;

-- 11. Get all the listings in 'Paris' OR the ones that were listed after 2012
select * from airbnb_list
where
city = 'paris' or year_listed > 2012;

-- Questions:											FILTERING ON MISSING DATA:

-- 12. Return the listings where number_of_rooms is missing
select * from airbnb_list
where
no_of_rooms is null;

-- 13. Return the listings where number_of_rooms is not missing
select * from airbnb_list
where
no_of_rooms is not null;

-- Questions:											AGGRIGATING DATA:
-- SIMPLE AGGRICATION:

-- 1. Get the total number of rooms available across all listings
select sum(no_of_rooms) from airbnb_list;

-- 2. Get the average number of rooms per listing across all listings
select avg(no_of_rooms) from airbnb_list;

-- 3. Get the listing with the highest number of rooms across all listings
select max(no_of_rooms) from airbnb_list;

-- 4. Get the listing with the lowest number of rooms across all listings
select min(no_of_rooms) from airbnb_list;

-- GROUPING, FILTERING, SORTING DATA:

-- 5. Get the total number of rooms for each country
select country,sum(no_of_rooms) from airbnb_list
group by country;

-- 6. Get the average number of rooms for each country
select country, avg(no_of_rooms) 
from airbnb_list
group by country;

-- 7. Get the listing with the maximum number of rooms per country
select country, max(no_of_rooms)
from airbnb_list
group by country;

-- 8. Get the listing with the lowest amount of rooms per country
select country, min(no_of_rooms)
from airbnb_list
group by country;

-- 9. For each country, get the average number of rooms per listing, sorted by ascending order
select country, avg(no_of_rooms) as avg_rooms
from airbnb_list
group by country
order by country asc;

-- 10. For Japan and the USA, get the average number of rooms per listing in each country
select country, max(no_of_rooms) as avg_rooms
from airbnb_list
where country in ('japan','usa')
group by country;

-- 11. Get the number of cities per country, where there are listings
select country,count(city) as city_count
from airbnb_list
group by country;
    
-- 12. Get all the years where there were more than 100 listings per year
select year_listed from airbnb_list
group by year_listed
having count(id) > 100;