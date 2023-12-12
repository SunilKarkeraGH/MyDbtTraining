{{ config(materialized = 'view', schema = 'Reporting') }}

select 
    c.categoryname 
    ,sum(od.linesalesamount) as sales 
from 
    {{ref('trf_order_details_delta')}} od 

inner join 
    {{ ref('trf_product') }} p 
on od.productid = p.productid 

inner join 
    {{ref('categories')}} c 
on p.categoryid = c.categoryid

group by c.categoryname 
order by sales desc