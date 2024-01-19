
with base as (

    select * 
    from {{ ref('stg_servicenow__core_company_base') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_servicenow__core_company_base')),
                staging_columns=get_core_company_columns()
            )
        }}

    from base
),

final as (
    
    select 
        cast(sys_id as {{ dbt.type_string() }}) as core_company_id,
        city as company_city,
        country as company_country,
        customer as is_customer,
        fax_phone as company_fax_phone,
        fiscal_year,
        name as company_name,
        notes,
        phone as company_phone,
        state as company_state,
        street as company_street,
        sys_class_name,
        sys_created_by,
        sys_created_on,
        sys_mod_count,
        sys_updated_by,
        sys_updated_on,
        vendor as is_vendor,
        vendor_type,
        website as company_website,
        zip as company_zip
    from fields
)

select *
from final
