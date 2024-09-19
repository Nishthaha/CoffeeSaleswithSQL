-- Create table structure for importing the database 
-- We will use the same column headers as in the database
-- The database is in csv format
create table coffee_sales_tb (date date, datetime time, cash_type varchar(25), card varchar(50),
	money decimal(5), coffee_name varchar(100))

-- Import the database by right clicking on the table name and slecting import/export option 


select * from coffee_sales_tb;

-- General Analysis of the data
select count(cash_type), cash_type from coffee_sales_tb group by cash_type

select min(date), max(date) from coffee_sales_tb

select count(coffee_name), coffee_name from coffee_sales_tb group by coffee_name

select cash_type, card from coffee_sales_tb where cash_type='cash' and card is not null

select card, count(*) from coffee_sales_tb where cash_type='card' group by card 
	having count(card)>1
	
select cash_type, card, date, datetime, money, coffee_name from coffee_sales_tb 
	group by cash_type, card, date, datetime, coffee_name, money 
	order by card, date, datetime asc 

select cash_type, card, sum(money) as total_cost, round(avg(money),2) as avg_order_cost, coffee_name
	from coffee_sales_tb group by cash_type, card, coffee_name 
	order by card asc 

select cash_type, card, sum(money) as total_cost, round(avg(money),2) as avg_order_cost
	from coffee_sales_tb group by cash_type, card
	order by card asc 

select cash_type, count(*) from coffee_sales_tb group by cash_type

select distinct coffee_name, money from coffee_sales_tb order by coffee_name 

select coffee_name, round(avg(money),1) from coffee_sales_tb group by coffee_name

select to_char(date, 'month') as month, extract(month from date) as month_number , sum(money) 
	from coffee_sales_tb group by month, month_number order by month_number

select extract(hour from datetime) as hour, sum(money) from coffee_sales_tb group by hour order by hour 