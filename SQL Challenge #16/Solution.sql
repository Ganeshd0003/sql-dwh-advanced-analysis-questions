USE DataWarehouse;
GO

WITH cust_by_country AS
(
	SELECT
		c.country,
		c.first_name AS f,
		c.last_name AS l,
		SUM(s.sales_amount) AS total_sales
	FROM gold.dim_customers AS c
	INNER JOIN gold.fact_sales AS s
		ON c.customer_key = s.customer_key
	GROUP BY
		c.country,
		c.first_name,
		c.last_name
)
SELECT
	country,
	CONCAT(f,' ',l) AS customer_name,
	total_sales,
	RANK() OVER(PARTITION BY country ORDER BY total_sales DESC) AS country_rnk
FROM cust_by_country;
