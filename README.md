# 📊Credit Portfolio SQL Analysis

## 📌Project Overview
This project analyzes a **synthetic credit loan portfolio** using SQL.
The goal is to demonstrate **portfolio-level credit analytics**, including exposure, defaults, and payment behavior.

The project is intentionally focused on **SQL querying and data modeling**, with visualization (Power BI) planned as a later step.

## 🗂️ Project Structure
```
credit-portfolio-sql/
│
├── data/
│   ├── customers.csv
│   ├── loans.csv
│   └── payments.csv
│
├── sql/
│   ├── 00_exploration.sql
│   ├── 01_setup.sql
│   ├── 02_portfolio_overview.sql
│   ├── 03_exposure_by_region.sql
│   └── 04_payment_behavior.sql
│
├── screenshots/
│   ├── query2_portfolio_overview.png
│   ├── query3_exposure_by_region.png
│   └── query4_payment_behavior.png
│
└── README.md
```

## 🛠️ Tech Stack
- **PostgreSQL**
- SQL (CTEs, conditional aggregation, window functions)
- Synthetic CSV data

## 📁 Dataset Description
All data used in this project is **synthetic but realistic**, created for public sharing and portfolio use.

- **customers.csv**

Customer demographics and region

- **loans.csv**

Loan characteristics and status (Active, Defaulted, Closed)

- **payments.csv**

Historical payment behavior (On-time, Late, Missed)

## 📈 Analytical Queries

### 1️⃣ Portfolio Overview
- Total number of loans
- Total exposure
- Active vs defaulted exposure
- Portfolio default rate

📄 SQL: `02_portfolio_overview.sql`

📷 Output: `query2_portfolio_overview.png`

### 2️⃣ Exposure by Region
- Exposure split by region
- Defaulted exposure
- Default rate per region

📄 SQL: `03_exposure_by_region.sql`

📷 Output: `query3_exposure_by_region.png`

### 3️⃣ Payment Behavior Analysis
- Total payments per loan
- Late and missed payments
- Late payment ratio
- Comparison to portfolio average (window functions)

📄 SQL: `04_payment_behavior.sql`

📷 Output: `query4_payment_behavior.png`

## ⚠️ Disclaimer
This project uses **synthetic data** and does not represent real customer information.








