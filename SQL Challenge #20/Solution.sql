USE datawarehouse;
GO

WITH cst_ord_details AS
(
	SELECT
		c.customer_key,
		CONCAT(c.first_name,' ',c.last_name) as customer_name,
		COUNT(DISTINCT s.order_number) AS total_orders,
		MIN(s.order_date) AS first_order_date,
		MAX(s.order_date) AS last_order_date,
		SUM(s.sales_amount) AS total_sales
	FROM gold.fact_sales AS s
	INNER JOIN gold.dim_customers AS c
		ON s.customer_key = c.customer_key
	WHERE order_date IS NOT NULL
	GROUP BY
		c.customer_key,
		c.first_name,
		c.last_name
)
SELECT
	customer_name,
	total_orders,
	first_order_date,
	last_order_date,
	total_sales,
	CASE
		WHEN total_orders = 1 THEN 'One Time Customer'
		ELSE 'Repeat Customer'
	END AS customer_type
FROM cst_ord_details
ORDER BY total_sales DESC
