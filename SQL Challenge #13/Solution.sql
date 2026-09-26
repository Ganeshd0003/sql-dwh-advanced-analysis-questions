USE DataWarehouse;
Go

WITH ttl_sales AS
(
	SELECT
		p.product_name,
		p.category,
		SUM(s.sales_amount) as total_sales
	FROM gold.fact_sales AS s
	INNER JOIN gold.dim_products AS p
		ON s.product_key = p.product_key
	GROUP BY
		p.product_name,
		p.category
)
SELECT 
	product_name,
	category,
	total_sales,
	CASE
		WHEN total_sales > 50000 THEN 'High Performer'
		WHEN total_sales >= 10000 THEN 'Mid Range'
		WHEN total_sales < 10000 THEN 'Low Performer'
	END AS product_segment
FROM ttl_sales
ORDER BY total_sales DESC;
