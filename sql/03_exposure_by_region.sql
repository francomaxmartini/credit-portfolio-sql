-- Query 3: Exposure by Region
-- Purpose: Analyze loan exposure and default rates by customer region

SET search_path TO credit_portfolio;

SELECT
	c.region,
	SUM(CASE WHEN l.loan_status IN ('Active', 'Defaulted') THEN l.loan_amount ELSE 0 END) AS total_exposure,
    SUM(CASE WHEN l.loan_status = 'Defaulted' THEN l.loan_amount ELSE 0 END) AS defaulted_exposure,
    ROUND(SUM(CASE WHEN l.loan_status = 'Defaulted' THEN 1 ELSE 0 END)::DECIMAL
        / NULLIF(COUNT(l.loan_id), 0), 2) AS default_rate
FROM customers c
LEFT JOIN loans l
    ON c.customer_id = l.customer_id
GROUP BY c.region
ORDER BY default_rate DESC;

