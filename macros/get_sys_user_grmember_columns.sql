{% macro get_sys_user_grmember_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": dbt.type_boolean()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "group_link", "datatype": dbt.type_string()},
    {"name": "group_value", "datatype": dbt.type_string()},
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
