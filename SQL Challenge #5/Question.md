# Sales by Gender

## Business Problem

The Marketing team wants to understand how total sales are distributed between different customer genders.

## Tables

* `gold.fact_sales`
* `gold.dim_customers`

## Required Output

Return:

* `gender`
* `total_sales`

## Business Rules

* Calculate total sales for each customer gender.
* Include only customers who have sales transactions.
* Sort genders from highest total sales to lowest.
* Do not show individual customer details.

## Difficulty

**Basic**
