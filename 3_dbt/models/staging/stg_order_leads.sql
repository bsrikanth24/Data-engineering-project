with

    source as (

        select *
        from {{ source("staging", "order_leads") }}

    ),

    renamed as (

        select
            order_id,
            order_day_of_week,
            order_month,
            order_year,
            company_id,
            company_name,
            order_datetime,
            order_value,
            converted,
            {{ get_order_lead_conversion_description("converted") }} as conversion_desc
        from source

    )

select *
from renamed
