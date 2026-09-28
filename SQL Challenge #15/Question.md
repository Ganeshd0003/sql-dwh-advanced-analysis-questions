# Challenge 15 — Product Sales Contribution

## Business Problem

The Product Analytics team wants to understand how much each sales transaction contributes to the **total sales of its product**.

## Tables

* `gold.fact_sales`

## Required Output

Return:

* `product_key`
* `sales_amount`
* `total_product_sales`
* `sales_percentage`

## Business Rules

* Calculate total sales for each product.
* For every sales transaction, calculate its percentage contribution to that product's total sales.
* `total_product_sales` should represent the total sales of the corresponding product.
* `sales_percentage` should be calculated as:
  **sales amount / total product sales × 100**
* Round `sales_percentage` to 2 decimal places.
* Preserve the sales transaction grain; do not aggregate the final result to one row per product.
* Sort the results by `product_key` and `sales_amount` in descending order.

## Difficulty

**Advanced / Business Analytics**
