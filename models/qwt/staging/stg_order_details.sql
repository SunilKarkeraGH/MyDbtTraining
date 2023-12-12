{{ config( materialized = 'table'  ) }}

select {{ dbt_utils.generate_surrogate_key(['OrderID', 'LineNo']) }} OrderLine , * 
from {{env_var('DBT_SOURCEDB','QWT')}}.{{env_var('DBT_SRCSCHEMA','RAW')}}.orderdetails