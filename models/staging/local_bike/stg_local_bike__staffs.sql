with 

source as (

    select * from {{ source('local_bike', 'staffs') }}

),

renamed as (

    select
        cast(staff_id as string) as staff_id,
        first_name,
        last_name,
        email,
        phone,
        active,
        cast(store_id as string) as store_id,
        cast(manager_id as string) as manager_id

    from source

)

select * from renamed