# Customer Retention & Cohort Analysis

## 📌 Project Overview

This project analyzes customer purchasing behavior for an online retail business to understand **sales performance, customer retention, repeat purchasing behavior, customer value, and product performance**.

The project follows an end-to-end **Data Analyst workflow**:

**Raw Data → Data Cleaning → Exploratory Data Analysis → Cohort Analysis → RFM Segmentation → SQL Business Analysis → Power BI Dashboard → Business Recommendations**

The primary objective is to convert transactional data into **actionable business insights** that can support customer retention and revenue-growth decisions.

---

## 🎯 Business Problem

For an online retail business, increasing sales is not only about acquiring new customers. Understanding whether customers return, how frequently they purchase, and which customers generate the most revenue is equally important.

This project addresses questions such as:

* How is revenue changing over time?
* How many customers are repeat customers?
* What percentage of customers return after their first purchase?
* Which customer cohorts have the strongest retention?
* Which customers generate the highest revenue?
* Which customers are at risk of becoming inactive?
* Which products generate the most revenue?
* Which countries contribute the most sales?
* What customer segments should receive targeted marketing?
* Where are the biggest opportunities for improving retention?

---

## 📊 Dataset

**Dataset:** UCI Online Retail Dataset

The dataset contains transactional records from a UK-based online retail business.

### Dataset Characteristics

* **Transactions:** 541,909
* **Period:** December 2010 – December 2011
* **Business Type:** Online Retail
* **Geography:** Multiple countries
* **Primary Unit of Analysis:** Customer transactions

### Important Columns

| Column        | Description                       |
| ------------- | --------------------------------- |
| `InvoiceNo`   | Unique transaction/invoice number |
| `StockCode`   | Product code                      |
| `Description` | Product description               |
| `Quantity`    | Number of units purchased         |
| `InvoiceDate` | Transaction date and time         |
| `UnitPrice`   | Price per unit                    |
| `CustomerID`  | Unique customer identifier        |
| `Country`     | Customer's country                |

---

## 🛠️ Tools & Technologies

| Tool             | Purpose                                    |
| ---------------- | ------------------------------------------ |
| **Python**       | Data cleaning, transformation and analysis |
| **Pandas**       | Data manipulation                          |
| **NumPy**        | Numerical operations                       |
| **Matplotlib**   | Data visualization                         |
| **Seaborn**      | Statistical visualization                  |
| **SQL / MySQL**  | Business analysis and querying             |
| **Power BI**     | Interactive dashboard and reporting        |
| **Git & GitHub** | Version control and project documentation  |

---

# 🔹 1. Data Cleaning

The raw dataset was first inspected to understand its structure and identify potential data-quality issues.

### Cleaning Workflow

1. Load raw Excel dataset
2. Inspect rows, columns and data types
3. Analyze missing values
4. Identify cancelled orders
5. Analyze invalid transactions
6. Identify duplicate records
7. Clean the dataset
8. Perform feature engineering
9. Generate final data-quality report
10. Export cleaned dataset

### Cancelled Orders

Invoices beginning with `C` were treated as cancelled transactions and separated from the main sales dataset.

Cancelled transactions were saved separately for audit/reference purposes.

### Invalid Transactions

Transactions with:

```text
Quantity <= 0
UnitPrice <= 0
```

were investigated and excluded from the completed-sales analysis.

### Missing Customer IDs

Records without `CustomerID` were excluded from customer-level analysis because customer identification is required for:

* Retention analysis
* Cohort analysis
* RFM segmentation
* Customer-level revenue analysis

### Duplicate Records

Exact duplicate transactions were identified and removed to prevent double counting.

---

# 🔹 2. Feature Engineering

Additional business-friendly features were created to support analysis.

### Revenue

```text
Revenue = Quantity × UnitPrice
```

### Additional Features

* Year
* Month
* Year-Month
* Day
* Day of Week
* Hour
* Transaction Month

These features enable time-based and customer-behavior analysis.

---

# 🔹 3. Exploratory Data Analysis

EDA was performed to understand overall sales and customer behavior.

### Revenue Analysis

Analyzed:

* Total revenue
* Monthly revenue
* Monthly revenue growth
* Revenue trends

### Order Analysis

Analyzed:

* Total orders
* Monthly order volume
* Average Order Value (AOV)

### Customer Analysis

Analyzed:

* Total customers
* Revenue per customer
* Orders per customer
* Top customers
* One-time customers
* Repeat customers

### Product Analysis

Analyzed:

* Top products by revenue
* Top products by quantity
* Product contribution to sales

