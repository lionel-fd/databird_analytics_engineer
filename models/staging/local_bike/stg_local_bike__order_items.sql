with 

source as (

    select * from {{ source('local_bike', 'order_items') }}

),

renamed as (

    select
        cast(concat(order_id, '_', product_id)as string) as order_item_id,
        cast(order_id as string) as order_id,
        cast(item_id as string) as item_id,
        cast(product_id as string) as product_id,
        quantity,
        list_price as unit_price,
        (quantity * list_price) as brut_total_amount,
        discount as pourcentage_discount


    from source

)

select * from renamed