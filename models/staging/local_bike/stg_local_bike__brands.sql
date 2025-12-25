with 

source as (

    select * from {{ source('local_bike', 'brands') }}

),

renamed as (

    select
        cast(brand_id as string) as brand_id,
        brand_name

    from source

)

select * from renamed