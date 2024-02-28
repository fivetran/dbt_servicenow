with incident as (

    select *
    from {{ ref('stg_servicenow__incident') }}
),

sys_user as (
    
    select *
    from {{ ref('stg_servicenow__sys_user') }}
),

incident_enhanced as (
    select
        incident.incident_id,
        incident.incident_category,
        incident.incident_subcategory,
        incident.incident_severity,
        incident.incident_state,
        incident.incident_created_at,
        incident.incident_updated_at,
        incident.reopened_by_link,
        incident.reopened_by_value,
        reopener.email as reopener_email,
        reopener.manager_value as reopener_manager_value,
        reopener.department_value as reopener_department_value,
        reopener.sys_user_name as reopener_name,
        reopener.roles as reopener_roles,
        incident.incident_reopened_time,
        incident.incident_resolved_at,
        incident.resolved_by_link,
        incident.resolved_by_value,
        resolver.email as resolver_email,
        resolver.manager_value as resolver_manager_value,
        resolver.department_value as resolver_department_value,
        resolver.sys_user_name as resolver_name,
        resolver.roles as resolver_roles,
        incident.business_impact,
        incident.business_stc,
        incident.calendar_stc,
        incident.caller_id_link,
        incident.caller_id_value,
        incident.incident_cause,
        incident.caused_by_link,
        incident.caused_by_value,
        incident.child_incidents,
        incident.close_code,
        incident.hold_reason,
        incident.notify,
        incident.origin_id_link,
        incident.origin_id_value,
        incident.parent_incident_link,
        incident.parent_incident_value,
        incident.problem_id_link,
        incident.problem_id_value,
        incident.reopen_count,
        incident.rfc_link,
        incident.rfc_value,
        {{ dbt.datediff("incident_created_at","incident_resolved_at", 'minute') }} as incident_minutes_created_to_resolved,
        incident._fivetran_synced,
        incident.source_relation
    from incident
    left join sys_user reopener
        on incident.reopened_by_value = reopener.user_id
        and incident.source_relation = reopener.source_relation
    left join sys_user resolver
        on incident.resolved_by_value = resolver.user_id
        and incident.source_relation = resolver.source_relation
    where not incident._fivetran_deleted
)

select *
from incident_enhanced