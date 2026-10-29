# Master Challenge — End-to-End Customer Sales Intelligence

## Business Problem

The Sales and Marketing teams want a unified customer performance analysis to identify valuable customers, understand purchasing behavior, compare customers against their country's performance, and prioritize retention campaigns.

Build a SQL analysis that combines customer-level sales aggregation, country-level benchmarking, purchase recency, repeat-purchase behavior, customer ranking, and sales contribution.

## Tables

- `gold.fact_sales`
- `gold.dim_customers`

## Required Output

Return one row per customer with the following columns:

- `customer_key`
- `customer_name`
- `country`
- `total_orders`
- `first_order_date`
- `last_order_date`
- `total_sales`
- `country_avg_customer_sales`
- `sales_performance`
- `months_since_last_order`
- `recency_segment`
- `customer_type`
- `country_sales_rank`
- `sales_percentage`

## Business Rules

### 1. Customer Aggregation

- Calculate the number of distinct orders for each customer.
- Calculate each customer's first and last order dates.
- Calculate total sales for each customer.
- Exclude records with `NULL` order dates.
- Include only customers with at least one valid order.

### 2. Country Benchmarking

- Calculate the average of customer-level total sales separately within each country.
- Classify each customer:
  - Above the country average: `Above Average`
  - Equal to the country average: `Average`
  - Below the country average: `Below Average`

### 3. Purchase Recency

Calculate months since the last order using `DATEDIFF(MONTH, last_order_date, GETDATE())`.

Assign segments:

- `0–3` months: `Recent Customer`
- `4–6` months: `At Risk`
- `7–12` months: `Inactive`
- More than `12` months: `Churned`

### 4. Repeat-Purchase Classification

- One distinct order: `One-Time Customer`
- More than one distinct order: `Repeat Customer`

### 5. Country Sales Ranking

- Rank customers separately within each country by total sales, highest first.
- Customers with equal total sales must receive the same rank.

### 6. Country Sales Contribution

Calculate each customer's percentage of their country's total sales:

`Customer Total Sales / Country Total Sales × 100`

- Round the result to two decimal places.
- Handle a zero denominator safely.

### 7. Final Output

- Preserve one row per customer.
- Sort by `country` ascending and `country_sales_rank` ascending.
- Use `customer_key` to preserve customer identity.

## Difficulty

**Master / Advanced SQL / Business Analytics / Interview**
