with orders_grouped as
(
select 
    o.order_id,
    o.order_status_code,
    o.order_date_at,
    o.required_date_at,
    o.shipped_date_at,
    o.store_id,
    o.customer_id,
    
    count(distinct oi.product_id) as total_distinct_products,
    sum(brut_total_amount) as brut_total_amount,
    sum(oi.quantity) as total_quantity_items,
    sum(oi.discount_amount) as total_discount_amount,
    sum(oi.net_amount) as total_net_amount,
    date_diff(o.shipped_date_at,o.required_date_at, DAY) as delivery_delay_days,
    
from {{ ref('int_local_bike__order_items') }} oi
join {{ ref('stg_local_bike__orders')}} o
on oi.order_id = o.order_id

where o.order_status_code = 4
group by 
    o.order_id,
    o.order_date_at,
    o.required_date_at,
    o.shipped_date_at,
    o.store_id,
    o.customer_id,
    o.order_status_code
),

final as 
(
    select *,
    case 
        when s.delivery_delay_days < 0 then 'ahead'
        when s.delivery_delay_days = 0 then 'on_time'
        else 'late'
     end as delivery_status
    from orders_grouped as s
)

select *
from final