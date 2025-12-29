select 
    product_id,
    product_name,
    category_name,
    model_year
from {{ ref('int_local_bike__products')}}