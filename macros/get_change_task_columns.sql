{% macro get_change_task_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": dbt.type_boolean()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "change_request_link", "datatype": dbt.type_string()},
    {"name": "change_request_value", "datatype": dbt.type_string()},
    {"name": "change_task_type", "datatype": dbt.type_string()},
    {"name": "close_code", "datatype": dbt.type_string()},
    {"name": "created_from", "datatype": dbt.type_string()},
    {"name": "on_hold", "datatype": dbt.type_boolean()},
    {"name": "on_hold_reason", "datatype": dbt.type_string()},
    {"name": "planned_end_date", "datatype": dbt.type_timestamp()},
    {"name": "planned_start_date", "datatype": dbt.type_timestamp()},
    {"name": "sys_created_on", "datatype": dbt.type_timestamp()},
    {"name": "sys_id", "datatype": dbt.type_string()},
    {"name": "sys_updated_on", "datatype": dbt.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}
