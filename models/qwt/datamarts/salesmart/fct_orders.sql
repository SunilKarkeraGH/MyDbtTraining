{{ config(materialized = 'view', schema = 'salesmart') }}

select 
    o.*, 
    od.lineno,
    od.productid, 
    od.Quantity, 
    od.unitprice, 
    od.Discount, 
    od.linesalesamount
from {{ref("trf_order_details_delta")}} as od inner join
{{ref("trf_order_delta")}} as o on 
o.orderid = od.orderid