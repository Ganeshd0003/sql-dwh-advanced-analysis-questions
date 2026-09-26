# Window Ranking Functions

## Business Problem

The Analytics team wants to understand how individual sales transactions rank against other sales transactions using different SQL Server window ranking functions.

## Tables

* `gold.fact_sales`
* `gold.dim_products`

## Required Output

Return:

* `product_name`
* `sales_amount`
* `row_number`
* `rank`
* `dense_rank`
* `ntile_group`
* `percent_rank`
* `cumulative_distribution`

## Business Rules

* Join `fact_sales` with `dim_products` using `product_key`.
* Rank sales transactions by `sales_amount` in descending order.
* Calculate `ROW_NUMBER()` for each sales transaction.
* Calculate `RANK()` based on `sales_amount`.
* Calculate `DENSE_RANK()` based on `sales_amount`.
* Divide the ordered sales transactions into **20,000 groups** using `NTILE(20000)`.
* Calculate `PERCENT_RANK()` based on `sales_amount`.
* Calculate `CUME_DIST()` based on `sales_amount`.
* Do not aggregate the sales transactions; preserve the fact-table transaction grain.

## Difficulty

**Advanced / Interview**
