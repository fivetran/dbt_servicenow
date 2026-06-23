{% if var('servicenow_union_schemas', []) | length > 0 or var('servicenow_union_databases', []) | length > 0 %}

{{
    fivetran_utils.union_data(
        table_identifier='task_sla',
        database_variable='servicenow_database',
        schema_variable='servicenow_schema',
        default_database=target.database,
        default_schema='servicenow',
        default_variable='task_sla',
        union_schema_variable='servicenow_union_schemas',
        union_database_variable='servicenow_union_databases'
    )
}}

{% else %}

{{
    fivetran_utils.union_connections(
        connection_dictionary='servicenow_sources',
        single_source_name='servicenow',
        single_table_name='task_sla'
    )
}}

{% endif %}
