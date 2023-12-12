{{ config(materialized = 'view', schema = 'salesmart') }}

{%- call statement('my_statement', fetch_result=True) -%}
      Select min(orderdate) from stg_orders
{%- endcall -%}

{%- set min_date = load_result('my_statement')['data'][0][0] -%}
--{%- set max_date = load_result('my_statement')['data'][0][0] -%}
