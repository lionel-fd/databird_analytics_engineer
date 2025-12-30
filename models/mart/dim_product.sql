select 
    product_id,
    product_name,
    category_name,
    model_year,
    brand_name,
    catalog_price
from {{ ref('stg_local_bike__products')}} as p
left join {{ ref('stg_local_bike__categories')}} as c
    on p.category_id = c.category_id
left join {{ ref('stg_local_bike__brands')}} as b
    on p.brand_id = b.brand_id