{{ config(materialized='table') }}

with sales as (
    select * from {{ ref('int_sales_enriched') }}
),
statuses as (
    select * from {{ ref('stg_shop__statuses') }}
)

select
    s.name as status_name,
    count(distinct sales.order_id) as order_count,
    sum(sales.total_amount_local) as potential_revenue
from sales
left join statuses s on sales.status_id = s.status_id
group by 1