{% macro get_sys_user_group_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": dbt.type_boolean()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "active", "datatype": dbt.type_boolean()},
    {"name": "cost_center_link", "datatype": dbt.type_string()},
    {"name": "cost_center_value", "datatype": dbt.type_string()},
    {"name": "default_assignee_link", "datatype": dbt.type_string()},
    {"name": "default_assignee_value", "datatype": dbt.type_string()},
    {"name": "description", "datatype": dbt.type_string()},
    {"name": "email", "datatype": dbt.type_string()},
    {"name": "exclude_manager", "datatype": dbt.type_boolean()},
    {"name": "include_members", "datatype": dbt.type_boolean()},
    {"name": "manager_link", "datatype": dbt.type_string()},
    {"name": "manager_value", "datatype": dbt.type_string()},
    {"name": "name", "datatype": dbt.type_string()},
    {"name": "parent_link", "datatype": dbt.type_string()},
    {"name": "parent_value", "datatype": dbt.type_string()},
    {"name": "roles", "datatype": dbt.type_string()},
    {"name": "source", "datatype": dbt.type_string()},
    {"name": "sys_created_by", "datatype": dbt.type_string()},
    {"name": "sys_created_on", "datatype": dbt.type_timestamp()},
    {"name": "sys_id", "datatype": dbt.type_string()},
    {"name": "sys_mod_count", "datatype": dbt.type_int()},
    {"name": "sys_updated_by", "datatype": dbt.type_string()},
    {"name": "sys_updated_on", "datatype": dbt.type_timestamp()},
    {"name": "type", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
