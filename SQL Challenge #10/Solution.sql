USE DataWarehouse;
GO

WITH Yearly_Sales AS
(
	SELECT
		YEAR(order_date) AS Years,
		SUM(sales_amount) AS Total_Sales
	FROM gold.fact_sales
	GROUP BY YEAR(order_date)
),
previous_yr_sl AS
(
	SELECT
		Years,
		Total_Sales,
		LAG(Total_Sales) OVER(ORDER BY Years) AS previous_year_sales
	FROM Yearly_Sales
)
SELECT 
	Years,
	Total_Sales,
	previous_year_sales,
	CAST(ROUND((Total_Sales - previous_year_sales)*100.0 / previous_year_sales,2) AS DECIMAL(10,2))
	AS sales_growth_percentage
FROM previous_yr_sl
