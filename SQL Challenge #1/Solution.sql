USE DataWarehouse;
GO

SELECT 
    c.country,
    SUM(s.sales_amount) AS total_sales
FROM gold.fact_sales AS s
INNER JOIN gold.dim_customers AS c
    ON s.customer_key = c.customer_key
GROUP BY c.country
ORDER BY total_sales DESC;
