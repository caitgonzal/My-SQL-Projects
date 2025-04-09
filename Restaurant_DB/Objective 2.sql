USE restaurant_db;

-- view the order_details table

SELECT *
FROM order_details
;

-- what is the date range of the table

SELECT MIN(order_date)
	, MAX(order_date)
FROM order_details
;

-- how many orders were made within this date range

SELECT order_id AS total_orders
FROM order_details
ORDER BY total_orders DESC
LIMIT 1
;

-- how many items were ordered within this date range

SELECT order_details_id AS total_items_ordered
FROM order_details
Order BY total_items_ordered DESC
LIMIT 1
;

-- which orders had the most number of items

SELECT order_id
	, COUNT(item_id) as item_total
FROM order_details
GROUP BY order_id
ORDER BY item_total DESC
LIMIT 10
;

-- how many orders had more than 12 items

Select COUNT(*)
FROM (
	SELECT order_id
		, COUNT(item_id) as item_total
	FROM order_details
	GROUP BY order_id
	HAVING item_total > 12
	ORDER BY item_total DESC
    ) AS orders
;
