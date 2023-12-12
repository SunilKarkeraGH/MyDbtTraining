{{ config (materialized = 'view', schema = 'Reporting') }}

Select 
    city as officecity 
    ,country
    ,Empid
    ,lastname
    ,firstname
    ,title
    ,hiredate
    ,yearsalary
    ,reporting_to    
from 
    {{ref('trf_employee')}} as emp
inner join 
    {{ref('stg_office')}} as ofc
on 
    emp.officeid = ofc.officeid