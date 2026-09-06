# Yearly Sales Growth

## Business Problem

The Finance team wants to analyze how the company's total sales change from one year to the next and identify the **year-over-year (YoY) sales growth**.

## Tables

* `gold.fact_sales`

## Required Output

Return:

* `sales_year`
* `total_sales`
* `previous_year_sales`
* `sales_growth_percentage`

## Business Rules

* Calculate total sales for each year using `order_date`.
* Compare each year's sales with the previous year.
* `previous_year_sales` should contain the total sales from the immediately preceding year.
* Calculate sales growth percentage as:
  **(current year sales - previous year sales) / previous year sales × 100**
* The first available year should have `NULL` for `previous_year_sales` and `sales_growth_percentage`.
* Round `sales_growth_percentage` to 2 decimal places.
* Sort the results chronologically by year.

## Difficulty

**Business Analytics**
