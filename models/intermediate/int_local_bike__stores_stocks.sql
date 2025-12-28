with stocks as 
(
    select * 
    from {{ ref('stg_local_bike__stocks') }}
),
products as 
(
    select 
        product_id, 
        catalog_price 
    from {{ ref('stg_local_bike__products') }}
)

select
    s.store_id,
    s.product_id,
    s.quantity,
    (s.quantity * p.catalog_price) as stock_value
from stocks s
join products p 
on s.product_id = p.product_id