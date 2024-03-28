with
    orders as (
        select
            leads.order_id,
            leads.company_id,
            leads.company_name,
            leads.order_value,
            leads.converted,
            leads.conversion_desc,
            leads.order_datetime as lead_date,
            invoices.order_date,
            invoices.meal_id,
            invoices.meal_date,
            invoices.customers,
            invoices.meal_price,
            invoices.meal_type,
            invoices.order_datetime,
            invoices.meal_datetime,
            invoices.order_day_of_week,
            invoices.order_month,
            invoices.order_year,
            invoices.num_of_customers,

            date_diff(
                cast(invoices.order_datetime as date), cast(invoices.meal_datetime as date), day
            ) as meal_lead_times,

            invoices.meal_price / invoices.num_of_customers as avg_cust_spend_per_meal
        from {{ ref("stg_order_leads") }} leads
        left join
            {{ ref("stg_invoices") }} invoices on leads.order_id = invoices.order_id
    )
select *
from orders
