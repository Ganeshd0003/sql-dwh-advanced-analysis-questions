USE DataWarehouse;
GO

SELECT TOP 10
	p.product_name, 
	SUM(s.sales_amount) AS Total_Sales
FROM gold.dim_products AS p
INNER JOIN gold.fact_sales AS s
	ON p.product_key = s.product_key
GROUP BY p.product_name
ORDER BY Total_Sales DESC;
