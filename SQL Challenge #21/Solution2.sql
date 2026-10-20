USE DataWarehouse;
GO

WITH customer_sales AS
(
    SELECT
        s.customer_key,
        SUM(s.sales_amount) AS total_sales
    FROM gold.fact_sales AS s
    GROUP BY
        s.customer_key
),
customer_metrics AS
(
    SELECT
        cs.customer_key,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        c.country,
        cs.total_sales,
        AVG(cs.total_sales) OVER (
            PARTITION BY c.country
        ) AS country_avg_customer_sales
    FROM customer_sales AS cs
    INNER JOIN gold.dim_customers AS c
        ON c.customer_key = cs.customer_key
)
SELECT
    country,
    customer_name,
    total_sales,
    country_avg_customer_sales,
    CASE
        WHEN total_sales > country_avg_customer_sales
            THEN 'Above Average'
        WHEN total_sales = country_avg_customer_sales
            THEN 'Average'
        ELSE 'Below Average'
    END AS sales_performance
FROM customer_metrics
ORDER BY
    country,
    total_sales DESC;
