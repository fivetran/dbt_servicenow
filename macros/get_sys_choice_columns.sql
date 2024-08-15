{% macro get_sys_choice_columns() %}

{% set columns = [
    {"name": "sys_id", "datatype": dbt.type_string()},
    {"name": "_fivetran_deleted", "datatype": dbt.type_boolean()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "dependent_value", "datatype": dbt.type_string()},
    {"name": "element", "datatype": dbt.type_string()},
    {"name": "hint", "datatype": dbt.type_string()},
    {"name": "inactive", "datatype": dbt.type_boolean()},
    {"name": "label", "datatype": dbt.type_string()},
    {"name": "language", "datatype": dbt.type_string()},
    {"name": "name", "datatype": dbt.type_string()},
    {"name": "sequence", "datatype": dbt.type_int()},
    {"name": "synonyms", "datatype": dbt.type_string()},
    {"name": "sys_created_by", "datatype": dbt.type_string()},
    {"name": "sys_created_on", "datatype": dbt.type_timestamp()},
    {"name": "sys_domain_link", "datatype": dbt.type_string()},
    {"name": "sys_domain_path", "datatype": dbt.type_string()},
    {"name": "sys_domain_value", "datatype": dbt.type_string()},
    {"name": "sys_mod_count", "datatype": dbt.type_int()},
    {"name": "sys_updated_by", "datatype": dbt.type_string()},
    {"name": "sys_updated_on", "datatype": dbt.type_timestamp()},
    {"name": "value", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
