USE DataWarehouse;
GO

WITH     country_by_ttl_sls
AS       (SELECT   c.customer_id,
                   c.country,
                   CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
                   SUM(s.sales_amount) AS total_sales
          FROM     gold.fact_sales AS s
                   INNER JOIN
                   gold.dim_customers AS c
                   ON s.customer_key = c.customer_key
          GROUP BY c.customer_id,
                   c.country,
                   c.first_name,
                   c.last_name)
SELECT   country,
         customer_name,
         total_sales,
         RANK() OVER (PARTITION BY country ORDER BY total_sales DESC) AS country_rank
FROM     country_by_ttl_sls
ORDER BY country,
         country_rank;
