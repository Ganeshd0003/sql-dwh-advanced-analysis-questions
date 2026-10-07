USE DataWarehouse;
GO

WITH total_sales_by_cat AS
(
	SELECT
		p.category,
		p.product_name,
		SUM(s.sales_amount) as total_sales
	FROM gold.fact_sales AS s
	INNER JOIN gold.dim_products AS p
		ON s.product_key = p.product_key
	GROUP BY
		p.category,
		p.product_name
)
SELECT 
	category,
	product_name,
	total_sales,
	RANK() OVER(PARTITION BY category ORDER BY total_sales DESC) as category_rank
FROM total_sales_by_cat;
