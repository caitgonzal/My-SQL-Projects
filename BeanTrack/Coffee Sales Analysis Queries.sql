USE beantrack;

-- popular products by quantity and sales

SELECT 
	product
	, COUNT(*) quantity_sold
    , SUM(sales_amount) total_sales
FROM sales
Group By product
Order by total_sales desc

