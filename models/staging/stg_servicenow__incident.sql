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
        cast(business_impact as {{ dbt.type_string() }}) as business_impact,
        business_stc,
        calendar_stc,
        caller_id_link,
        cast(caller_id_value as {{ dbt.type_string() }}) as caller_id_value,
        cast(category as {{ dbt.type_string() }}) as incident_category,
        cast(cause as {{ dbt.type_string() }}) as incident_cause,
        caused_by_link,
        cast(caused_by_value as {{ dbt.type_string() }}) as caused_by_value,
        child_incidents,
        close_code,
        hold_reason,
        cast(incident_state as {{ dbt.type_string() }}) as incident_state,
        notify,
        origin_id_link,
        cast(origin_id_value as {{ dbt.type_string() }}) as origin_id_value,
        parent_incident_link,
        cast(parent_incident_value as {{ dbt.type_string() }}) as parent_incident_value,
        problem_id_link,
        cast(problem_id_value as {{ dbt.type_string() }}) as problem_id_value,
        reopen_count,
        reopened_by_link,
        cast(reopened_by_value as {{ dbt.type_string() }}) as reopened_by_value,
        reopened_time as incident_reopened_time,
        cast(resolved_at as {{ dbt.type_timestamp() }}) as incident_resolved_at,
        resolved_by_link,
        cast(resolved_by_value as {{ dbt.type_string() }}) as resolved_by_value,
        rfc_link,
        cast(rfc_value as {{ dbt.type_string() }}) as rfc_value,
        cast(severity as {{ dbt.type_string() }}) as incident_severity,
        cast(subcategory as {{ dbt.type_string() }}) as incident_subcategory
    from fields
    where not coalesce(_fivetran_deleted, false)
)

select *
from final