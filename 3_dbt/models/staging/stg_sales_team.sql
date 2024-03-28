with 

source as (

    select * from {{ source('staging', 'sales_team') }}

),

renamed as (

    select
        sales_rep as sales_rep_name,
        sales_rep_id,
        company_name,
        company_id
    from source

)

select * from renamed
