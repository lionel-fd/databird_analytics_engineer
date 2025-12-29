select 
    store_id,
    product_id,
    quantity_in_stock,
    stock_value
from {{ ref('int_local_bike__stores_stocks')}}
