with 

source as (

    select * from {{ source('local_bike', 'orders') }}

),

renamed as (

    select
        cast(order_id as string) as order_id,
        cast(customer_id as string) as customer_id,
        cast(order_status as string) as order_status_code,
        cast(order_date as DATE) as order_date_at,
        cast(required_date as DATE) as required_date_at,
        shipped_date as shipped_date_at,
        cast(store_id as string) as store_id,
        cast(staff_id as string) as staff_id

    from source

)

select * from renamed