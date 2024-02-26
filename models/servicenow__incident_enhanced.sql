with incident as (

    select *
    from {{ ref('stg_servicenow__incident') }}
),

incident_enhanced as (
    select
        incident_id,
        category,
        subcategory,
        severity,
        incident_state,
        incident_created_at,
        incident_updated_at,
        reopened_by_link,
        reopened_by_value,
        reopened_time,
        resolved_at,
        resolved_by_link,
        resolved_by_value,
        business_impact,
        business_stc,
        calendar_stc,
        caller_id_link,
        caller_id_value,
        cause,
        caused_by_link,
        caused_by_value,
        child_incidents,
        close_code,
        hold_reason,
        notify,
        origin_id_link,
        origin_id_value,
        parent_incident_link,
        parent_incident_value,
        problem_id_link,
        problem_id_value,
        reopen_count,
        rfc_link,
        rfc_value,
        {{ dbt.datediff("incident_created_at","resolved_at", 'minute') }} as incident_created_to_resolved,
        _fivetran_synced,
        source_relation
    from incident
    where not _fivetran_deleted
)

select *
from incident_enhanced