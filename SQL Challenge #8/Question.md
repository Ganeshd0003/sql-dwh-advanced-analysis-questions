# Customer Sales Ranking

## Business Problem

The Sales team wants to identify the **top 10 customers** based on their total sales contribution.

## Tables

* `gold.fact_sales`
* `gold.dim_customers`

## Required Output

Return:

* `customer_name`
* `country`
* `total_sales`
* `sales_rank`

## Business Rules

* Calculate total sales for each customer.
* Rank customers based on total sales in descending order.
* The highest-sales customer should have rank 1.
* Return only the top 10 customers.
* Include only customers with sales.
* If multiple customers have the same total sales, they should receive the same rank.

## Difficulty

**Intermediate**
