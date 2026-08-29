# Sales by Category

## Business Problem

The Product team wants to identify which product categories generate the most revenue.

## Tables

* `gold.fact_sales`
* `gold.dim_products`

## Required Output

Return the following columns:

* `category`
* `total_sales`

## Business Rules

* Include only product categories that have sales transactions.
* Calculate total sales for each product category.
* Sort categories from highest total sales to lowest.
* Do not show individual products.

## Difficulty

**Basic**
