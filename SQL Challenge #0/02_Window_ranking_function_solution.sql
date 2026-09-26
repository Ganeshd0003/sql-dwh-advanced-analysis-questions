USE DataWarehouse;
GO

SELECT
	p.product_name,
	ROW_NUMBER() OVER(ORDER BY sales_amount DESC) AS rn,
	RANK() OVER(ORDER BY sales_amount DESC) AS rnk,
	DENSE_RANK() OVER(ORDER BY sales_amount DESC) AS dns_rnk,
	NTILE(20000) OVER(ORDER BY sales_amount DESC) AS ntile20000,
	PERCENT_RANK() OVER(ORDER BY sales_amount DESC) AS percent_rnk,
	CUME_DIST() OVER(ORDER BY sales_amount DESC) AS cume_dist
FROM gold.fact_sales AS s
INNER JOIN gold.dim_products AS p
ON s.product_key = p.product_key;
