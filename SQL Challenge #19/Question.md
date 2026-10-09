\#19

# Customer Purchase Recency Segmentation

## Business Problem

The sales team wants to identify customers based on how recently they purchased products. This will help prioritize customer re-engagement and retention activities.

## Tables

- `gold.fact_sales`
- `gold.dim_customers`

## Required Output

Return:

- `customer_name`
- `last_order_date`
- `months_since_last_order`
- `recency_segment`

## Business Rules

- Calculate each customer's most recent order date.
- Calculate the number of months between the last order date and the current date.
- Assign a segment using these rules:
  - `0–3` months → `Recent Customer`
  - `4–6` months → `At Risk`
  - `7–12` months → `Inactive`
  - More than `12` months → `Churned`
- Include only customers who have made at least one order with a valid `order_date`.
- Sort by `months_since_last_order` descending.

## Difficulty

Advanced / Business Analytics / Interview
