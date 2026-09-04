USE DataWarehouse;
GO

SELECT
    YEAR(s.order_date) AS yr,
    DATENAME(MONTH, s.order_date) AS mnt,
    SUM(s.sales_amount) AS Total
FROM gold.fact_sales AS s
GROUP BY
    YEAR(s.order_date),
    DATENAME(MONTH, s.order_date)
ORDER BY
    yr,
    MONTH(MIN(s.order_date));
