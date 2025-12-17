-- Query 2: Portfolio Overview
-- Purpose: Analyze exposure distribution by status and default rate

SET search_path TO credit_portfolio;

SELECT 
	COUNT(*) AS total_loans,
	SUM(CASE WHEN loan_status IN ('Active', 'Defaulted') THEN loan_amount ELSE 0 END) AS total_exposure,
	SUM(CASE WHEN loan_status = 'Active' THEN loan_amount ELSE 0 END) AS active_exposure,
	SUM(CASE WHEN loan_status = 'Defaulted' THEN loan_amount ELSE 0 END) AS defaulted_exposure,
	ROUND(COUNT(CASE WHEN loan_status = 'Defaulted' THEN 1 END):: DECIMAL
	/ NULLIF(COUNT(loan_id),0),2) AS default_rate
FROM loans;
	
 	