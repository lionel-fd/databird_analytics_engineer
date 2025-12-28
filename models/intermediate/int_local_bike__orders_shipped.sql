with sales_base as
(
select 
    oi.product_id,
    o.order_id,
    o.order_status_code,
    o.order_date_at,
    o.required_date_at,
    o.shipped_date_at,
    date_diff(o.shipped_date_at,o.required_date_at, DAY) as delivery_delay_days,
    o.store_id,
    o.customer_id,
    oi.brut_total_amount,
    oi.quantity,
    oi.discount_amount,
    oi.net_amount
    
from {{ ref('int_local_bike__order_items') }} oi
join {{ ref('stg_local_bike__orders') }} o
on oi.order_id = o.order_id

where o.order_status_code = 4
),

final as 
(
    select *,
    case 
        when s.delivery_delay_days < 0 then 'ahead'
        when s.delivery_delay_days = 0 then 'on_time'
        else 'late'
     end as delivery_status
    from sales_base as s
)

select *
from final