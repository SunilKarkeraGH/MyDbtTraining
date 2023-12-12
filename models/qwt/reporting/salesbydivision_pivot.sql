    {{ config (materialized = 'view', schema = 'reporting') }}
    {%set DivisionNames = get_division_names() %}
    select 

        od.orderid, 
        {% for DivisionName in  DivisionNames%}
            sum(case when d.DivisionName = '{{DivisionName}}' then od.linesalesamount end ) as {{DivisionName}}_Sales,
        {% endfor %}
        sum(od.linesalesamount) as sales 
    from
        {{ ref("trf_order_details_delta") }} as od 
    inner join {{ ref('trf_order_delta') }} as o 
    on od.orderid = o.orderid
    inner join {{ ref('trf_customer') }} as c on c.customerid = o.customerid 
    inner join
    (
        select divisionid,replace(DivisionName,' ','') as DivisionName  from {{ ref("divisions")}}
    ) d
    on d.divisionid = c.divisionid
    group by od.orderid