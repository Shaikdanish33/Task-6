# 📊 Sales Trend Analysis Using MySQL

This project showcases a data analyst's approach to understanding sales trends using SQL aggregations. The dataset contains real-world transactional data from an online retail system. The objective is to extract monthly sales insights, visualize order volumes, and identify peak-performing periods — all through SQL queries executed in MySQL Workbench.

---

## ✅ Project Objective

To analyze monthly revenue and order volume trends by applying SQL aggregate functions, grouping logic, and sorting techniques. This project demonstrates practical SQL skills relevant for any data analyst working with sales or e-commerce data.

---

## 🛠 Tools & Technologies

- **Database:** MySQL 8.0
- **Query Interface:** MySQL Workbench
- **Language:** SQL
- **Dataset Format:** CSV (`Sales_data-sample.csv`)

---

## 📂 Dataset Description

| Column Name   | Description                         |
|---------------|-------------------------------------|
| `order_id`    | Unique ID representing each order   |
| `order_date`  | Date on which the order was placed  |
| `amount`      | Revenue generated from the order    |
| `product_id`  | Code identifying the product sold   |

Rows: 2,823  
Time Span: Jan 2003 – Mar 2004

---

## 📊 SQL Queries & Insights

### 1. 📈 Monthly Revenue

Calculates total sales for each month.

```sql
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(amount) AS monthly_revenue
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;
```

### 2.Monthly Order Volume
Finds how many unique orders were placed per month.

```sql
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    COUNT(DISTINCT order_id) AS monthly_order_count
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;
```

### Top 3 Months by Revenue
Displays the top 3 months with highest total sales.

```sql
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(amount) AS total_revenue
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY total_revenue DESC
LIMIT 3;
```

### Revenue by Product
```sql
SELECT 
    product_id,
    SUM(amount) AS total_revenue
FROM orders
GROUP BY product_id
ORDER BY total_revenue DESC;
```


