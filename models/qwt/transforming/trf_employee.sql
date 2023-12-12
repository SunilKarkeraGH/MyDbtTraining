{{ config ( materialized = 'table', schema = 'transforming') }}

select 
a.EmpID
,a.LastName
,a.FirstName
,a.Title
,a.HireDate
,a.OfficeID
,a.Extension
,coalesce(b.FirstName,a.FirstName) as Reporting_To
,a.YearSalary
from {{ref('stg_employee')}} a
left join {{ref('stg_employee')}} b
on 	a.EmpID = b.ReportsTo