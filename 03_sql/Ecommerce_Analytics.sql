CREATE DATABASE ecommerce_analytics;
USE ecommerce_analytics;
SHOW TABLES;
SELECT COUNT(*) FROM customers_cleaned;
SELECT COUNT(*) FROM products_cleaned;
SELECT COUNT(*) FROM orders_cleaned;
SELECT COUNT(*) FROM campaigns_cleaned;
SELECT COUNT(*) FROM product_monthly_snapshot_cleaned;
SELECT COUNT(*) FROM data_dictionary_cleaned;
USE ecommerce_analytics;
DESCRIBE customers_cleaned;
DESCRIBE products_cleaned;
DESCRIBE orders_cleaned;
SELECT COUNT(*) AS customer_count
FROM customers_cleaned;
SELECT COUNT(*) AS product_count
FROM products_cleaned;
SELECT COUNT(*) AS order_count
FROM orders_cleaned;
SELECT COUNT(*) AS campaign_count
FROM campaigns_cleaned;
SELECT COUNT(*) AS snapshot_count
FROM product_monthly_snapshot_cleaned;
SELECT COUNT(*) AS dictionary_count
FROM data_dictionary_cleaned;
SELECT
MIN('order date') AS
first_order_date,
MAX('order date') AS 
last_order_date
FROM orders_cleaned;
USE ecommerce_analytics;
SELECT COUNT(DISTINCT order_ID) AS
total_orders,
SUM('net revenue') AS realized_revenue,
AVG('net revenue') AS avg_order_value
FROM orders_cleaned
WHERE 'order status' = 'completed';
SELECT 'order status',
 COUNT(DISTINCT order_ID) AS
total_orders,
SUM('net revenue') AS net_revenue,
AVG('net revenue') AS realized_revenue
FROM orders_cleaned
GROUP BY 'order status'
ORDER BY realized_revenue DESC;
SELECT 
YEAR('order date') AS order_year,
MONTH('ORDER DATE') AS order_month,
SUM('realized revenue') AS realized_revenue
FROM orders_cleaned
WHERE 'order status' = 'completed'
GROUP BY 
YEAR('order date'),
MONTH('order date')
ORDER BY 
order_year,
order_month;
SELECT
p.category,
SUM(o.realized_revenue) AS revenue
FROM orders_cleaned o 
JOIN products_cleaned p
ON o.product_ID = p.product_ID
GROUP BY p.category;
SELECT
    o.Customer_ID,
    c.Customer_ID
FROM orders_Cleaned o
LEFT JOIN customers_Cleaned c
    ON o.Customer_ID = c.Customer_ID
LIMIT 10;
SELECT
    o.Product_ID,
    p.Product_ID
FROM orders_Cleaned o
LEFT JOIN products_Cleaned p
    ON o.Product_ID = p.Product_ID
LIMIT 10;
SELECT
    o.Campaign_ID,
    c.Campaign_ID
FROM orders_Cleaned o
LEFT JOIN campaigns_Cleaned c
    ON o.Campaign_ID = c.Campaign_ID
LIMIT 10;
SELECT
    p.Product_ID,
    p.Product_name,
    p.Category,
    SUM(o.Realized_revenue) AS Revenue
FROM orders_Cleaned o
JOIN products_Cleaned p
ON o.Product_ID = p.Product_ID
GROUP BY
    p.Product_ID,
    p.Product_name,
    p.Category
ORDER BY Revenue DESC;
SELECT
    `Order_Status`,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    SUM(Net_revenue) AS Net_Revenue,
    SUM(Realized_revenue) AS Realized_Revenue
FROM orders_Cleaned
GROUP BY `Order_Status`
ORDER BY Realized_Revenue DESC;
SELECT
    YEAR(`Order_Date`) AS Order_Year,
    MONTH(`Order_Date`) AS Order_Month,
    SUM(Realized_revenue) AS Realized_Revenue
FROM orders_Cleaned
WHERE `Order_Status` = 'Completed'
GROUP BY
    YEAR(`Order_Date`),
    MONTH(`Order_Date`)
ORDER BY
    Order_Year,
    Order_Month;
    SELECT
    Customer_ID,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    SUM(Realized_revenue) AS Revenue
FROM orders_Cleaned
WHERE `Order_Status` = 'Completed'
GROUP BY Customer_ID
ORDER BY Revenue DESC;
DESCRIBE ORDERS_CLEANED;
SELECT
customer_ID,
COUNT(DISTINCT order_ID) AS
Total_orders,
SUM(Realized_revenue) AS revenue
FROM orders_cleaned
WHERE order_status = 'completed'
GROUP BY customer_ID 
ORDER BY Revenue DESC;
