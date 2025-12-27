with products as
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
),

stocks as
(
    select
        product_id,
        quantity_in_stock
    from {{ ref('stg_local_bike__stocks') }}

)

select 
    p.product_id,
    p.product_name,
    c.category_name,
    p.model_year,
    p.catalog_price,
    s.quantity_in_stock

from products as p
left join categories as c
    on p.category_id = c.category_id
left join stocks as s
    on p.product_id = s.product_id