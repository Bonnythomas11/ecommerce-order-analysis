CREATE DATABASE ecommerce;
USE ecommerce;
CREATE TABLE orders (
  order_id VARCHAR(50),
  customer_id VARCHAR(50),
  order_status VARCHAR(20),
  order_purchase_timestamp DATETIME,
  order_delivered_customer_date DATETIME
);
CREATE TABLE reviews (
  review_id VARCHAR(50),
  order_id VARCHAR(50),
  review_score INT
);
SET GLOBAL local_infile = 1;
SET GLOBAL local_infile = 1;

SET GLOBAL local_infile = 1;
USE ecommerce;
USE 

LOAD DATA LOCAL INFILE '/Users/bonnythomas/Downloads/archive (2) 3/olist_orders_dataset.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
SHOW TABLES;
SELECT 
  COUNT(*) AS total_orders,
  COUNT(CASE WHEN order_status='delivered' THEN 1 END) AS delivered_orders
FROM orders;
SELECT 
  COUNT(CASE WHEN order_status='delivered' THEN 1 END)*1.0 / COUNT(*) AS delivery_rate
FROM orders;
SELECT 
  o.order_status,
  AVG(r.review_score) AS avg_rating
FROM orders o
JOIN reviews r ON o.order_id = r.order_id
GROUP BY o.order_status;
SELECT 
  order_status,
  COUNT(*) AS count
FROM orders
GROUP BY order_status
ORDER BY count DESC;

