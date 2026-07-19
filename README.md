# 🛒 Zepto Product Data Analysis using SQL

## 🧾 Project Overview

This project analyzes Zepto's product catalog using PostgreSQL to uncover insights into pricing strategies, discount patterns, inventory availability, and category-level performance. The analysis focuses on answering business-oriented questions that can help optimize pricing decisions and inventory management.

---

## 🎯 Business Problem

Quick-commerce platforms like Zepto manage thousands of products across multiple categories. Understanding pricing strategies, discount trends, and inventory distribution is essential for maximizing revenue, improving stock management, and offering competitive pricing.

---

## 🎯 Objectives

- Analyze product pricing and discount strategies
- Identify high-value and heavily discounted products
- Detect premium products that are currently out of stock
- Estimate potential revenue across product categories
- Compare average discounts offered by different categories
- Evaluate inventory distribution based on product weight
- Generate business insights using SQL queries

---

## 📂 Dataset

- **Dataset:** Zepto Product Dataset
- **Source:** Kaggle
- **Format:** CSV
- **Size:** **3,733 rows × 9 columns**

### Dataset Columns

- Category
- Product Name
- MRP
- Discount Percentage
- Available Quantity
- Discounted Selling Price
- Weight (grams)
- Out of Stock Status
- Quantity

---

## 🗄 Database Schema

The project uses a single PostgreSQL table:

**Table:** `zepto`

| Column | Data Type |
|---------|-----------|
| sku_id | SERIAL (Primary Key) |
| category | VARCHAR(120) |
| name | VARCHAR(150) |
| mrp | NUMERIC |
| discountPercent | NUMERIC |
| availableQuantity | INTEGER |
| discountedSellingPrice | NUMERIC |
| weightInGms | INTEGER |
| outOfStock | BOOLEAN |
| quantity | INTEGER |

---

## 🧹 Data Cleaning

The following preprocessing steps were performed before analysis:

- Checked for missing values
- Identified products with invalid pricing (MRP = 0)
- Removed records containing invalid prices
- Converted prices from paise to rupees
- Verified dataset consistency before analysis

---

## 📊 Business Questions Answered

- Which products offer the highest discounts?
- Which expensive products are currently out of stock?
- Which product categories generate the highest potential revenue?
- Which premium products receive relatively low discounts?
- Which categories provide the highest average discounts?
- Which products offer the best value based on price per gram?
- How can products be categorized based on package weight?
- What is the total inventory weight available in each category?

---

## 📈 Key Insights

- Several product categories contribute significantly more potential revenue than others.
- High-MRP products are occasionally unavailable, highlighting inventory gaps.
- Discount strategies vary considerably across categories.
- Price-per-gram analysis helps identify premium and value-for-money products.
- Inventory weight distribution differs substantially between product categories.

---

## 💡 Business Recommendations

- Prioritize restocking high-value products that are currently unavailable.
- Review discount strategies for categories offering excessive discounts.
- Focus inventory planning on high-revenue product categories.
- Monitor price-per-unit metrics to improve pricing competitiveness.
- Optimize inventory allocation based on category demand and stock levels.

---

## 🧩 Skills Demonstrated

- SQL
- PostgreSQL
- Data Cleaning
- Exploratory Data Analysis (EDA)
- Business Analysis
- Inventory Analysis
- Data Aggregation

---

## 🛠 Tools Used

- PostgreSQL
- pgAdmin 4
- SQL

---

