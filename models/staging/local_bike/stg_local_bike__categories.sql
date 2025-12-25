with 

source as (

    select * from {{ source('local_bike', 'categories') }}

),

renamed as (

    select
        cast(category_id as string) as category_id,
        category_name

    from source

)

select * from renamed