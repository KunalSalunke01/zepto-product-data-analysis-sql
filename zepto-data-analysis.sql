/*====================================================================
                    ZEPTO DATA ANALYSIS USING SQL
======================================================================

Project : Zepto Grocery Data Analysis
Database: PostgreSQL

Description:
This project analyzes Zepto's product inventory to identify pricing
patterns, discount strategies, inventory status, and category-level
business insights using SQL.

====================================================================*/


/*====================================================================
1. DATABASE SETUP
====================================================================*/

-- Remove table if it already exists
DROP TABLE IF EXISTS zepto;

-- Create table
CREATE TABLE zepto(
    sku_id SERIAL PRIMARY KEY,
    category VARCHAR(120),
    name VARCHAR(150) NOT NULL,
    mrp NUMERIC(8,2),
    discountPercent NUMERIC(5,2),
    availableQuantity INTEGER,
    discountedSellingPrice NUMERIC(8,2),
    weightInGms INTEGER,
    outOfStock BOOLEAN,
    quantity INTEGER
);

-- Import CSV (UTF-8 Encoding)
-- COPY zepto(...)
-- FROM 'path/to/zepto.csv'
-- CSV HEADER;


/*====================================================================
2. DATA EXPLORATION
====================================================================*/

-- Q1. Total number of products in the dataset

SELECT COUNT(*) AS total_products
FROM zepto;


-- Q2. Preview the dataset

SELECT *
FROM zepto;


-- Q3. Check for missing values

SELECT *
FROM zepto
WHERE category IS NULL
   OR name IS NULL
   OR mrp IS NULL
   OR discountPercent IS NULL
   OR availableQuantity IS NULL
   OR discountedSellingPrice IS NULL
   OR weightInGms IS NULL
   OR outOfStock IS NULL
   OR quantity IS NULL;


/*====================================================================
3. DATA CLEANING
====================================================================*/

-- Q4. Identify products having invalid prices

SELECT *
FROM zepto
WHERE mrp = 0
   OR discountedSellingPrice = 0;


-- Q5. Remove invalid records

DELETE
FROM zepto
WHERE mrp = 0
   OR discountedSellingPrice = 0;


-- Q6. Convert prices from paise to rupees

UPDATE zepto
SET
    mrp = mrp / 100.0,
    discountedSellingPrice = discountedSellingPrice / 100.0;


/*====================================================================
4. BUSINESS ANALYSIS
====================================================================*/


-- Business Question 1
-- Which products offer the highest discounts?

SELECT
    category,
    name,
    mrp,
    discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;



-- Business Question 2
-- Which high-priced products are currently out of stock?

SELECT
    category,
    name,
    mrp
FROM zepto
WHERE outOfStock = TRUE
ORDER BY mrp DESC
LIMIT 10;



-- Business Question 3
-- Which product categories generate the highest potential revenue?

SELECT
    category,
    SUM(discountedSellingPrice * availableQuantity) AS potential_revenue
FROM zepto
GROUP BY category
ORDER BY potential_revenue DESC;



-- Business Question 4
-- Which premium products (MRP > ₹500) have relatively low discounts?

SELECT DISTINCT
    name,
    mrp,
    discountPercent
FROM zepto
WHERE mrp > 500
ORDER BY mrp DESC,
         discountPercent ASC;



-- Business Question 5
-- Which categories provide the highest average discounts?

SELECT
    category,
    ROUND(AVG(discountPercent),2) AS average_discount
FROM zepto
GROUP BY category
ORDER BY average_discount DESC
LIMIT 5;



-- Business Question 6
-- Which products offer the best value based on price per gram?

SELECT
    name,
    discountedSellingPrice,
    weightInGms,
    ROUND(discountedSellingPrice / weightInGms,2) AS price_per_gram
FROM zepto
WHERE weightInGms > 0
ORDER BY price_per_gram;



-- Business Question 7
-- Categorize products based on package weight

SELECT
    name,
    weightInGms,
    CASE
        WHEN weightInGms < 1000 THEN 'Low'
        WHEN weightInGms < 5000 THEN 'Medium'
        ELSE 'Bulk'
    END AS weight_category
FROM zepto;



-- Business Question 8
-- Calculate total inventory weight available in each category

SELECT
    category,
    ROUND(SUM(weightInGms * availableQuantity) / 1000.0,2)
    AS inventory_weight_kg
FROM zepto
GROUP BY category
ORDER BY inventory_weight_kg DESC;


/*====================================================================
END OF PROJECT
====================================================================*/