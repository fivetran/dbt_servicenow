{{
    fivetran_utils.union_data(
        table_identifier='change_task', 
        database_variable='servicenow_database', 
        schema_variable='servicenow_schema', 
        default_database=target.database,
        default_schema='servicenow',
        default_variable='change_task',
        union_schema_variable='servicenow_union_schemas',
        union_database_variable='servicenow_union_databases'
    )
}}
