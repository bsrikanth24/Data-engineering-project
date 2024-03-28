{{ config(materialized="table") }}

select distinct sales_rep_name, sales_rep_id
from {{ ref("stg_sales_team") }}
