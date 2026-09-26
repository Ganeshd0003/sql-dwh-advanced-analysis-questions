# Product-Level Value Window Functions

## Business Problem

The Product Analytics team wants to compare each sales transaction with other sales transactions **within the same product** to understand the sequence and range of sales values.

## Tables

* `gold.fact_sales`

## Required Output

Return:

* `sales_amount`
* `next_sales_amount`
* `previous_sales_amount`
* `highest_product_sales`
* `lowest_product_sales`

## Business Rules

* Partition the analysis by `product_key`.
* Order sales transactions within each product by `sales_amount` in descending order.
* `next_sales_amount` should contain the next sales value using `LEAD()`.
* `previous_sales_amount` should contain the previous sales value using `LAG()`.
* `highest_product_sales` should contain the first sales value in the product's ordered set using `FIRST_VALUE()`.
* `lowest_product_sales` should contain the last sales value in the product's ordered set using `LAST_VALUE()`.
* Do not aggregate the fact table; preserve the sales transaction grain.

## Difficulty

**Advanced / Interview**
