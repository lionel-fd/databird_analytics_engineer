with sales_base as
(
select 
    oi.product_id,
    o.order_id,
    o.order_status_code,
    o.order_date_at,
    o.required_date_at,
    o.shipped_date_at,
    o.store_id,
    o.customer_id,
    oi.brut_total_amount,
    oi.quantity,
    oi.discount_amount,
    oi.net_amount
    
from {{ ref('int_local_bike__order_items') }} oi
join {{ ref('stg_local_bike__orders') }} o
on oi.order_id = o.order_id

), delivery_delay_days as
(
    select *,
        case when shipped_date_at is null 
            then 'in_store'
            else 'shipped' 
        end as delivery_type,

        date_diff(shipped_date_at,required_date_at, DAY) as delivery_delay_days,

    from sales_base
),

final as 
(
    select *,
    case 
        when dd.delivery_delay_days < 0 then 'ahead'
        when dd.delivery_delay_days = 0 then 'on_time'
        when dd.delivery_delay_days > 0 then 'late'
        else ''
     end as delivery_status
    from delivery_delay_days as dd
)

select *
from final