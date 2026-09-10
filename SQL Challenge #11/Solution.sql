USE DataWarehouse;
GO

SELECT
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(DISTINCT s.order_number) AS total_orders,
    MIN(s.order_date) AS first_order_date,
    MAX(s.order_date) AS last_order_date,
        COUNT(DISTINCT s.order_number) * 1.0 /
        NULLIF(DATEDIFF(MONTH, MIN(s.order_date), MAX(s.order_date)), 0)
     AS purchase_frequency
FROM gold.fact_sales AS s
INNER JOIN gold.dim_customers AS c
    ON s.customer_key = c.customer_key
WHERE s.order_date IS NOT NULL
GROUP BY
    c.customer_key,
    c.first_name,
    c.last_name
HAVING COUNT(DISTINCT s.order_number) > 1
ORDER BY purchase_frequency DESC;
