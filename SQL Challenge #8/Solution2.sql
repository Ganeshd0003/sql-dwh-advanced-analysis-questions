USE datawarehouse;
GO

WITH   cst_ttl_sls
AS     (SELECT   c.customer_key,
                 CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
                 c.country,
                 SUM(s.sales_amount) AS total_sales
        FROM     gold.fact_sales AS s
                 INNER JOIN
                 gold.dim_customers AS c
                 ON s.customer_key = c.customer_key
        GROUP BY c.customer_key,
                 c.first_name,
                 c.last_name,
                 c.country)
SELECT TOP 10 customer_name,
              country,
              total_sales,
              RANK() OVER (ORDER BY total_sales DESC) AS sales_rank
FROM   cst_ttl_sls;
