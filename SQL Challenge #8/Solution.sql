USE datawarehouse;
GO
  
WITH cst_info AS (
    SELECT
        CONCAT(c.first_name, ' ', c.last_name) AS Cst_Name,
        c.country,
        SUM(s.sales_amount) AS Total_Sales_By_Cst
    FROM gold.dim_customers AS c
    INNER JOIN gold.fact_sales AS s
        ON c.customer_key = s.customer_key
    GROUP BY
        CONCAT(c.first_name, ' ', c.last_name),
        c.country
),
cst_rnk as (SELECT
    RANK() OVER (
        ORDER BY Total_Sales_By_Cst DESC
    ) AS Sales_Rank,
    Cst_Name,
    country,
    Total_Sales_By_Cst
FROM cst_info)
select * from cst_rnk where Sales_Rank <= 10
