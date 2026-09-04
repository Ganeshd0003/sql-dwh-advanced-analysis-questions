# Monthly Sales Analysis

The Finance team wants to understand how total sales change across different months to identify the months with higher and lower revenue.

## Tables

* `gold.fact_sales`

## Required Output

Return:

* `sales_year`
* `sales_month`
* `total_sales`

## Business Rules

* Calculate total sales for each year and month based on `order_date`.
* Group sales by year and month.
* Include only records with a valid `order_date`.
* Sort the results chronologically by year and month.

## Difficulty

**Basic**
