{{ config(materialized = 'incremental', unique_key = 'orderid', schema = 'transforming') }}

select * from 
{{ ref('stg_orders') }}

{% if is_incremental() %}

  where orderdate > (select max(orderdate) from {{ this }})
{% endif %}