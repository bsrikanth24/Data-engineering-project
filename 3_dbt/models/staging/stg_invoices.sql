with 

source as (

    select * from {{ source('staging', 'invoices') }}

),

renamed as (

    select
        order_id,
        order_date,
        meal_id,
        company_id,
        meal_date,
        customers,
        meal_price,
        meal_type,
        order_datetime,
        meal_datetime,
        order_day_of_week,
        order_month,
        order_year,
        num_of_customers

    from source

)

select * from renamed
