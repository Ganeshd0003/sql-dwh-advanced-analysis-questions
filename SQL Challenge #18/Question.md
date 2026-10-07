# Product Revenue Ranking Within Category

## Business Problem

The product team wants to identify the strongest-performing products within each category based on total sales revenue.

Calculate each product's total sales and rank products separately within their category.

## Tables

* `gold.fact_sales`
* `gold.dim_products`

## Required Output

Return:

* `category`
* `product_name`
* `total_sales`
* `category_rank`

## Business Rules

* Calculate total sales for each product.
* Rank products separately within each category by `total_sales` descending.
* The highest-selling product in each category must have rank `1`.
* Products with the same total sales must receive the same rank.
* Include only products with sales.
* Sort by `category` and `category_rank` ascending.

## Difficulty

**Advanced / Business Analytics / Interview**
