-- 03_basic_analysis

-- View the dataset
SELECT *
FROM orders
LIMIT 20;

-- List distinct products
SELECT DISTINCT Product
FROM orders
ORDER BY Product;


-- Filter orders by status
SELECT OrderID, OrderDate, Product, TotalPrice, OrderStatus
FROM orders
WHERE OrderStatus = 'Delivered'
ORDER BY OrderDate DESC;

-- Find the highest-value recorded orders
SELECT OrderID, Product, Quantity, TotalPrice, OrderStatus
FROM orders
ORDER BY TotalPrice DESC
LIMIT 10;
-- Summarize the numerical columns
SELECT COUNT(*) AS order_count, SUM(Quantity) AS total_units, AVG(Quantity) AS average_quantity,
    MIN(TotalPrice) AS minimum_order_value, MAX(TotalPrice) AS maximum_order_value, AVG(TotalPrice) AS average_order_value
FROM orders;