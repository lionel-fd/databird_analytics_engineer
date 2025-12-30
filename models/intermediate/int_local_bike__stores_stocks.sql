with stocks as 
(
    select * 
    from {{ ref('stg_local_bike__stocks') }}
),
products as 
(
    select 
        product_id,
        product_name,
        category_id,
        model_year,
        catalog_price 
    from {{ ref('stg_local_bike__products') }}
),
categories as
(
    select
        category_id,
        category_name
    from {{ ref('stg_local_bike__categories') }}
)

select
    s.store_product_id,
    s.store_id,
    s.product_id,
    p.product_name,
    p.model_year,
    c.category_name,
    s.quantity_in_stock,
    (s.quantity_in_stock * p.catalog_price) as stock_value
from stocks as s
join products as p 
    on s.product_id = p.product_id
join categories as c
    on p.category_id = c.category_id