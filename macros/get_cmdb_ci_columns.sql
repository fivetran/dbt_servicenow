{% macro get_cmdb_ci_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": dbt.type_boolean()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "attributes", "datatype": dbt.type_string()},
    {"name": "business_unit_link", "datatype": dbt.type_string()},
    {"name": "business_unit_value", "datatype": dbt.type_string()},
    {"name": "category", "datatype": dbt.type_string()},
    {"name": "company_link", "datatype": dbt.type_string()},
    {"name": "company_value", "datatype": dbt.type_string()},
    {"name": "cost", "datatype": dbt.type_float()},
    {"name": "cost_cc", "datatype": dbt.type_string()},
    {"name": "cost_center_link", "datatype": dbt.type_string()},
    {"name": "cost_center_value", "datatype": dbt.type_string()},
    {"name": "managed_by_link", "datatype": dbt.type_string()},
    {"name": "managed_by_value", "datatype": dbt.type_string()},
    {"name": "manufacturer_link", "datatype": dbt.type_string()},
    {"name": "manufacturer_value", "datatype": dbt.type_string()},
    {"name": "model_id_link", "datatype": dbt.type_string()},
    {"name": "model_id_value", "datatype": dbt.type_string()},
    {"name": "model_number", "datatype": dbt.type_string()},
    {"name": "name", "datatype": dbt.type_string()},
    {"name": "owned_by_link", "datatype": dbt.type_string()},
    {"name": "owned_by_value", "datatype": dbt.type_string()},
    {"name": "subcategory", "datatype": dbt.type_string()},
    {"name": "sys_class_name", "datatype": dbt.type_string()},
    {"name": "sys_class_path", "datatype": dbt.type_string()},
    {"name": "sys_created_by", "datatype": dbt.type_string()},
    {"name": "sys_created_on", "datatype": dbt.type_timestamp()},
    {"name": "sys_domain_link", "datatype": dbt.type_string()},
    {"name": "sys_domain_path", "datatype": dbt.type_string()},
    {"name": "sys_domain_value", "datatype": dbt.type_string()},
    {"name": "sys_id", "datatype": dbt.type_string()},
    {"name": "sys_mod_count", "datatype": dbt.type_int()},
    {"name": "sys_updated_by", "datatype": dbt.type_string()},
    {"name": "sys_updated_on", "datatype": dbt.type_timestamp()},
    {"name": "unverified", "datatype": dbt.type_boolean()},
    {"name": "vendor_link", "datatype": dbt.type_string()},
    {"name": "vendor_value", "datatype": dbt.type_string()},
] %}

{{ return(columns) }}

{% endmacro %}