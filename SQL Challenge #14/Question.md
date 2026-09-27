# Challenge 14 — Cumulative Sales by Product

## Business Problem

The Product Analytics team wants to understand how sales accumulate for each product when its sales transactions are ordered from the highest sales amount to the lowest.

## Tables

* `gold.fact_sales`

## Required Output

Return:

* `product_key`
* `sales_amount`
* `cumulative_sales`

## Business Rules

* Partition the analysis by `product_key`.
* Order sales transactions within each product by `sales_amount` in descending order.
* Calculate the cumulative sales amount for each product.
* The cumulative total should increase as each sales transaction is processed.
* Preserve the sales transaction grain; do not return one row per product.
* Sort the final result by `product_key` and `sales_amount` descending.

## Difficulty

**Advanced / Business Analytics**
