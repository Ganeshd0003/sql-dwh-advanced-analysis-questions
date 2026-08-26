# Sales by Country

## Business Problem

The Sales team wants to understand how much revenue the business generated in each country.

## Tables

- `gold.fact_sales`
- `gold.dim_customers`

## Required Output

Return the following columns:

- `country`
- `total_sales`

## Business Rules

- Include only customers who have sales transactions.
- Calculate total sales for each country.
- Sort countries from highest total sales to lowest.
- Do not show countries with no sales.

## Difficulty

Basic
