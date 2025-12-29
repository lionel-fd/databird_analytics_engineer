select 
    store_id,
    city,
    state
from {{ ref('stg_local_bike__stores')}}