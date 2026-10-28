USE DataWarehouse;
GO

WITH     product_by_cat
AS       (SELECT   p.product_id,
                   p.category,
                   p.product_name,
                   SUM(s.sales_amount) AS total_sales
          FROM     gold.fact_sales AS s
                   INNER JOIN
                   gold.dim_products AS p
                   ON s.product_key = p.product_key
          GROUP BY p.product_id,
                   p.category,
                   p.product_name)
SELECT   category,
         product_name,
         total_sales,
         RANK() OVER (PARTITION BY category ORDER BY total_sales DESC) AS category_rank
FROM     product_by_cat
ORDER BY category,
         category_rank;
