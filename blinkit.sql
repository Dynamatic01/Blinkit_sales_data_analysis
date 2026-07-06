use blinkit;
select * from blinkit_data;
ALTER TABLE blinkit_data
MODIFY COLUMN item_visibility  float;
select count(*) from blinkit_data;

ALTER TABLE blinkit_data
RENAME COLUMN `ï»¿Item Fat Content` TO item_fat_content,
RENAME COLUMN `Item Identifier` TO item_identifier,
RENAME COLUMN `Item Type` TO item_type,
RENAME COLUMN `Outlet Establishment Year` TO outlet_establishment_year,
RENAME COLUMN `Item Visibility` TO item_visibility,
RENAME COLUMN `Item Weight` TO item_weight,
RENAME COLUMN `Total Sales` TO total_sales,
RENAME COLUMN `Rating` TO rating,
RENAME COLUMN `Outlet Identifier` TO outlet_identifier,
RENAME COLUMN `Outlet Size` TO outlet_size,
RENAME COLUMN `Outlet Location Type` TO outlet_location_type,
RENAME COLUMN `Outlet Type` TO outlet_type;


select cast(sum(total_sales)/1000000 as decimal(10,2)) as total_sales_millions from blinkit_data
where outlet_establishment_year = 2022;

select cast(avg(total_sales) as decimal(10,2)) as  avg_sales from blinkit_data;
select avg(total_sales) as  avg_sales from blinkit_data;
select count(*) as no_of_items from blinkit_data;

select avg(rating) as avg_rating from blinkit_data;
select cast(avg(rating) as decimal(10,2)) as avg_rating_LF from blinkit_data 
where item_fat_content = 'Low Fat';

select item_fat_content, cast(sum(total_sales) as decimal(10,2)) as total_sales from blinkit_data 
group by item_fat_content order by total_sales desc;

select item_fat_content, cast(sum(total_sales) as decimal(10,2)) as total_sales,
cast(avg(total_sales) as decimal(10,2)) as avg_sales,
count(*) as no_of_items,
cast(avg(rating) as decimal(10,2)) as avg_rating
from blinkit_data 
group by item_fat_content order by total_sales desc;

select item_fat_content, cast(sum(total_sales) as decimal(10,2)) as total_sales,
cast(avg(total_sales)/1000 as decimal(10,2)) as avg_sales,
count(*) as no_of_items,
cast(avg(rating) as decimal(10,2)) as avg_rating
from blinkit_data 
where outlet_establishment_year = 2022
group by item_fat_content order by total_sales desc;

select item_type,
cast(sum(total_sales) as decimal(10,2)) as total_sales,
cast(avg(total_sales) as decimal(10,2)) as avg_sales,
count(*) as no_of_items,
cast(avg(rating) as decimal(10,2)) as avg_rating
from blinkit_data 
group by item_type 
order by total_sales desc limit 5 ;

select outlet_location_type, item_fat_content,
cast(sum(total_sales) as decimal(10,2)) as total_sales,
cast(avg(total_sales) as decimal(10,2)) as avg_sales,
count(*) as no_of_items,
cast(avg(rating) as decimal(10,2)) as avg_rating
from blinkit_data 
group by outlet_location_type, item_fat_content 
order by total_sales asc limit 5 ;







update blinkit_data 
set item_fat_content = 
case
when item_fat_content in ('LF', 'low fat') then 'Low Fat'
when item_fat_content = 'reg' then 'Regular'
else item_fat_content
end
select distinct (item_fat_content) from blinkit_data;
