USE DataWarehouse;


GO
WITH     cst_info
AS       (SELECT   c.customer_key,
                   c.first_name AS first_name,
                   c.last_name AS last_name,
                   c.country,
                   SUM(s.sales_amount) AS total_sales_by_customer
          FROM     gold.dim_customers AS c
                   INNER JOIN
                   gold.fact_sales AS s
                   ON c.customer_key = s.customer_key
          GROUP BY c.customer_key,
                   c.first_name,
                   c.last_name,
                   c.country),
         cst_percentage
AS       (SELECT customer_key,
                 CONCAT (
                     ISNULL (
                         first_name,
                         ''
                     ),
                     ' ',
                     ISNULL (
                         last_name,
                         ''
                     )
                 ) AS customer_name,
                 country,
                 total_sales_by_customer AS total_sales,
                 SUM(total_sales_by_customer) OVER () AS overall_sales
          FROM   cst_info),
         cst_rnk
AS       (SELECT customer_key,
                 customer_name,
                 country,
                 total_sales,
                 overall_sales,
                 CAST (ROUND((CAST (total_sales AS DECIMAL (18, 2)) / NULLIF (overall_sales, 0)) * 100, 2) AS DECIMAL (18, 2)) AS sales_percentage,
                 RANK() OVER (ORDER BY total_sales DESC) AS customer_revenue_rank
          FROM   cst_percentage)
SELECT   customer_key,
         customer_name,
         country,
         total_sales,
         overall_sales,
         sales_percentage,
         customer_revenue_rank,
         CASE WHEN sales_percentage >= 5 THEN 'High Contributor' WHEN sales_percentage >= 1 THEN 'Medium Contributor' ELSE 'Low Contributor' END AS customer_segment
FROM     cst_rnk
ORDER BY customer_revenue_rank ASC;
