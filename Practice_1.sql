-- Ex1
select name from city
where population > 120000 and countrycode = 'USA';
-- Ex2
select * from city
where countrycode = 'JPN';
-- Ex3
select city,state from station
-- Ex4
select city from station
where city like 'a%' or city like 'e%' or city like 'i%' or city like 'o%' or city like 'u%';
-- Ex5
select distinct city from station
where city like '%a' or city like '%e' or city like '%i' or city like '%o' or city like '%u';
-- Ex6
select distinct city from station
where city not like 'a%' and city not like 'e%' and city not like 'i%' and city not like 'o%' and city not like 'u%';
-- Ex7
select name from employee
order by name;
-- Ex8
select name from employee
where salary > 2000 and months <10;
order by employee_id;
-- Ex9
select product_id from products
where low_fats = 'Y' and recyclable = 'Y';
-- Ex10
select name from customer
where referee_id !=2 and referee_id is NULL;
-- Ex11
select name, population, area from world
where area >= 3000000 or population >=25000000;
-- Ex12
select distinct author_id as id from views
where viewer_id = author_id
order by id;
-- Ex13
SELECT part, assembly_step FROM parts_assembly
where finish_date is NULL;
-- Ex14
select * from lyft_drivers
where yearly_salary <= 30000 or yearly_salary >= 70000;
-- Ex15
select advertising_channel from uber_advertising
where money_spent > 100000 and year = 2019;



