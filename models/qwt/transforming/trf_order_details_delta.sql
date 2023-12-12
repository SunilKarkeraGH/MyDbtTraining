{{ config(materialized = 'table',schema = 'transforming') }}
select *, 
(UnitPrice * Quantity) * (1-Discount) as LineSalesAmount
 from 
{{ ref("stg_order_details") }}