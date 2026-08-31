USE DataWarehouse;
GO

SELECT 
    c.country,
    SUM(s.sales_amount) AS total_sales
FROM gold.dim_customers AS c
INNER JOIN gold.fact_sales AS s
    ON c.customer_key = s.customer_key
GROUP BY 
    c.country
ORDER BY 
    total_sales DESC;
