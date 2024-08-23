with base as (

    select * 
    from {{ ref('stg_servicenow__sys_choice_base') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_servicenow__sys_choice_base')),
                staging_columns=get_sys_choice_columns()
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
        cast(sys_id as {{ dbt.type_string() }}) as sys_choice_id,
        cast(sys_created_on as {{ dbt.type_timestamp() }}) as sys_choice_created_at,
        sys_created_by,
        cast(sys_updated_on as {{ dbt.type_timestamp() }}) as sys_choice_updated_at,
        sys_updated_by,
        _fivetran_deleted,
        _fivetran_synced,
        dependent_value,
        element,
        hint,
        inactive,
        label,
        language,
        name as sys_choice_name,
        sequence,
        synonyms,
        sys_domain_link,
        sys_domain_path,
        cast(sys_domain_value as {{ dbt.type_string() }}) as sys_domain_value,
        sys_mod_count,
        value as sys_choice_value
    from fields
    where not coalesce(_fivetran_deleted, false)
)

select *
from final
