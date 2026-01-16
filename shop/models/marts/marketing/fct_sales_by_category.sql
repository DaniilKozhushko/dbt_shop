{{ config(materialized='table') }}

with sales as (
    select * from {{ ref('int_sales_enriched') }}
),
categories as (
    select * from {{ ref('stg_shop__categories') }}
)

select
    c.name as category_name,
    count(distinct s.product_id) as products_sold_count,
    sum(s.total_amount_local) as category_revenue
from sales s
left join categories c on s.category_id = c.category_id
group by 1
order by 3 desc