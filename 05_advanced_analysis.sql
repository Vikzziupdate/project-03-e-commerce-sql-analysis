-- 05_advanced_analysis

-- Classify order values using CASE
SELECT OrderID, Product, TotalPrice,
    CASE
        WHEN TotalPrice < 500 THEN 'Low'
        WHEN TotalPrice < 1500 THEN 'Medium'
        ELSE 'High'
    END AS order_value_band
FROM orders
ORDER BY TotalPrice DESC; 

-- Find products above the overall average
SELECT Product, ROUND(AVG(TotalPrice), 2) AS average_product_order_value
FROM orders
GROUP BY Product
HAVING AVG(TotalPrice) > (
    SELECT AVG(TotalPrice)
    FROM orders
)
ORDER BY average_product_order_value DESC;



-- Rank products by recorded order value
WITH product_summary AS (
    SELECT
        Product,
        SUM(TotalPrice) AS total_recorded_order_value
    FROM orders
    GROUP BY Product
)
SELECT
    Product,
    ROUND(total_recorded_order_value, 2)
        AS total_recorded_order_value,
    RANK() OVER (
        ORDER BY total_recorded_order_value DESC
    ) AS product_rank
FROM product_summary
ORDER BY product_rank;

-- Compare order statuses by product
SELECT Product, OrderStatus, COUNT(*) AS order_count, ROUND(AVG(TotalPrice), 2) AS average_recorded_order_value
FROM orders
GROUP BY Product, OrderStatus
ORDER BY Product, order_count DESC;


-- Calculate status percentages within each product
WITH product_status AS (
    SELECT Product, OrderStatus, COUNT(*) AS status_count
    FROM orders
    GROUP BY Product, OrderStatus
)
SELECT Product, OrderStatus, status_count,
    ROUND(
        status_count * 100.0 /
        SUM(status_count) OVER (PARTITION BY Product),
        2
    ) AS percentage_within_product
FROM product_status
ORDER BY Product, percentage_within_product DESC; 