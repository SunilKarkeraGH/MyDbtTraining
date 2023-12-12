{% macro grant_select(schema,role) %}

{% set sql %}
    grant usage on schema {{ schema }} to role {{ role }};
    grant select on all tables in schema {{ schema }} to role {{ role }};
    grant select on all views in schema {{ schema }} to role {{ role }};
{% endset %}
{% do run_query(sql) %}
{% do log("Privileges granted", info=True) %}

{% endmacro %}