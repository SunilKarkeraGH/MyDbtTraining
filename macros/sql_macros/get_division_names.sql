{% macro get_division_names() -%}

{% set divisions_query %}

    select 
        distinct replace(DivisionName,' ','') as DivisionName  
    from 
        {{ ref('divisions') }}
{% endset %}

{% set results = run_query(divisions_query) %}

{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0].values() %}
{% else %}
{% set results_list = [] %}
{% endif %}

{{ return(results_list) }}

{%- endmacro %}

{% macro cents_to_dollars(column_name,precision=2) -%}
({{column_name}}/100)::numeric(16,{{precision}})
{%- endmacro %}