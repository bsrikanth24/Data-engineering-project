{#
    This macro returns the whether an order lead was converted into a sale or not 
#}

{% macro get_order_lead_conversion_description(converted) -%}

    case {{ dbt.safe_cast("converted", api.Column.translate_type("integer")) }}  
        when 0 then 'Not Converted'
        when 1 then 'Converted'
        else 'EMPTY'
    end

{%- endmacro %}