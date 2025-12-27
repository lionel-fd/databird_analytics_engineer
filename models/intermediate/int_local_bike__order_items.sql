with order_items_amounts as
(
    select
        oi.order_id,
        order_item_id,
        oi.product_id,
        oi.quantity,
        oi.unit_price,
        brut_total_amount,
        oi.pourcentage_discount,
           
    from {{ ref('stg_local_bike__order_items') }} as oi
), 

discount_calculated as
(
    select *,
        round(brut_total_amount * pourcentage_discount,3) AS discount_amount
    from order_items_amounts
),

final as
(
    select *,
        round(brut_total_amount - discount_amount,2) AS net_amount
    from discount_calculated
)

select *
from final