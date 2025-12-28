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
)

select 
    p.product_id,
    p.product_name,
    c.category_name,
    p.model_year
       
from products as p
left join categories as c
    on p.category_id = c.category_id

group by 
    p.product_id,
    p.product_name,
    c.category_name,
    p.model_year