with 

source as (

    select * from {{ source('local_bike', 'stocks') }}

),

renamed as (

    select
        cast(concat(store_id, '_', product_id) as string) as stock_product_id,
        cast(store_id as string) as store_id,
        cast(product_id as string) as product_id,
        cast(quantity as int) as quantity_in_stock

    from source

)

select * from renamed