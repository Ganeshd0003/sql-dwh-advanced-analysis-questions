\#21

# Customer Sales Performance Compared With Country Average

## Business Problem

The sales team wants to identify customers whose total sales are above or below the average customer sales in their respective countries.

Calculate each customer's total sales and compare it with the average total sales per customer in that country.

## Tables

- `gold.fact_sales`
- `gold.dim_customers`

## Required Output

Return:

- `country`
- `customer_name`
- `total_sales`
- `country_avg_customer_sales`
- `sales_performance`

## Business Rules

- Calculate total sales for each customer.
- Calculate the average customer-level total sales separately within each country.
- Classify each customer as:
  - Above the country average → `Above Average`
  - Equal to the country average → `Average`
  - Below the country average → `Below Average`
- Include only customers with sales.
- Compare customer-level sales against the average of customer-level sales, not the average transaction amount.
- Sort by `country` and `total_sales` descending.

## Difficulty

Advanced / Business Analytics / Interview
