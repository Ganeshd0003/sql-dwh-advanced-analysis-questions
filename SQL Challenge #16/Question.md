# Customer Revenue Ranking Within Country

## Business Problem

The Sales team wants to identify the highest-value customers **within each country** based on their total sales contribution.

## Tables

* `gold.fact_sales`
* `gold.dim_customers`

## Required Output

Return:

* `country`
* `customer_name`
* `total_sales`
* `country_rank`

## Business Rules

* Calculate total sales for each customer.
* Rank customers separately within each country based on total sales in descending order.
* The highest-sales customer within each country should have rank 1.
* Customers with the same total sales within a country should receive the same rank.
* Include only customers with sales.
* Sort the results by `country` and `country_rank`.

## Difficulty

**Advanced / Business Analytics**
