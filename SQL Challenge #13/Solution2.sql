USE DataWarehouse;
GO

SELECT
    p.product_name,
    p.category,
    SUM(s.sales_amount) AS total_sales,
    CASE
        WHEN SUM(s.sales_amount) > 50000
            THEN 'High Performer'
        WHEN SUM(s.sales_amount) >= 10000
             AND SUM(s.sales_amount) <= 50000
            THEN 'Mid Range'
        ELSE 'Low Performer'
    END AS product_segment
FROM gold.fact_sales AS s
INNER JOIN gold.dim_products AS p
    ON s.product_key = p.product_key
GROUP BY
    p.product_key,
    p.product_name,
    p.category
ORDER BY
    total_sales DESC;
