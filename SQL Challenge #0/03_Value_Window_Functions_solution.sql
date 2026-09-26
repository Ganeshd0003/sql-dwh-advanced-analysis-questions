USE DataWarehouse;
GO

SELECT
	sales_amount,
	LEAD(sales_amount) OVER(PARTITION BY product_key ORDER BY sales_amount DESC) AS lead_value,
	LAG(sales_amount) OVER(PARTITION BY product_key ORDER BY sales_amount DESC) AS lag_value,
	FIRST_VALUE(sales_amount) OVER(PARTITION BY product_key ORDER BY sales_amount DESC) AS first_value,
	LAST_VALUE(sales_amount) OVER(PARTITION BY product_key ORDER BY sales_amount DESC) AS last_value

FROM gold.fact_sales;
