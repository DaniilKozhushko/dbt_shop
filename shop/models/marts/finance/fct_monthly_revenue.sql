{{ config(materialized='table') }}

with sales as (
    select * from {{ ref('int_sales_enriched') }}
)

select
    -- Truncate дату до начала месяца (2025-01-01)
    date_trunc('month', order_date)::date as report_month,
    count(distinct order_id) as total_orders,
    sum(total_amount_local) as total_revenue,
    avg(total_amount_local) as avg_order_value
from sales
group by 1
order by 1 desc