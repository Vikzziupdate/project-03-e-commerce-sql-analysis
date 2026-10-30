-- 02_data_quality_checks

-- Check total records
SELECT COUNT(*) AS total_rows
FROM orders;

SELECT *
FROM orders
;
-- Check missing values
SELECT
    SUM(OrderID IS NULL) AS missing_order_ids,
    SUM(OrderDate IS NULL) AS missing_dates,
    SUM(CustomerID IS NULL) AS missing_customer_ids,
    SUM(Product IS NULL) AS missing_products,
    SUM(Quantity IS NULL) AS missing_quantities,
    SUM(UnitPrice IS NULL) AS missing_unit_prices,
    SUM(PaymentMethod IS NULL) AS missing_payment_methods,
    SUM(OrderStatus IS NULL) AS missing_statuses,
    SUM(TotalPrice IS NULL) AS missing_total_prices
FROM orders;

-- Check duplicate order IDs
SELECT OrderID, COUNT(*) AS record_count
FROM orders
GROUP BY OrderID
HAVING COUNT(*) > 1;

-- Identify invalid numeric values
SELECT * 
FROM orders
WHERE Quantity < 0
   OR ItemsInCart < 0
   OR UnitPrice < 0
   OR TotalPrice < 0;
 
 -- Inspect date coverage
SELECT
    MIN(OrderDate) AS earliest_order_date,
    MAX(OrderDate) AS latest_order_date
FROM orders;