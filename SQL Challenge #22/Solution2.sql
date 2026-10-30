USE DataWarehouse;
GO

DECLARE @today DATE = CAST(GETDATE() AS DATE);
  
WITH cst_details AS
(
    SELECT
        c.customer_key,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        c.country,
        COUNT(DISTINCT s.order_number) AS total_orders,
        MIN(s.order_date) AS first_order_date,
        MAX(s.order_date) AS last_order_date,
        SUM(s.sales_amount) AS total_sales
    FROM gold.fact_sales AS s
    INNER JOIN gold.dim_customers AS c
        ON s.customer_key = c.customer_key
    WHERE s.order_date IS NOT NULL
    GROUP BY
        c.customer_key,
        c.first_name,
        c.last_name,
        c.country
),
cst_sls_details AS
(
    SELECT
        customer_key,
        customer_name,
        country,
        total_orders,
        first_order_date,
        last_order_date,
        total_sales,

        AVG(total_sales) OVER (
            PARTITION BY country
        ) AS country_avg_customer_sales,

        DATEDIFF(
            MONTH,
            last_order_date,
            @today
        ) AS months_since_last_order,

        CASE
            WHEN total_orders = 1
                THEN 'One-Time Customer'
            ELSE 'Repeat Customer'
        END AS customer_type,

        SUM(total_sales) OVER (
            PARTITION BY country
        ) AS country_total_sales
    FROM cst_details
)
SELECT
    customer_key,
    customer_name,
    country,
    total_orders,
    first_order_date,
    last_order_date,
    total_sales,
    country_avg_customer_sales,

    CASE
        WHEN total_sales > country_avg_customer_sales
            THEN 'Above Average'
        WHEN total_sales < country_avg_customer_sales
            THEN 'Below Average'
        ELSE 'Average'
    END AS sales_performance,

    months_since_last_order,

    CASE
        WHEN months_since_last_order BETWEEN 0 AND 3
            THEN 'Recent Customer'
        WHEN months_since_last_order BETWEEN 4 AND 6
            THEN 'At Risk'
        WHEN months_since_last_order BETWEEN 7 AND 12
            THEN 'Inactive'
        ELSE 'Churned'
    END AS recency_segment,

    customer_type,

    RANK() OVER (
        PARTITION BY country
        ORDER BY total_sales DESC
    ) AS country_sales_rank,

    CAST(
        ROUND(
            total_sales * 100.0
                / NULLIF(country_total_sales, 0),
            2
        ) AS DECIMAL(10, 2)
    ) AS sales_percentage

FROM cst_sls_details
ORDER BY
    country,
    country_sales_rank;
