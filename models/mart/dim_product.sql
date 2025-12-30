select 
    product_id,
    product_name,
    category_id,
    model_year,
    brand_id
from {{ ref('stg_local_bike__products')}}