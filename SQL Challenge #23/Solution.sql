USE DataWarehouse;

GO
WITH   product_details
AS     (SELECT   p.category,
                 p.product_key,
                 p.product_name,
                 SUM(s.sales_amount) AS total_sales
        FROM     gold.fact_sales AS s
                 INNER JOIN
                 gold.dim_products AS p
                 ON s.product_key = p.product_key
        WHERE    p.product_key IS NOT NULL
        GROUP BY p.category,
                 p.product_key,
                 p.product_name),
       product_avgs
AS     (SELECT category,
               product_key,
               product_name,
               total_sales,
               AVG(total_sales) OVER (PARTITION BY category) AS category_avg_product_sales,
               SUM(total_sales) OVER (PARTITION BY category) AS cat_total_sales,
               RANK() OVER (PARTITION BY category ORDER BY total_sales DESC) AS category_sales_rank
        FROM   product_details)
SELECT category,
       product_key,
       product_name,
       total_sales,
       category_avg_product_sales,
       category_sales_rank,
       cat_total_sales,
       CASE WHEN total_sales > category_avg_product_sales THEN 'Above Average' WHEN total_sales = category_avg_product_sales THEN 'Average' WHEN total_sales < category_avg_product_sales THEN 'Below Average' END AS sales_perfomace,
       CAST (ROUND(((total_sales * 100.2) / NULLIF (cat_total_sales, 0)), 2) AS DECIMAL (10, 2)) AS sales_percentage
FROM   product_avgs;