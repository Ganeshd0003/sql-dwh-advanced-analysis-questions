\#20

# Customer Repeat Purchase Analysis

## Business Problem

The sales and marketing teams want to identify repeat customers and understand how much revenue they generate compared with their first purchase.

Analyze each customer's purchasing behavior to determine their order count, first and last purchase dates, total sales, and repeat-purchase status.

## Tables

- `gold.fact_sales`
- `gold.dim_customers`

## Required Output

Return:

- `customer_name`
- `total_orders`
- `first_order_date`
- `last_order_date`
- `total_sales`
- `customer_type`

## Business Rules

- Calculate the number of distinct orders for each customer.
- Calculate each customer's first and last order dates.
- Calculate total sales for each customer.
- Classify customers as:
  - `1` distinct order → `One-Time Customer`
  - More than `1` distinct order → `Repeat Customer`
- Exclude records with `NULL` order dates.
- Include only customers who have made at least one valid order.
- Sort by `total_sales` descending.

## Difficulty

Advanced / Business Analytics / Interview
