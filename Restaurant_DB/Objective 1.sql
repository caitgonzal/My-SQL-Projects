USE restaurant_db;

-- view the menu_items table

SELECT *
FROM menu_items
;

-- find the number of items on the menu

SELECT COUNT(*)
FROM menu_items
;

-- what are the least and most expensive items on the menu

SELECT *
FROM menu_items
ORDER BY price
LIMIT 1
;

SELECT *
FROM menu_items
ORDER BY price DESC
LIMIT 1
;

-- how many italian dishes are on the menu

SELECT COUNT(*)
FROM menu_items
WHERE category = 'Italian'
;

-- what are the least and most expensive italian dishes on the menu

SELECT *
FROM menu_items
WHERE category = 'Italian'
ORDER BY price
LIMIT 1
;

SELECT *
FROM menu_items
WHERE category = 'Italian'
ORDER BY price DESC
LIMIT 1
;
-- how many dishes are in each category

SELECT category
	, COUNT(*)
FROM menu_items
GROUP BY category
;

-- what is the average dish price within each category

SELECT category
	, ROUND(AVG(price), 2)
FROM menu_items
GROUP BY category
;