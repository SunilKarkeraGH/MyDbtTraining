select 
    productid
from 
{{ref('trf_product')}}
where unitcost>unitprice