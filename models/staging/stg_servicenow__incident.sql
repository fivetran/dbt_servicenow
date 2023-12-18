
with base as (

    select * 
    from {{ ref('stg_servicenow__incident_base') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_servicenow__incident_base')),
                staging_columns=get_incident_columns()
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
        cast(sys_id as {{ dbt.type_string() }}) as incident_id,
        cast(sys_created_on as {{ dbt.type_timestamp() }}) as incident_created_at,
        cast(sys_updated_on as {{ dbt.type_timestamp() }}) as incident_updated_at,
        _fivetran_deleted,
        _fivetran_synced,
        business_impact,
        business_stc,
        calendar_stc,
        caller_id_link,
        caller_id_value,
        category,
        cause,
        caused_by_link,
        caused_by_value,
        child_incidents,
        close_code,
        hold_reason,
        incident_state,
        notify,
        origin_id_link,
        origin_id_value,
        parent_incident_link,
        parent_incident_value,
        problem_id_link,
        problem_id_value,
        reopen_count,
        reopened_by_link,
        reopened_by_value,
        reopened_time,
        resolved_at,
        resolved_by_link,
        resolved_by_value,
        rfc_link,
        rfc_value,
        severity,
        subcategory
    from fields
)

select *
from final
