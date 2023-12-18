{% macro get_incident_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": dbt.type_boolean()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "business_impact", "datatype": dbt.type_string()},
    {"name": "business_stc", "datatype": dbt.type_int()},
    {"name": "calendar_stc", "datatype": dbt.type_int()},
    {"name": "caller_id_link", "datatype": dbt.type_string()},
    {"name": "caller_id_value", "datatype": dbt.type_string()},
    {"name": "category", "datatype": dbt.type_string()},
    {"name": "cause", "datatype": dbt.type_string()},
    {"name": "caused_by_link", "datatype": dbt.type_string()},
    {"name": "caused_by_value", "datatype": dbt.type_string()},
    {"name": "child_incidents", "datatype": dbt.type_int()},
    {"name": "close_code", "datatype": dbt.type_string()},
    {"name": "hold_reason", "datatype": dbt.type_int()},
    {"name": "incident_state", "datatype": dbt.type_int()},
    {"name": "notify", "datatype": dbt.type_int()},
    {"name": "origin_id_link", "datatype": dbt.type_string()},
    {"name": "origin_id_value", "datatype": dbt.type_string()},
    {"name": "parent_incident_link", "datatype": dbt.type_string()},
    {"name": "parent_incident_value", "datatype": dbt.type_string()},
    {"name": "problem_id_link", "datatype": dbt.type_string()},
    {"name": "problem_id_value", "datatype": dbt.type_string()},
    {"name": "reopen_count", "datatype": dbt.type_int()},
    {"name": "reopened_by_link", "datatype": dbt.type_string()},
    {"name": "reopened_by_value", "datatype": dbt.type_string()},
    {"name": "reopened_time", "datatype": dbt.type_timestamp()},
    {"name": "resolved_at", "datatype": dbt.type_timestamp()},
    {"name": "resolved_by_link", "datatype": dbt.type_string()},
    {"name": "resolved_by_value", "datatype": dbt.type_string()},
    {"name": "rfc_link", "datatype": dbt.type_string()},
    {"name": "rfc_value", "datatype": dbt.type_string()},
    {"name": "severity", "datatype": dbt.type_int()},
    {"name": "subcategory", "datatype": dbt.type_string()},
    {"name": "sys_created_on", "datatype": dbt.type_timestamp()},
    {"name": "sys_id", "datatype": dbt.type_string()},
    {"name": "sys_updated_on", "datatype": dbt.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}
