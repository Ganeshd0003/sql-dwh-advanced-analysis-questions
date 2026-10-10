USE DataWarehouse;
GO

WITH customer_sales AS
(
    SELECT
        c.customer_key,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        c.country,
        SUM(s.sales_amount) AS total_sales
    FROM gold.fact_sales AS s
    INNER JOIN gold.dim_customers AS c
        ON s.customer_key = c.customer_key
    GROUP BY
        c.customer_key,
        c.first_name,
        c.last_name,
        c.country
),
country_avg AS
(
    SELECT
        customer_key,
        customer_name,
        country,
        total_sales,
        AVG(total_sales) OVER(
            PARTITION BY country
        ) AS country_avg_customer_sales
    FROM customer_sales
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
FROM country_avg
ORDER BY
    country,
    total_sales DESC;
