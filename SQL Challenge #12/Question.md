# Challenge 12 — Customer Lifetime Value

## Business Problem

The Finance team wants to identify customers who have generated the highest **total revenue** over their purchasing lifetime.

## Tables

* `gold.fact_sales`
* `gold.dim_customers`

## Required Output

Return:

* `customer_name`
* `total_orders`
* `total_sales`
* `customer_lifespan_months`
* `avg_monthly_spend`

## Business Rules

* Calculate total sales for each customer.
* Calculate the number of distinct orders for each customer.
* Calculate customer lifespan as the number of months between the customer's first and last order.
* Calculate `avg_monthly_spend` as:
  **total sales / customer lifespan in months**
* If customer lifespan is 0 months, return `NULL` for `avg_monthly_spend`.
* Include only customers who have sales.
* Sort by `total_sales` in descending order.

## Difficulty

**Business Analytics**
