USE DataWarehouse;
GO

SELECT
    product_key,
    sales_amount,
    COUNT(sales_amount) OVER (PARTITION BY product_key ORDER BY sales_amount DESC) AS sales_count,
    MIN(sales_amount) OVER (PARTITION BY product_key ORDER BY sales_amount DESC) AS min_sales_amount,
    MAX(sales_amount) OVER (PARTITION BY product_key ORDER BY sales_amount DESC) AS max_sales_amount,
    AVG(sales_amount) OVER (PARTITION BY product_key ORDER BY sales_amount DESC) AS avg_sales_amount,
    SUM(sales_amount) OVER (PARTITION BY product_key ORDER BY sales_amount DESC) AS total_sales_amount
FROM gold.fact_sales;
