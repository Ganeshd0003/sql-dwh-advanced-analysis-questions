USE DataWarehouse;
GO

SELECT 
	c.Gender, 
	SUM(s.Sales_Amount) AS Total_Sales 
FROM gold.dim_customers AS c
INNER JOIN gold.fact_sales AS s
	ON c.customer_key = s.customer_key
GROUP BY c.Gender
ORDER BY Total_Sales DESC
