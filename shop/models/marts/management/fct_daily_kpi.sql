{{ config(materialized='incremental', unique_key='report_date') }}

with sales as (
    select * from {{ ref('int_sales_enriched') }}
)

select
    order_date::date as report_date,
    count(distinct order_id) as daily_orders,
    count(distinct user_id) as active_users,
    sum(total_amount_local) as daily_revenue
from sales
group by 1

{% if is_incremental() %}
    having report_date >= (select max(report_date) from {{ this }})
{% endif %}