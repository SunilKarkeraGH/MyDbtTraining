{% snapshot employee_snapshot %}

{{ config
    (
        target_database = 'qwt',
        target_schema = 'snapshots',
        unique_key = 'EmpID',

        strategy = 'timestamp',
        updated_at = 'HireDate'
    )

}}

select * from {{ref('stg_employee')}}

{% endsnapshot %}