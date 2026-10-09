USE DataWarehouse;
GO

WITH cust_min_ord_dt AS
(
	SELECT
		c.customer_key,
		CONCAT(c.first_name,' ',c.last_name) AS customer_name,
		MAX(s.order_date) AS last_order_date
	FROM gold.fact_sales AS s
	INNER JOIN gold.dim_customers AS c
		ON s.customer_key = c.customer_key
	WHERE s.order_date IS NOT NULL
	GROUP BY
		c.customer_key,
		c.first_name,
		c.last_name
),
mnt_lst_ord AS (
SELECT
	customer_name,
	last_order_date,
	DATEDIFF(MONTH, last_order_date, GETDATE()) AS months_since_last_order
FROM cust_min_ord_dt)
SELECT
	customer_name,
	last_order_date,
	months_since_last_order,
	CASE
		WHEN months_since_last_order BETWEEN 0 AND 3 THEN 'Recent Customer'
		WHEN months_since_last_order BETWEEN 4 AND 6 THEN 'At Risk'
		WHEN months_since_last_order BETWEEN 7 AND 12 THEN 'Inactive'
		ELSE 'Churned'
	END	AS recency_segment
FROM mnt_lst_ord
ORDER BY months_since_last_order DESC
