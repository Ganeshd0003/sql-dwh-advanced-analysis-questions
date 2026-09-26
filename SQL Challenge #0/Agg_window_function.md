# Product-Level Running Sales Metrics

## Business Problem

The Product Analytics team wants to analyze sales transactions for each product and calculate running statistical metrics based on sales amount.

## Tables

* `gold.fact_sales`

## Required Output

Return:

* `product_key`
* `sales_amount`
* `sales_count`
* `min_sales_amount`
* `max_sales_amount`
* `avg_sales_amount`
* `total_sales_amount`

## Business Rules

* Partition the analysis by `product_key`.
* Order sales transactions within each product by `sales_amount` in descending order.
* Calculate the running count of sales amounts using `COUNT()`.
* Calculate the running minimum sales amount using `MIN()`.
* Calculate the running maximum sales amount using `MAX()`.
* Calculate the running average sales amount using `AVG()`.
* Calculate the running total sales amount using `SUM()`.
* Do not aggregate the fact table into one row per product; preserve the sales transaction grain.

## Difficulty

**Advanced / Interview**
