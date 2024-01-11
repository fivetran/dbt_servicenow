{% macro get_core_company_columns() %}

{% set columns = [

    {"name": "_fivetran_deleted", "datatype": dbt.type_boolean()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "sys_id", "datatype": dbt.type_string()},
    {"name": "city", "datatype": dbt.type_string()},
    {"name": "country", "datatype": dbt.type_string()},
    {"name": "customer", "datatype": dbt.type_boolean()},
    {"name": "fax_phone", "datatype": dbt.type_string()},
    {"name": "fiscal_year", "datatype": dbt.type_string()},
    {"name": "name", "datatype": dbt.type_string()},
    {"name": "notes", "datatype": dbt.type_string()},
    {"name": "phone", "datatype": dbt.type_string()},
    {"name": "state", "datatype": dbt.type_string()},
    {"name": "street", "datatype": dbt.type_string()},
    {"name": "sys_class_name", "datatype": dbt.type_string()},
    {"name": "sys_created_by", "datatype": dbt.type_string()},
    {"name": "sys_created_on", "datatype": dbt.type_string()},
    {"name": "sys_mod_count", "datatype": dbt.type_int()},
    {"name": "sys_updated_by", "datatype": dbt.type_string()},
    {"name": "sys_updated_on", "datatype": dbt.type_timestamp()},
    {"name": "vendor", "datatype": dbt.type_boolean()},
    {"name": "vendor_type", "datatype": dbt.type_string()},
    {"name": "website", "datatype": dbt.type_string()},
    {"name": "zip", "datatype": dbt.type_int()}

] %}

{{ return(columns) }}

{% endmacro %}
