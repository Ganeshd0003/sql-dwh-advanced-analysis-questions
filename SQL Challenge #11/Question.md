# Customer Purchase Frequency

## Business Problem

The Marketing team wants to identify customers who have made **multiple purchases** and understand how frequently they purchase.

## Tables

* `gold.fact_sales`
* `gold.dim_customers`

## Required Output

Return:

* `customer_name`
* `total_orders`
* `first_order_date`
* `last_order_date`
* `purchase_frequency`

## Business Rules

* Calculate the number of distinct orders for each customer.
* Calculate each customer's first and most recent order date.
* Calculate `purchase_frequency` as:
  **total_orders / number of months between first and last order date**
* Include only customers with more than one distinct order.
* If the number of months between the first and last order is 0, return `NULL` for `purchase_frequency`.
* Sort by `purchase_frequency` in descending order.

## Difficulty

**Business Analytics**
