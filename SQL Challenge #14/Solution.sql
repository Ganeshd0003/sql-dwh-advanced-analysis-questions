USE datawarehouse;
GO

SELECT 
    product_key,
    sales_amount,
    SUM(sales_amount) OVER (
        PARTITION BY product_key
        ORDER BY sales_amount DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_sales
FROM gold.fact_sales
ORDER BY
    product_key,
    sales_amount DESC;
