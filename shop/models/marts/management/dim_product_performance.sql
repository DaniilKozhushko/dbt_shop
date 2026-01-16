{{ config(materialized='table') }}

with sales as (
    select * from {{ ref('int_sales_enriched') }}
),
products as (
    select * from {{ ref('stg_shop__products') }}
)

select
    p.name as product_name,
    p.is_active,
    coalesce(sum(s.quantity), 0) as total_quantity_sold,
    coalesce(sum(s.total_amount_local), 0) as total_revenue_generated
from products p
left join sales s on p.product_id = s.product_id
group by 1, 2
-- сверху хиты продаж
order by 4 desc