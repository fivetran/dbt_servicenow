
with base as (

    select * 
    from {{ ref('stg_servicenow__cmdb_ci_base') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_servicenow__cmdb_ci_base')),
                staging_columns=get_cmdb_ci_columns()
            )
        }}
        {{ fivetran_utils.source_relation(
            union_schema_variable='servicenow_union_schemas', 
            union_database_variable='servicenow_union_databases') 
        }}
    from base
),

final as (
    
    select 
        source_relation, 
        cast(sys_id as {{ dbt.type_string() }}) as cmdb_ci_id,
        cast(sys_created_on as {{ dbt.type_timestamp() }}) as cmdb_ci_created_at,
        cast(sys_updated_on as {{ dbt.type_timestamp() }}) as cmdb_ci_updated_at,
        _fivetran_deleted,
        _fivetran_synced,
        attributes,
        business_unit_link,
        cast(business_unit_value as {{ dbt.type_string() }}) as business_unit_value,
        category,
        company_link,
        cast(company_value as {{ dbt.type_string() }}) as company_value,
        cost,
        cost_cc,
        cost_center_link,
        cast(cost_center_value as {{ dbt.type_string() }}) as cost_center_value,
        managed_by_link,
        cast(managed_by_value as {{ dbt.type_string() }}) as managed_by_value,
        manufacturer_link,
        cast(manufacturer_value as {{ dbt.type_string() }}) as manufacturer_value,
        model_id_link,
        cast(model_id_value as {{ dbt.type_string() }}) as model_id_value,
        model_number,
        name as cmdb_ci_name,
        owned_by_link,
        cast(owned_by_value as {{ dbt.type_string() }}) as owned_by_value,
        subcategory,
        sys_class_name,
        sys_class_path,
        sys_created_by,
        sys_domain_link,
        sys_domain_path,
        cast(sys_domain_value as {{ dbt.type_string() }}) as sys_domain_value,
        sys_mod_count,
        sys_updated_by,
        unverified,
        vendor_link,
        cast(vendor_value as {{ dbt.type_string() }}) as vendor_value
    from fields
)

select *
from final
where not _fivetran_deleted
