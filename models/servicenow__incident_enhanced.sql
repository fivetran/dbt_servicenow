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
        reopener.sys_user_roles as reopener_roles,
        incident.incident_reopened_time,
        incident.incident_resolved_at,
        incident.resolved_by_link,
        incident.resolved_by_value,
        resolver.email as resolver_email,
        resolver.manager_value as resolver_manager_value,
        resolver.department_value as resolver_department_value,
        resolver.sys_user_name as resolver_name,
        resolver.sys_user_roles as resolver_roles,
        incident.business_impact,
        incident.business_stc,
        incident.calendar_stc,
        incident.caller_id_link,
        incident.caller_id_value,
        caller_info.email as caller_email,
        caller_info.manager_value as caller_manager_value,
        caller_info.department_value as caller_department_value,
        caller_info.sys_user_name as caller_name,
        caller_info.sys_user_roles as caller_roles,
        incident.incident_cause,
        incident.caused_by_link,
        incident.caused_by_value,
        coalesce(incident.child_incidents,0) as child_incidents,
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
        {{ dbt.datediff("cast(incident_created_at as " ~ dbt.type_timestamp() ~ " ) ", "cast(incident_resolved_at as " ~ dbt.type_timestamp() ~ " ) ", 'minute') }} as incident_minutes_created_to_resolved,
        incident._fivetran_synced,
        incident.source_relation
    from incident
    left join sys_user reopener
        on incident.reopened_by_value = reopener.sys_user_id
        and incident.source_relation = reopener.source_relation
    left join sys_user resolver
        on incident.resolved_by_value = resolver.sys_user_id
        and incident.source_relation = resolver.source_relation
    left join sys_user caller_info
        on incident.caller_id_value = caller_info.sys_user_id
        and incident.source_relation = caller_info.source_relation
)

select *
from incident_enhanced