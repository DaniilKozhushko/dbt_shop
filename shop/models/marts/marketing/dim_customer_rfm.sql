{{ config(materialized='table') }}

with sales as (
    select * from {{ ref('fct_sales') }}
)

select
    user_id,
    min(order_date) as first_order_date,
    max(order_date) as last_order_date,
    count(distinct order_item_sk) as frequency, -- В fct_sales у нас гранулярность строк, можно считать транзакции
    sum(total_amount_local) as monetary_value,
    
    case 
        when sum(total_amount_local) > 5000 then 'VIP'
        when sum(total_amount_local) > 1000 then 'Regular'
        else 'Newbie'
    end as customer_segment
from sales
group by 1