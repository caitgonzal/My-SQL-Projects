-- Clean and structure the dataset for analysis
-- Perform exploratory data analysis (EDA) to identify trends, anomalies, and key metrics.
-- Generate actionable insights through SQL queries to help the business make data-driven decisions.

USE ml_sales
;

-- get table structure

DESCRIBE sales
;

-- count total records

SELECT COUNT(*) as total_rows
FROM sales
;

-- check for null values

SELECT
	COUNT(*) - COUNT(product) AS null_product
    , COUNT(*) - COUNT(brand) AS null_product
    , COUNT(*) - COUNT(product_code) AS null_product
    , COUNT(*) - COUNT(product_specification) AS null_product
    , COUNT(*) - COUNT(price) AS null_product
    , COUNT(*) - COUNT(inward_date) AS null_product
    , COUNT(*) - COUNT(dispatch_date) AS null_product
    , COUNT(*) - COUNT(quantity_sold) AS null_product
    , COUNT(*) - COUNT(customer_name) AS null_product
    , COUNT(*) - COUNT(customer_location) AS null_product
    , COUNT(*) - COUNT(region) AS null_product
    , COUNT(*) - COUNT(core_specification) AS null_product
    , COUNT(*) - COUNT(processor_specification) AS null_product
    , COUNT(*) - COUNT(ram) AS null_product
    , COUNT(*) - COUNT(rom) AS null_product
    , COUNT(*) - COUNT(ssd) AS null_product
FROM sales
;
    
-- date range validation

SELECT
	MIN(inward_date) as earliest_inward_date
    , MAX(inward_date) as lastest_inward_date
	, MIN(dispatch_date) as earliest_dispatch_date
    , MAX(dispatch_date) as lastest_dispatch_date
FROM sales
;

-- identify popular brands

SELECT 
	brand
	, COUNT(*) as brand_sales
FROM sales
GROUP BY brand
ORDER BY brand_sales DESC
LIMIT 5
;

-- identify popular product

SELECT 
	product
	, COUNT(*) as total_orders
    , SUM(quantity_sold) as total_sold
FROM sales
GROUP BY product
ORDER BY total_orders DESC
;

-- identify average price per product per brand

SELECT 
	brand
    , ROUND(AVG(price), 2) as mobile_price
FROM sales
WHERE product = 'mobile phone'
				AND
                quantity_sold = 1
GROUP BY brand
ORDER BY mobile_price DESC
;

SELECT 
	brand
    , ROUND(AVG(price), 2) as laptop_price
FROM sales
WHERE product = 'laptop'
				AND
                quantity_sold = 1
GROUP BY brand
ORDER BY laptop_price DESC
;

-- idenify total orders and items sold per brand

SELECT 
	brand
	, COUNT(*) as mobile_orders
    , SUM(quantity_sold) as mobile_phones_sold 
FROM sales
WHERE product = 'mobile phone'
GROUP BY brand
ORDER BY mobile_orders DESC
;

SELECT 
	brand
	, COUNT(*) as laptop_orders
    , SUM(quantity_sold) as laptops_sold 
FROM sales
WHERE product = 'laptop'
GROUP BY brand
ORDER BY laptop_orders DESC
;

-- identify total revenue per brand

SELECT brand
	, SUM(price) as total_rev
FROM sales
GROUP BY brand
ORDER BY total_rev DESC
Limit 3
;

-- total revenue

SELECT SUM(price) as total_rev
from sales
;

-- total sales volume

SELECT SUM(quantity_sold) as total_sales
from sales;

--  identify regions with most orders

SELECT region
	, COUNT(*) as region_orders
FROM sales
GROUP BY region
Order BY region_orders DESC
;

--  identify regions with most revenue

SELECT region
	, SUM(price) as region_rev
FROM sales
GROUP BY region
Order BY region_rev DESC
;


-- identify popular item specifications

SELECT core_specification
	, COUNT(*) as core_count
FROM sales
GROUP BY core_specification
ORDER BY core_count DESC
;

SELECT processor_specification
	, COUNT(*) as pro_count
FROM sales
GROUP BY processor_specification
ORDER BY pro_count DESC
;

SELECT ram
	, COUNT(*) as ram_count
FROM sales
GROUP BY ram
ORDER BY ram_count DESC
;

SELECT rom
	, COUNT(*) as rom_count
FROM sales
GROUP BY rom
ORDER BY rom_count DESC
;

SELECT ssd
	, COUNT(*) as ssd_count
FROM sales
GROUP BY ssd
ORDER BY ssd_count DESC
;

-- idenity unique customers

SELECT COUNT(DISTINCT customer_name) as unique_customers
FROM sales
;

-- identify customers with most orders

SELECT customer_name
	, SUM(price) as total_spent
    , COUNT(DISTINCT inward_date) as total_orders
    , SUM(quantity_sold) as total_items
FROM sales
GROUP BY customer_name
HAVING total_orders > 15
ORDER BY total_orders DESC
LIMIT 2
;

-- identify customers with most items purchased

SELECT customer_name
	, SUM(price) as total_spent
    , COUNT(DISTINCT inward_date) as total_orders
    , SUM(quantity_sold) as total_items
FROM sales
GROUP BY customer_name
HAVING total_items > 15
ORDER BY total_orders DESC
LIMIT 2
;

-- average order value

SELECT ROUND(AVG(price), 2) as avg_order_value
FROM sales
;
