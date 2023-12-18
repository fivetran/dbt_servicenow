{% macro get_task_sla_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": dbt.type_boolean()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "active", "datatype": dbt.type_boolean()},
    {"name": "business_duration", "datatype": dbt.type_timestamp()},
    {"name": "business_pause_duration", "datatype": dbt.type_timestamp()},
    {"name": "business_percentage", "datatype": dbt.type_float()},
    {"name": "business_time_left", "datatype": dbt.type_timestamp()},
    {"name": "duration", "datatype": dbt.type_timestamp()},
    {"name": "end_time", "datatype": dbt.type_timestamp()},
    {"name": "has_breached", "datatype": dbt.type_boolean()},
    {"name": "original_breach_time", "datatype": dbt.type_timestamp()},
    {"name": "pause_duration", "datatype": dbt.type_timestamp()},
    {"name": "pause_time", "datatype": dbt.type_timestamp()},
    {"name": "percentage", "datatype": dbt.type_float()},
    {"name": "planned_end_time", "datatype": dbt.type_timestamp()},
    {"name": "schedule_link", "datatype": dbt.type_string()},
    {"name": "schedule_value", "datatype": dbt.type_string()},
    {"name": "sla_link", "datatype": dbt.type_string()},
    {"name": "sla_value", "datatype": dbt.type_string()},
    {"name": "stage", "datatype": dbt.type_string()},
    {"name": "start_time", "datatype": dbt.type_timestamp()},
    {"name": "sys_created_by", "datatype": dbt.type_string()},
    {"name": "sys_created_on", "datatype": dbt.type_timestamp()},
    {"name": "sys_id", "datatype": dbt.type_string()},
    {"name": "sys_mod_count", "datatype": dbt.type_int()},
    {"name": "sys_updated_by", "datatype": dbt.type_string()},
    {"name": "sys_updated_on", "datatype": dbt.type_timestamp()},
    {"name": "task_link", "datatype": dbt.type_string()},
    {"name": "task_value", "datatype": dbt.type_string()},
    {"name": "time_left", "datatype": dbt.type_timestamp()},
    {"name": "timezone", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
