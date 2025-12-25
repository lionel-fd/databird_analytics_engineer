with 

source as (

    select * from {{ source('local_bike', 'orders') }}

),

renamed as (

    select
        cast(order_id as string) as order_id,
        cast(customer_id as string) as customer_id,
        case order_status
            when 1 then 'pending'
            when 2 then 'processing'
            when 3 then 'completed'
            when 4 then 'cancelled'
            else 'unknown'
        end as order_status,
        cast(order_date as DATE) as order_date_at,
        cast(required_date as DATE) as required_date_at,
        shipped_date as shipped_date_at,
        cast(store_id as string) as store_id,
        cast(staff_id as string) as staff_id

    from source

)

select * from renamed