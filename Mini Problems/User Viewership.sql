USE news_viewership;

/* Consider a table containing user viewership data categorized by device type, with the two device types being desktop and mobile device*/

/* Write a query that calculates the total viewership for desktops and mobile devices. The query should return the total viewership for desktops
as desktop_views and the total viewership for mobile devices as mobile_views. */

SELECT 
  SUM(CASE WHEN device_type = 'desktop' THEN 1 ELSE 0 END) AS desktop_views, 
  SUM(CASE WHEN device_type IN ('mobile') THEN 1 ELSE 0 END) AS mobile_views 
FROM viewership;