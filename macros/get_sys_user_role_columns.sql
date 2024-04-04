{% macro get_sys_user_role_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": dbt.type_boolean()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "assignable_by_link", "datatype": dbt.type_string()},
    {"name": "assignable_by_value", "datatype": dbt.type_string()},
    {"name": "can_delegate", "datatype": dbt.type_boolean()},
    {"name": "description", "datatype": dbt.type_string()},
    {"name": "elevated_privilege", "datatype": dbt.type_boolean()},
    {"name": "grantable", "datatype": dbt.type_boolean()},
    {"name": "includes_roles", "datatype": dbt.type_string()},
    {"name": "name", "datatype": dbt.type_string()},
    {"name": "requires_subscription", "datatype": dbt.type_string()},
    {"name": "scoped_admin", "datatype": dbt.type_boolean()},
    {"name": "suffix", "datatype": dbt.type_string()},
    {"name": "sys_created_on", "datatype": dbt.type_timestamp()},
    {"name": "sys_id", "datatype": dbt.type_string()},
    {"name": "sys_updated_on", "datatype": dbt.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}
