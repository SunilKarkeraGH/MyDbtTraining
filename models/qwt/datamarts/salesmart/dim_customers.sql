{{ config (materialized = 'view', schema = 'salesmart') }}
select 
c.customerid, c.companyname, c.contactname, c.country, c.city, c.phone, d.DivisionName
from 
{{ ref('trf_customer')}} as c inner join 
{{ ref('divisions') }} as d on
c.divisionid = d.divisionid