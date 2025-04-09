USE restaurant_db;

-- combine the menu_items and order_details tables into a single table

CREATE TEMPORARY TABLE menu_order_details (

SELECT *
FROM order_details od
JOIN menu_items mi
ON od.item_id = mi.menu_item_id

)
;

-- what were the least and most ordered items, what categories were they in

SELECT item_name
	, COUNT(*) as items_ordered
FROM menu_order_details
GROUP BY item_name
ORDER BY items_ordered
LIMIT 1
;

SELECT item_name
	, COUNT(*) as items_ordered
FROM menu_order_details
GROUP BY item_name
ORDER BY items_ordered DESC
LIMIT 1
;

SELECT item_name
	, category
FROM menu_items
WHERE item_name IN ('Chicken Tacos', 'Hamburger')
;

-- what were the top 5 orders that spent the most money

SELECT order_id
	, SUM(price) as total_order_price
FROM menu_order_details
GROUP BY order_id
ORDER BY total_order_price DESC
LIMIT 5
;

-- view the details of the highest spend order, what insights can you gather from the result

SELECT category
	, COUNT(item_id) as items_ordered
FROM menu_order_details
WHERE order_id = 440
GROUP BY category
;

/* Highest spend order likes Italian food*/

-- view the details of the top 5 highest spend orders, what insights can you gather from the result

SELECT category
	, COUNT(item_id) as items_ordered_440
FROM menu_order_details
WHERE order_id = 440
GROUP BY category
;

/* Order 440 likes Italian food*/

SELECT category
	, COUNT(item_id) as items_ordered_2075
FROM menu_order_details
WHERE order_id = 2075
GROUP BY category
;

/* Order 2075 likes Italian food*/

SELECT category
	, COUNT(item_id) as items_ordered_1957
FROM menu_order_details
WHERE order_id = 1957
GROUP BY category
;

/* Order 1957 likes Italian food*/

SELECT category
	, COUNT(item_id) as items_ordered_330
FROM menu_order_details
WHERE order_id = 330
GROUP BY category
;

/* Order 330 likes Asian food*/

SELECT category
	, COUNT(item_id) as items_ordered_2675
FROM menu_order_details
WHERE order_id = 2675
GROUP BY category
;

/* Order 440 likes Italian & Mexican food*/