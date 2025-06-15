create Database sales_analysis;
USE sales_analysis;

CREATE TABLE orders (
    order_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    product_id VARCHAR(20)
);

SELECT COUNT(*) FROM orders;

-- 1. Monthly Revenue (Total Sales per Month)
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(amount) AS monthly_revenue
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

-- 2. Monthly Order Volume (Number of Unique Orders per Month)
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    COUNT(DISTINCT order_id) AS monthly_order_count
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

-- Top 3 Highest Revenue Months
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(amount) AS total_revenue
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY total_revenue DESC
LIMIT 3;

-- Revenne by product 
SELECT 
    product_id,
    SUM(amount) AS total_revenue
FROM orders
GROUP BY product_id
ORDER BY total_revenue DESC;