### Geographic Analysis

Analyzed:

* Revenue by country
* Customers by country
* Orders by country
* International market performance

### Time Analysis

Analyzed purchasing behavior by:

* Day of week
* Hour of day
* Month

---

# 🔹 4. Customer Retention Analysis

A key objective of this project is understanding whether customers return after their initial purchase.

Customers were classified into:

* One-time customers
* Repeat customers

The repeat customer rate was calculated to evaluate customer retention.

### Business Question

> How effectively does the business convert first-time customers into repeat customers?

---

# 🔹 5. Cohort Analysis

Customers were grouped according to their **first purchase month**.

For example:

```text
January 2011 first-time customers
→ January 2011 Cohort
```

Their activity was then tracked across subsequent months.

### Metrics

* Cohort size
* Month 0 retention
* Month 1 retention
* Month 2 retention
* Month 3 retention
* Long-term retention

### Cohort Retention Matrix

The retention matrix allows comparison of customer behavior across acquisition cohorts.

### Business Question

> Which customer acquisition cohorts demonstrate stronger long-term retention?

This helps identify whether customer quality or retention behavior is changing over time.

---

# 🔹 6. RFM Customer Segmentation

RFM analysis was performed to understand customer value.

### RFM Framework

| Metric        | Meaning                           |
| ------------- | --------------------------------- |
| **Recency**   | How recently a customer purchased |
| **Frequency** | How often a customer purchased    |
| **Monetary**  | How much a customer spent         |

Customers were scored based on these three dimensions.

### Customer Segments

The analysis identifies segments such as:

* 🏆 Champions
* 💎 Loyal Customers
* 🌱 Potential Loyalists
* 🆕 Recent Customers
* ⚠️ At Risk
* 👀 Need Attention
* 🔴 Lost Customers

### Business Objective

The purpose is to move from:

**"What happened?"**

to:

**"Which customers should the business focus on?"**

---

# 🔹 7. SQL Business Analysis

SQL was used to answer practical business questions from the cleaned transactional dataset.

### Analysis Includes

* Total revenue
* Total orders
* Total customers
* Average Order Value
* Monthly revenue
* Monthly revenue growth
* Running revenue totals
* Top customers
* Customer ranking
* Repeat customer analysis
* Top products
* Country performance
* Customer lifetime metrics
* Revenue concentration
* Customer segmentation

### SQL Concepts Demonstrated

```text
SELECT
WHERE
GROUP BY
HAVING
ORDER BY
CASE
Aggregate Functions
Subqueries
CTEs
Window Functions
LAG()
RANK()
DENSE_RANK()
PARTITION BY
```

The objective was to demonstrate SQL from a **business-analysis and interview perspective**, rather than only writing basic queries.

---

# 🔹 8. Power BI Dashboard

The analysis was converted into an interactive Power BI dashboard.

## Page 1 — Executive Overview

### KPIs

* Total Revenue
* Total Orders
* Total Customers
* Average Order Value
* Revenue per Customer

### Visuals

* Monthly Revenue Trend
* Monthly Orders Trend
* Revenue by Country
* Sales Performance Overview

---

## Page 2 — Customer Retention & Cohort Analysis

### Metrics

* New Customers
* Repeat Customers
* Repeat Customer %
* Cohort Retention

### Visuals

* New vs Repeat Customers
* Cohort Retention Heatmap
* Retention Trend
* Customer Acquisition Trend

---

## Page 3 — RFM & Product Analysis

### Visuals

* Customer Segmentation
* Revenue by Customer Segment
* Top Products
* Product Revenue
* Quantity Sold
* Customer/Geographic filters

### Interactive Filters

* Year
* Month
* Country
* Customer Segment
* Product

---

# 🔹 9. Key Business Insights

The analysis focuses on identifying actionable patterns rather than simply presenting charts.

Examples of insights investigated include:

### Customer Retention

A significant difference between first-time and repeat customers can indicate an opportunity to improve post-purchase engagement.

### Cohort Retention

Comparing cohorts helps identify whether customers acquired during different periods demonstrate different retention behavior.

### Customer Value

RFM segmentation highlights high-value customers who contribute significant revenue and customers who may require reactivation.

### Revenue Concentration

Pareto analysis helps determine whether a relatively small group of customers contributes a disproportionate share of total revenue.

### Product Performance

Top products can be identified based on revenue and quantity to support product-level decisions.

### Geographic Performance

Country-level analysis highlights the strongest markets and potential areas for expansion.

---

# 🔹 10. Business Recommendations

Based on the analysis, potential business actions include:

