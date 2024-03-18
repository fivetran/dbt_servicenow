{% macro get_sys_user_has_role_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": dbt.type_boolean()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "granted_by_link", "datatype": dbt.type_string()},
    {"name": "granted_by_value", "datatype": dbt.type_string()},
    {"name": "included_in_role_instance_link", "datatype": dbt.type_string()},
    {"name": "included_in_role_instance_value", "datatype": dbt.type_string()},
    {"name": "included_in_role_link", "datatype": dbt.type_string()},
    {"name": "included_in_role_value", "datatype": dbt.type_string()},
    {"name": "inh_count", "datatype": dbt.type_int()},
    {"name": "inh_map", "datatype": dbt.type_string()},
    {"name": "inherited", "datatype": dbt.type_boolean()},
    {"name": "role_link", "datatype": dbt.type_string()},
    {"name": "role_value", "datatype": dbt.type_string()},
    {"name": "state", "datatype": dbt.type_string()},
    {"name": "sys_created_by", "datatype": dbt.type_string()},
    {"name": "sys_created_on", "datatype": dbt.type_timestamp()},
    {"name": "sys_id", "datatype": dbt.type_string()},
    {"name": "sys_mod_count", "datatype": dbt.type_int()},
    {"name": "sys_updated_by", "datatype": dbt.type_string()},
    {"name": "sys_updated_on", "datatype": dbt.type_timestamp()},
    {"name": "user_link", "datatype": dbt.type_string()},
    {"name": "user_value", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
