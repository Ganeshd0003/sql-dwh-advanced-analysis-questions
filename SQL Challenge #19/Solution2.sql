USE DataWarehouse;
GO

WITH cst_last_ord AS
(
	SELECT
		c.customer_key,
		CONCAT(ISNULL(c.first_name,''),' ',ISNULL(c.last_name,'')) AS customer_name,
		MAX(s.order_date) AS last_order_date,
		DATEDIFF(MONTH,MAX(s.order_date),GETDATE()) AS months_since_last_order
	FROM gold.fact_sales AS s
	INNER JOIN gold.dim_customers AS c
		ON s.customer_key = c.customer_key
	WHERE s.order_date IS NOT NULL
	GROUP BY
		c.customer_key,
		c.first_name,
		c.last_name
)
SELECT
	customer_name,
	last_order_date,
	months_since_last_order,
	CASE
		WHEN months_since_last_order BETWEEN 0 AND 3 THEN 'Recent Customer'
		WHEN months_since_last_order BETWEEN 4 AND 6 THEN 'At Risk'
		WHEN months_since_last_order BETWEEN 7 AND 12 THEN 'Inactive'
		ELSE 'Churned'
	END AS regency_segment
FROM cst_last_ord
ORDER BY months_since_last_order DESC;
