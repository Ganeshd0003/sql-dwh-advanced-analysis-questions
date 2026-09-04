USE datawarehouse;
GO

WITH CountrySales AS
(
    SELECT
        c.country,
        SUM(s.sales_amount) AS Total_Sales
    FROM gold.fact_sales AS s
    INNER JOIN gold.dim_customers AS c
        ON s.customer_key = c.customer_key
    GROUP BY c.country
)
SELECT 
    country,
    Total_Sales,
    CAST(
        ROUND(
            Total_Sales * 100.0 / SUM(Total_Sales) OVER(),
            2
        ) AS DECIMAL(10,2)
    ) AS sales_percentage
FROM CountrySales
ORDER BY sales_percentage DESC;
