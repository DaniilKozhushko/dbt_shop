{{ config(materialized='table') }}

with sales as (
    select * from {{ ref('int_sales_enriched') }}
    -- Для налоговой учитываем только доставленные заказы (признание выручки)
    where status_id = 3 -- delivered
)

select
    order_date::date as tax_date,
    sum(total_amount_local) as gross_revenue,
    round(sum(total_amount_local) / 1.20 * 0.20, 2) as vat_tax_amount_20 -- Выделяем НДС 20%
from sales
group by 1