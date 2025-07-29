create database cardekho;

use cardekho;

select name from sys.tables;

select *from Car_Km;
select *from car_price;

--Que 1. How many cars use automatics transmission?

select count(car_name) AS count_car_automatic
from Car_Km
where Transmission='automatic';

--Que 2. How many cars have a individual seller type?

select count(car_name) AS count_car_individual
from Car_Km
where seller_type='individual';

--Que 3. What is the highest selling price of a car ciaz?

select top 1 car_name,selling_price
from Car_price
where car_name='ciaz'
order by selling_price desc;

select  car_name,max(selling_price) as higest_selling_price
from Car_price
where car_name='ciaz'
group by Car_Name;

select car_name,selling_price from Car_price where car_name='ciaz' order by selling_price desc;

--Que 4. What is the lowest selling price of a car innova and ertiga?


select  car_name,min(selling_price) as lowest_selling_price
from Car_price
where car_name='innova' or Car_Name='ertiga'
group by Car_Name;

select  car_name,selling_price from Car_price where car_name='innova'  order by selling_price;
select  car_name,selling_price from Car_price where car_name='ertiga'  order by selling_price;

--Que 5. What is the average selling price of cars based on their model year?.

select year,avg(selling_price) as avg_selling_price
from Car_price
group by year;

--Que 6. What is the average selling price of cars based on fuel type and transmission type?

select ck.fuel_type, ck.Transmission,avg(cp.selling_price) as avg_selling_price
from Car_Km ck
join Car_price cp
on ck.Car_Name=cp.Car_Name and ck.Year=cp.Year
group by ck.Fuel_Type,ck.Transmission;

--Que 7. Which cars have the highest depreciation rate?

select car_name,max(((ori_price-selling_price)/Ori_Price)*100) as highest_depre_rate
from Car_price
group by Car_Name
order by highest_depre_rate desc;

SELECT top 10
    cp.Car_Name,
    cp.Year,
    cp.Ori_Price,
    cp.Selling_Price,
    ((cp.Ori_Price - cp.Selling_Price) / cp.Ori_Price * 100) AS Depreciation_Percentage
FROM 
    car_price cp
JOIN 
    car_km ck ON cp.Car_Name = ck.Car_Name AND cp.Year = ck.Year
ORDER BY 
    Depreciation_Percentage DESC; 
