# Country Sales Contribution

## Business Problem

The Finance team wants to understand how much each country contributes to the company's **overall sales**.

## Tables

* `gold.fact_sales`
* `gold.dim_customers`

## Required Output

Return:

* `country`
* `total_sales`
* `sales_percentage`

## Business Rules

* Calculate total sales for each country.
* Calculate each country's percentage contribution to overall sales.
* `sales_percentage` should be calculated as:
  **country total sales / overall total sales × 100**
* Include only countries with sales.
* Sort by `sales_percentage` in descending order.
* Round `sales_percentage` to 2 decimal places.

## Difficulty

**Business Analytics**
