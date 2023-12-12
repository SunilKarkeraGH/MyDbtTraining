{{ config(materialized = 'view', schema = 'salesmart')}}

select 
    P.productid, 
    P.ProductName, 
    P.QuantityPerUnit, 
    P.unitcost, 
    P.unitprice, 
    P.unitsinstock, 
    P.unitsonorder, 
    P.totalproductcost, 
    p.productavailability, 
    p.profit, 
    S.contactname, 
    S.CompanyName,
    S.City, 
    S.country, 
    C.Categoryname
from 
    {{ ref('trf_product') }} as P 
inner join 
    {{ ref('trf_suppliers')}} as S 
on 
    P.SupplierID = S.SupplierID
inner join
    {{ ref("categories") }} as C 
on 
    P.CategoryID = C.CategoryID