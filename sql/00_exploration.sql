-- Query 0: Exploration
-- Purpose: Dig into the data structure for better analysis

SET search_path TO credit_portfolio;

-- 02_portfolio_overview exploration
SELECT * FROM loans
LIMIT 5;

SELECT DISTINCT loan_status FROM loans;

-- 03_exposure_by_region exploration
SELECT * FROM customers LIMIT 1;
SELECT * FROM loans LIMIT 1;

SELECT DISTINCT region FROM customers;

-- 04_payment_behavior exploration
SELECT * FROM payments LIMIT 1;
SELECT DISTINCT payment_status FROM payments;
SELECT * FROM payments WHERE payment_status='Missed' LIMIT 5;