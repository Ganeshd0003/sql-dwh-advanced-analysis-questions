USE DataWarehouse;
GO

WITH   sales_by_cust
AS     (SELECT   c.customer_id,
                 c.country,
                 CONCAT (
                     ISNULL (
                         c.first_name,
                         ''
                     ),
                     ' ',
                     ISNULL (
                         c.last_name,
                         ''
                     )
                 ) AS customer_name,
                 SUM(s.sales_amount) AS total_sales
        FROM     gold.dim_customers AS c
                 INNER JOIN
                 gold.fact_sales AS s
                 ON c.customer_key = s.customer_key
        GROUP BY c.customer_id,
                 c.country,
                 c.first_name,
                 c.last_name)
SELECT 
    country,
    customer_name,
    total_sales,
    RANK() OVER(PARTITION BY country ORDER BY total_sales DESC) AS country_rank
FROM   sales_by_cust
ORDER BY
    country,
    country_rank;
