{{ config ( materialized = 'table', schema = 'transforming') }}

select
	CustomerID
	,CompanyName
	,ContactName
	,City
	,Country
	,DivisionID
	,Address
	,Fax
	,Phone
	,PostalCode
	,StateProvince
from {{ ref( 'stg_customer' )}}

