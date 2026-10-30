-- 04_business_analysis

-- Order count by product
SELECT Product, COUNT(*) AS order_records
FROM orders
GROUP BY Product
ORDER BY order_records DESC;

-- Order count by product
SELECT Product, COUNT(*) AS order_records, SUM(TotalPrice) AS total_recorded_order_value, AVG(TotalPrice) AS average_recorded_order_value
FROM orders
GROUP BY Product
ORDER BY total_recorded_order_value DESC;

-- Analyze order statuses
SELECT OrderStatus, COUNT(*) AS order_count, ROUND( COUNT(*) * 100.0 / (SELECT COUNT(*) FROM orders),2 ) AS percentage_of_records
FROM orders
GROUP BY OrderStatus
ORDER BY order_count DESC;


-- Compare payment methods
SELECT PaymentMethod, COUNT(*) AS order_count, ROUND(AVG(TotalPrice), 2) AS average_recorded_order_value,
    ROUND(SUM(TotalPrice), 2) AS total_recorded_order_value
FROM orders
GROUP BY PaymentMethod
ORDER BY order_count DESC;

-- Compare referral sources
SELECT ReferralSource, COUNT(*) AS order_count, ROUND(AVG(TotalPrice), 2) AS average_recorded_order_value
FROM orders
GROUP BY ReferralSource
ORDER BY order_count DESC;

-- Analyze orders by month
SELECT DATE_FORMAT(OrderDate, '%Y-%m') AS order_month, COUNT(*) AS order_count, ROUND(SUM(TotalPrice), 2) AS total_recorded_order_value,
    ROUND(AVG(TotalPrice), 2) AS average_recorded_order_value
FROM orders
WHERE OrderDate IS NOT NULL
GROUP BY DATE_FORMAT(OrderDate, '%Y-%m')
ORDER BY order_month;

