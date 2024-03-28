{{ config(materialized="table") }}

select distinct company_name, company_id
from {{ ref ("stg_sales_team") }}
