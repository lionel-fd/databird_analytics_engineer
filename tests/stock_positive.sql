select
    store_product_id,
    sum(stock_value) as total_stock_value
from {{ ref('int_local_bike__stores_stocks') }}
group by 1
having total_stock_value < 0