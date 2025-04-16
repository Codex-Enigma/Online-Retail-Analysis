# 🛒 Online Retail Sales Trend Analysis (SQL)

This project analyzes sales trends and customer behavior using a real-world UK-based online retail dataset. It focuses on deriving key insights like revenue growth, country performance, and product demand using SQL queries on a cleaned transactional dataset of **541,909 rows**.

---

## 📁 Dataset Overview

The dataset includes the following columns:

- `InvoiceNo` – Unique invoice number  
- `StockCode` – Product/item code  
- `Description` – Product name  
- `Quantity` – Quantity sold  
- `InvoiceDate` – Date and time of the invoice  
- `UnitPrice` – Price per item  
- `CustomerID` – Customer identifier  
- `Country` – Customer location  

> ⚠️ Note: `InvoiceDate` was originally a string. It was converted to `DATETIME` format using:
```
UPDATE RETAIL
SET InvoiceDate = STR_TO_DATE(InvoiceDate, '%Y-%m-%d %H:%i:%s')
WHERE InvoiceDate IS NULL OR STR_TO_DATE(InvoiceDate, '%Y-%m-%d %H:%i:%s') IS NOT NULL; 
```

# 🧰 Tools & Technologies
SQL (MySQL / PostgreSQL / SQLite)

Data Cleaning – STR_TO_DATE, removing nulls, duplicates

Aggregation Functions – SUM(), COUNT(), ROUND()

Date Functions – EXTRACT(YEAR | MONTH), GROUP BY, ORDER BY



## Insights 
- 2011 saw a massive increase in both orders and revenue compared to 2010.
   - 2010: 2,025 orders → £741,720
   - 2011: 23,875 orders → £8,824,910

- The United Kingdom dominated sales with over £8 million in revenue.

- Top international contributors: Netherlands, EIRE, Germany, France.
- These products had the highest purchase volumes:
- WORLD WAR 2 GLIDERS ASSTD DESIGNS – 53,847 units
- JUMBO BAG RED RETROSPOT – 47,363 units
- ASSORTED COLOUR BIRD ORNAMENT – 36,381 units
- POPCORN HOLDER, CAKE CASES, and more...
- Sales steadily increased throughout 2011, peaking around September–October.
- The average order value in 2011 ranged between £270–£430, with September 2011 having the highest AOV at £428.79.

# 📦 Business Insights Summary
- 📈 2011 saw 10x growth in orders and revenue over 2010
- 🇬🇧  UK generated over 90% of the revenue
- 🛍️ Top products were mostly gift items, vintage goods, and themed packaging
- 📅 Sales peak during the holiday season (Q4), highlighting the importance of seasonal strategy
- 💰 High AOV months offer opportunities for targeted promotions

#📌 Conclusion
This SQL-based analysis helps stakeholders understand customer behavior, best-selling products, and revenue trends. These insights can guide strategic decisions like inventory stocking, promotional timing, and country-wise marketing.
