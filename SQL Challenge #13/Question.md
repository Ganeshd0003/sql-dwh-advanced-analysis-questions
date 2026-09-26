# Product Performance Segmentation

## Business Problem

The Product team wants to classify products based on their **total sales performance** to identify high-performing, mid-range, and low-performing products.

## Tables

* `gold.fact_sales`
* `gold.dim_products`

## Required Output

Return:

* `product_name`
* `category`
* `total_sales`
* `product_segment`

## Business Rules

* Calculate total sales for each product.
* Assign each product to a segment based on total sales:

  * **High Performer** — total sales > 50,000
  * **Mid Range** — total sales >= 10,000 and <= 50,000
  * **Low Performer** — total sales < 10,000
* Include only products with sales.
* Sort by `total_sales` in descending order.

## Difficulty

**Business Analytics**
