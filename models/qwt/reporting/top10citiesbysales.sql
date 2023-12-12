{{config( materialized = 'view', schema = 'reporting')}}

select
    c.city,
    sum(o.linesalesamount) sales
from 
    {{ref("dim_customers")}} as c 
inner join 
    {{ref("fct_orders")}} as o
on 
    c.customerid = o.customerid
where 
    c.divisionname = '{{var('divisionname',"'Europe'")}}'
group by c.city
order by sales desc limit 10