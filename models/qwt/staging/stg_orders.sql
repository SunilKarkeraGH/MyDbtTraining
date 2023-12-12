{{ config ( materialized = 'table' ) }}

select * from
{{env_var('DBT_SOURCEDB','QWT')}}.{{env_var('DBT_SRCSCHEMA','RAW')}}.Orders