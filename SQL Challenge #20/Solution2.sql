USE datawarehouse;
GO

SELECT
    c.customer_key,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(DISTINCT s.order_number) AS total_orders,
    MIN(s.order_date) AS first_order_date,
    MAX(s.order_date) AS last_order_date,
    SUM(s.sales_amount) AS total_sales,
    CASE
        WHEN COUNT(DISTINCT s.order_number) = 1
            THEN 'One Time Customer'
        ELSE 'Repeat Customer'
    END AS customer_type
FROM gold.fact_sales AS s
INNER JOIN gold.dim_customers AS c
    ON c.customer_key = s.customer_key
WHERE s.order_date IS NOT NULL
GROUP BY
    c.customer_key,
    c.first_name,
    c.last_name
ORDER BY
    total_sales DESC;
