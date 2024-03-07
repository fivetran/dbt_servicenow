{{ config(enabled=var('servicenow__using_roles', False)) }}

{{
    fivetran_utils.union_data(
        table_identifier='sys_user_role', 
        database_variable='servicenow_database', 
        schema_variable='servicenow_schema', 
        default_database=target.database,
        default_schema='servicenow',
        default_variable='sys_user_role',
        union_schema_variable='servicenow_union_schemas',
        union_database_variable='servicenow_union_databases'
    )
}}
