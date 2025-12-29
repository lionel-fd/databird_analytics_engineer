with sales_aggregated as
(
    select 
      product_id,
      order_date_at,
      order_status_code,
      order_id,
      delivery_delay_days,
      delivery_type,
      delivery_status,
      store_id,
      customer_id,
      
      sum(quantity) as qty_sold,
      sum(brut_total_amount) as gross_amount,
      sum(discount_amount) as discount_amount,
      sum(net_amount) as net_amount,
      round(safe_divide(sum(discount_amount),sum(brut_total_amount)),2) as discount_rate
      
    from {{ ref('int_local_bike__orders') }} as s
    group by 
        product_id,
        order_date_at,
        order_status_code,
        order_id,
        delivery_delay_days,
        delivery_type,
        delivery_status,
        store_id,
        customer_id
),

final as
(
  select 
    *,
    safe_divide(net_amount, qty_sold) as net_avg_price
  from sales_aggregated
)

select *
from final