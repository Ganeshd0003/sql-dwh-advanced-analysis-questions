USE DataWarehouse;
GO

SELECT
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(DISTINCT s.order_number) AS total_orders,
    SUM(s.sales_amount) AS total_sales,
    DATEDIFF(MONTH, MIN(s.order_date), MAX(s.order_date)) AS customer_lifespan_months,
    CASE
        WHEN DATEDIFF(MONTH, MIN(s.order_date), MAX(s.order_date)) = 0
        THEN NULL
        ELSE SUM(s.sales_amount) * 1.0 /
             DATEDIFF(MONTH, MIN(s.order_date), MAX(s.order_date))
    END AS avg_monthly_spend
FROM gold.dim_customers c
INNER JOIN gold.fact_sales s
    ON c.customer_key = s.customer_key
GROUP BY
    c.customer_key,
    c.first_name,
    c.last_name
ORDER BY total_sales DESC;