### 🏆 Retain High-Value Customers

Create loyalty programs, exclusive offers and personalized recommendations for Champions and Loyal Customers.

### 🔄 Improve Second-Purchase Conversion

Target first-time customers with:

* Follow-up campaigns
* Personalized product recommendations
* Limited-time offers
* Second-purchase incentives

### ⚠️ Reactivate At-Risk Customers

Use targeted win-back campaigns for customers whose purchase activity has declined.

### 📈 Improve Customer Lifetime Value

Encourage repeat purchases through:

* Cross-selling
* Upselling
* Product recommendations
* Loyalty incentives

### 🌍 Focus on High-Performing Markets

Use country-level revenue and customer metrics to prioritize markets with stronger commercial potential.

---

# 🔹 11. Data Quality Report

A final data-quality report was created after cleaning.

The report tracks:

| Metric                   | Purpose                            |
| ------------------------ | ---------------------------------- |
| Initial Rows             | Understand raw dataset size        |
| Cancelled Transactions   | Measure removed cancellations      |
| Invalid Transactions     | Identify invalid sales records     |
| Missing Customer IDs     | Measure customer-data completeness |
| Duplicate Rows           | Detect duplicate records           |
| Final Rows               | Confirm cleaned dataset            |
| Unique Customers         | Validate customer population       |
| Unique Orders            | Validate order population          |
| Total Revenue            | Validate financial metric          |
| Remaining Missing Values | Final quality check                |
| Remaining Duplicates     | Final quality check                |

---

# 📁 Project Structure

```text
customer-retention-cohort-analysis/
│
├── data/
│   ├── raw/
│   │   └── Online Retail.xlsx
│   │
│   ├── cleaned/
│   │   └── online_retail_cleaned.csv
│   │
│   └── excluded/
│       ├── cancelled_orders.csv
│       ├── missing_customer_id.csv
│       ├── invalid_quantity.csv
│       └── invalid_price.csv
│
├── notebooks/
│   ├── 01_data_cleaning.ipynb
│   ├── 02_exploratory_data_analysis.ipynb
│   ├── 03_cohort_analysis.ipynb
│   └── 04_rfm_customer_segmentation.ipynb
│
├── sql/
│   └── 05_sql_business_analysis.sql
│
├── powerbi/
│   └── 06_customer_retention_dashboard.pbix
│
├── images/
│   ├── executive_overview.png
│   ├── cohort_analysis.png
│   └── rfm_segmentation.png
│
└── README.md
```

---

# 📌 Skills Demonstrated

### Data Analysis

* Data Cleaning
* Data Validation
* Exploratory Data Analysis
* Customer Analysis
* Retention Analysis
* Cohort Analysis
* RFM Segmentation
* Business Analytics

### Python

* Pandas
* NumPy
* Matplotlib
* Seaborn
* Data Transformation
* Feature Engineering

### SQL

* Joins
* Aggregations
* CTEs
* Subqueries
* CASE Statements
* Window Functions
* Ranking
* Time-based Analysis

### Power BI

* Data Modeling
* DAX
* KPI Design
* Interactive Dashboards
* Slicers
* Business Reporting

### Business Skills

* Problem Solving
* KPI Development
* Customer Segmentation
* Insight Generation
* Data Storytelling
* Business Recommendations

---

# 🎯 Project Outcome

This project demonstrates an end-to-end approach to solving a real-world business analytics problem:

> **How can transactional data be used to understand customer behavior, improve retention, identify high-value customers, and support revenue-growth decisions?**

The project combines **Python, SQL and Power BI** to transform raw transactional data into a structured business intelligence solution.

---

# 💼 Data Analyst Interview Perspective

This project demonstrates the ability to:

**1. Understand a business problem**
↓
**2. Inspect and clean raw data**
↓
**3. Validate data quality**
↓
**4. Perform exploratory analysis**
↓
**5. Analyze customer behavior**
↓
**6. Measure retention**
↓
**7. Segment customers**
↓
**8. Answer business questions using SQL**
↓
**9. Build an interactive Power BI dashboard**
↓
**10. Communicate actionable recommendations**

This makes the project suitable for demonstrating practical **Data Analyst skills in interviews and portfolio reviews**.

---

## 👤 Author

**Anurag**

Data Analyst | Python | SQL | Power BI | Excel | Statistics

GitHub: `anuragrajputetw10`

---

## 📚 Dataset Source

UCI Machine Learning Repository — Online Retail Dataset

Dataset: **Online Retail**

The dataset is provided by the UCI Machine Learning Repository and is licensed under **CC BY 4.0**.
