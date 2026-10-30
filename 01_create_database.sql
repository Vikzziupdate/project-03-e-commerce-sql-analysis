-- 01_create_database


CREATE DATABASE ecommerce_sql_project;

USE ecommerce_sql_project;



CREATE TABLE orders (
    OrderID       VARCHAR(50) PRIMARY KEY,
    OrderDate     DATE,
    CustomerID    VARCHAR(50),
    Product       VARCHAR(100),
    Quantity      INT,
    UnitPrice     DECIMAL(12,2),
    ShippingAddress VARCHAR(100),
    PaymentMethod VARCHAR(50),
    OrderStatus   VARCHAR(50),
    TrackingNumber VARCHAR(100),
    ItemsInCart   INT,
    CouponCode    VARCHAR(100),
    ReferralSource VARCHAR(100),
    TotalPrice    DECIMAL(12,2)
    );




