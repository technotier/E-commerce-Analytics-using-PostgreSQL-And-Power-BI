# 🛒 E-commerce Analytics with PostgreSQL and Power BI
# 📌 Project Overview

End-to-end e-commerce analytics data model built using Snowflake

Designed using star schema for scalable reporting and ad-hoc analysis

Transforms raw transactional data into analytics-ready dimension and fact tables

# 🗂️ Schema Architecture
## 🔹 Raw Schema (raw_schema)

customers – customer master data

category – product category reference

products – product master data

orders – customer order headers

order_items – order-level line items

# 🔹 Analytics Schema (analytics_schema)
## 📐 Dimension Tables

dim_customers

Customer profile and demographics

Age, age group, customer tenure, loyalty segmentation

dim_products

Combined product and category data

Sale price, cost price, profit, margin percentage

Stock status and price segmentation

dim_date

Calendar attributes (year, month, quarter, weekday)

Weekend/weekday flags, seasonality, holidays

# 📊 Fact Table

## fact_sales

Grain: one row per order item per order per day

Built from orders, order items, and product dimensions

Metrics:

Gross amount, net amount, discounts

Cost, profit, order size classification

# ⭐ Key Features

Star schema–based data modeling

Production-ready Snowflake SQL

Data cleansing and type standardization

Business-driven feature engineering

Date-key based time-series analysis

Optimized for ad-hoc analytical queries

# 📈 Analytics Use Cases

Sales and revenue trend analysis

Product and category performance

Customer purchasing behavior

Discount impact analysis

Profitability and margin analysis

# 🛠️ Technology Stack

Snowflake

SQL

# 📌 Purpose

Demonstrates real-world analytics engineering concepts

Suitable for data analyst and analytics engineer portfolios

Designed for interview-ready business analysis scenarios
