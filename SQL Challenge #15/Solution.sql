USE DataWarehouse;
GO

SELECT 
    product_key,
    sales_amount,
    SUM(sales_amount) OVER (PARTITION BY product_key) AS total_product_sales,
    sales_amount * 100.0 / NULLIF(SUM(sales_amount) OVER (PARTITION BY product_key),0) AS sales_percentage
FROM gold.fact_sales
ORDER BY
    product_key,
    sales_amount DESC;
