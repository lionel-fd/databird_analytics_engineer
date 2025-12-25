with 

source as (

    select * from {{ source('local_bike', 'products') }}

),

renamed as (

    select
        cast(product_id as string) as product_id,
        product_name,
        cast(brand_id as string) as brand_id,
        cast(category_id as string) as category_id,
        cast(model_year as int) as model_year,
        cast(list_price as numeric) as catalog_price

    from source

)

select * from renamed