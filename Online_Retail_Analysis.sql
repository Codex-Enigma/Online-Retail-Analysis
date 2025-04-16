CREATE DATABASE ONLINE_RETAIL;
USE ONLINE_RETAIL;
CREATE TABLE RETAIL (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description TEXT,
    Quantity INT,
    InvoiceDate VARCHAR(20),
    UnitPrice INT,
    CustomerID VARCHAR(20),
    Country VARCHAR(30)
);

select * 
from retail
limit 10;

SET SQL_SAFE_UPDATES = 0;

UPDATE RETAIL
SET InvoiceDate = STR_TO_DATE(InvoiceDate, '%Y-%m-%d %H:%i:%s')
WHERE InvoiceDate IS NULL OR STR_TO_DATE(InvoiceDate, '%Y-%m-%d %H:%i:%s') IS NOT NULL;

SELECT * 
FROM RETAIL
LIMIT 10;

-- What is the monthly revenue and number of orders for each month and year based on the sales data?
SELECT 
    EXTRACT(YEAR FROM InvoiceDate) AS OrderYear,
    EXTRACT(MONTH FROM InvoiceDate) AS OrderMonth,
    ROUND(SUM(UnitPrice * Quantity), 2) AS TotalRevenue,
    COUNT(DISTINCT InvoiceNo) AS OrderVolume
FROM RETAIL
WHERE InvoiceDate IS NOT NULL
GROUP BY OrderYear, OrderMonth
ORDER BY OrderYear, OrderMonth;

-- Year-wise Total Orders & Revenue
SELECT 
    EXTRACT(YEAR FROM InvoiceDate) AS OrderYear,
    COUNT(DISTINCT InvoiceNo) AS TotalOrders,
    ROUND(SUM(UnitPrice * Quantity), 2) AS TotalRevenue
FROM RETAIL
WHERE InvoiceDate IS NOT NULL
GROUP BY OrderYear
ORDER BY OrderYear;

-- Top 10 Countries by Revenue
SELECT 
    Country,
    ROUND(SUM(UnitPrice * Quantity), 2) AS TotalRevenue
FROM RETAIL
WHERE InvoiceDate IS NOT NULL
GROUP BY Country
ORDER BY TotalRevenue DESC
LIMIT 10;

-- Top 10 Most Ordered Products (by Quantity)
SELECT 
    Description,
    SUM(Quantity) AS TotalQuantity
FROM RETAIL
WHERE InvoiceDate IS NOT NULL AND Description IS NOT NULL
GROUP BY Description
ORDER BY TotalQuantity DESC
LIMIT 10;

 -- Monthly Average Order Value (AOV)
SELECT 
    EXTRACT(YEAR FROM InvoiceDate) AS OrderYear,
    EXTRACT(MONTH FROM InvoiceDate) AS OrderMonth,
    ROUND(SUM(UnitPrice * Quantity) / COUNT(DISTINCT InvoiceNo), 2) AS AvgOrderValue
FROM RETAIL
WHERE InvoiceDate IS NOT NULL
GROUP BY OrderYear, OrderMonth
ORDER BY OrderYear, OrderMonth;

