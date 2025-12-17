-- 1. Create Tables
CREATE TABLE credit_portfolio.customers (
    customer_id        INT PRIMARY KEY,
    age                INT,
    income             INT,
    employment_status  VARCHAR(30),
    region             VARCHAR(30)
);

CREATE TABLE credit_portfolio.loans (
    loan_id            INT PRIMARY KEY,
    customer_id        INT REFERENCES credit_portfolio.customers(customer_id),
    origination_date   DATE,
    loan_amount        NUMERIC(12,2),
    interest_rate      NUMERIC(6,4),
    term_months        INT,
    loan_status        VARCHAR(20),
    default_date       DATE
);

CREATE TABLE credit_portfolio.payments (
    payment_id         INT PRIMARY KEY,
    loan_id            INT REFERENCES credit_portfolio.loans(loan_id),
    payment_date       DATE,
    amount_paid        NUMERIC(12,2),
    payment_status     VARCHAR(20)
);

-- 2. Validate the Import
SELECT COUNT(*) FROM credit_portfolio.customers;
SELECT COUNT(*) FROM credit_portfolio.loans;
SELECT COUNT(*) FROM credit_portfolio.payments;

SELECT * FROM credit_portfolio.loans LIMIT 5;

-- 3. Relational sanity check
SELECT
    l.loan_id,
    c.region,
    l.loan_amount
FROM credit_portfolio.loans l
JOIN credit_portfolio.customers c
    ON l.customer_id = c.customer_id
LIMIT 10;