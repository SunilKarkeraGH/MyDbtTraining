{{ config ( materialized = 'table', sql_header = "Alter session set timezone = 'Asia/Kolkata';" , schema = 'transforming') }}

select
    ProductID
    ,ProductName
    ,SupplierID
    ,CategoryID
    ,QuantityPerUnit
    ,UnitCost
    ,UnitPrice
    ,UnitsInStock
    ,UnitsOnOrder
    ,(QuantityPerUnit * UnitPrice ) as TotalProductCost
    ,case when (UnitsInStock - UnitsOnOrder ) > 0 then 'True' else 'False' end as ProductAvailability
    ,(UnitPrice - UnitCost )Profit 
from {{ ref( 'stg_product' )}}
