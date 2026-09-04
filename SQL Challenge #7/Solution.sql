USE datawarehouse;
Go

WITH ProductSales AS
(
    SELECT
        p.product_name,
        p.category,
        SUM(s.sales_amount) AS total_sales
    FROM gold.fact_sales AS s
    INNER JOIN gold.dim_products AS p
        ON s.product_key = p.product_key
    GROUP BY
        p.product_name,
        p.category
),
RankedProducts AS
(
    SELECT
        product_name,
        category,
        total_sales,
        ROW_NUMBER() OVER
        (
            PARTITION BY category
            ORDER BY total_sales DESC, product_name
        ) AS rn
    FROM ProductSales
)
SELECT
    product_name,
    category,
    total_sales
FROM RankedProducts
WHERE rn = 1;
