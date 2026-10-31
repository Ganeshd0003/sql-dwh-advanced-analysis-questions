# Product Sales Contribution and Category Benchmarking

## Business Problem

The product and sales teams want to identify products that outperform their category's average revenue and understand how much each product contributes to its category's total sales.

Build a SQL analysis that calculates product-level revenue, compares each product against its category average, and measures its contribution to category sales.

## Tables

- `gold.fact_sales`
- `gold.dim_products`

## Required Output

Return:

- `category`
- `product_key`
- `product_name`
- `total_sales`
- `category_avg_product_sales`
- `sales_performance`
- `category_sales_rank`
- `sales_percentage`

## Business Rules

### 1. Product Aggregation

- Calculate total sales for each product.
- Include only products with sales.
- Preserve one row per product.

### 2. Category Benchmarking

- Calculate the average of product-level total sales within each category.
- Classify each product:
  - Above category average: `Above Average`
  - Equal to category average: `Average`
  - Below category average: `Below Average`

### 3. Category Ranking

- Rank products separately within each category by total sales, highest first.
- Products with equal total sales must receive the same rank.

### 4. Category Sales Contribution

Calculate each product's percentage of its category's total sales:

`Product Total Sales / Category Total Sales × 100`

- Round the result to two decimal places.
- Handle a zero denominator safely.

### 5. Final Output

- Preserve one row per product.
- Sort by `category` ascending and `category_sales_rank` ascending.

## Difficulty

Master / Advanced SQL / Business Analytics / Interview
