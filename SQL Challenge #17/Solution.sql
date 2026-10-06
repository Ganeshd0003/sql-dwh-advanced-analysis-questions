USE DataWarehouse;
GO
  
WITH customer_sales AS
(
    SELECT 
        c.country,
        c.first_name AS f,
        c.last_name AS l,
        SUM(f.sales_amount) AS total_sales
    FROM gold.fact_sales AS f
    INNER JOIN gold.dim_customers AS c
        ON f.customer_key = c.customer_key
    GROUP BY
        c.country,
        c.first_name,
        c.last_name
),
customer_sales_with_country_total AS
(
    SELECT
        country,
        CONCAT(f, ' ', l) AS customer_name,
        total_sales,
        SUM(total_sales) OVER(PARTITION BY country) AS country_total_sales
    FROM customer_sales
)
SELECT
    country,
    customer_name,
    total_sales,
    country_total_sales,
    total_sales * 100.0 / NULLIF(country_total_sales, 0) AS sales_percentage
FROM customer_sales_with_country_total
ORDER BY country, sales_percentage DESC;
