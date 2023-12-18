{% macro get_problem_task_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": dbt.type_boolean()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "cause_code", "datatype": dbt.type_string()},
    {"name": "close_code", "datatype": dbt.type_string()},
    {"name": "other_reason", "datatype": dbt.type_string()},
    {"name": "problem_link", "datatype": dbt.type_string()},
    {"name": "problem_task_type", "datatype": dbt.type_string()},
    {"name": "problem_value", "datatype": dbt.type_string()},
    {"name": "reopen_count", "datatype": dbt.type_int()},
    {"name": "reopened_at", "datatype": dbt.type_timestamp()},
    {"name": "reopened_by_link", "datatype": dbt.type_string()},
    {"name": "reopened_by_value", "datatype": dbt.type_string()},
    {"name": "started_at", "datatype": dbt.type_timestamp()},
    {"name": "started_by_link", "datatype": dbt.type_string()},
    {"name": "started_by_value", "datatype": dbt.type_string()},
    {"name": "sys_created_on", "datatype": dbt.type_timestamp()},
    {"name": "sys_id", "datatype": dbt.type_string()},
    {"name": "sys_updated_on", "datatype": dbt.type_timestamp()},
    {"name": "vendor_link", "datatype": dbt.type_string()},
    {"name": "vendor_value", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
