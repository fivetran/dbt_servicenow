{{
    fivetran_utils.union_data(
        table_identifier='change_request', 
        database_variable='servicenow_database', 
        schema_variable='servicenow_schema', 
        default_database=target.database,
        default_schema='servicenow',
        default_variable='change_request',
        union_schema_variable='servicenow_union_schemas',
        union_database_variable='servicenow_union_databases'
    )
}}
