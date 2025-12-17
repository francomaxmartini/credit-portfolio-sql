-- Query 4: Payment Behavior
-- Purpose: Analyze payment behavior by loan and compare late payments ratio to dataset average

SET search_path TO credit_portfolio;

WITH loan_payment_stats AS (
    SELECT
        loan_id,
        COUNT(*) AS total_payments,
        SUM(CASE WHEN payment_status = 'Late' THEN 1 ELSE 0 END) AS late_payments,
        SUM(CASE WHEN payment_status = 'Missed' THEN 1 ELSE 0 END) AS missed_payments,
        SUM(CASE WHEN payment_status = 'Late' THEN 1 ELSE 0 END)::DECIMAL
            / NULLIF(COUNT(*), 0) AS late_ratio
    FROM payments
    GROUP BY loan_id
)

SELECT
    loan_id,
    total_payments,
    late_payments,
    missed_payments,
    ROUND(late_ratio, 2) AS late_ratio,
    ROUND(AVG(late_ratio) OVER (), 2) AS portfolio_avg_late_ratio,
    CASE WHEN late_ratio > AVG(late_ratio) OVER () THEN 1 ELSE 0 END AS worse_than_avg_flag
FROM loan_payment_stats
ORDER BY late_ratio DESC;
	
	