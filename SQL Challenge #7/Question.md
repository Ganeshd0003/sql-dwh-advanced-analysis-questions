# Top-Selling Product by Category

## Business Problem

The Product team wants to identify the **best-selling product within each category** based on total sales.

## Tables

* `gold.fact_sales`
* `gold.dim_products`

## Required Output

Return:

* `category`
* `product_name`
* `total_sales`

## Business Rules

* Calculate total sales for each product.
* Determine the highest-selling product within each category.
* Return only **one top product per category**.
* Include only products that have sales.
* Sort the results by `category`.

## Difficulty

**Intermediate**
