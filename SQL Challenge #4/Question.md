# Top 10 Products by Sales

## Business Problem

The Product team wants to identify the products that have generated the highest total sales.

## Tables

* `gold.fact_sales`
* `gold.dim_products`

## Required Output

Return:

* `product_name`
* `total_sales`

## Business Rules

* Calculate total sales for each product.
* Include only products that have at least one sales transaction.
* Sort products from highest total sales to lowest.
* Return the top 10 products only.

## Difficulty

**Basic**
