USE datawarehouse;
GO

SELECT 
	p.category, 
	SUM(s.sales_amount) AS Total_Sales 
FROM gold.fact_sales AS s 
INNER JOIN gold.dim_products AS p
	ON s.product_key = p.product_key
GROUP BY p.category
ORDER BY Total_Sales DESC;
