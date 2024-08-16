with incident as (
    select *
    from {{ ref('stg_servicenow__incident') }}
),

sys_user as (
    select *
    from {{ ref('stg_servicenow__sys_user') }}
),

sys_choice as (
    select *
    from {{ ref('stg_servicenow__sys_choice') }}
),

incident_enhanced as (
    select
        incident.incident_id,
        incident.incident_category,
        category_choice.label as incident_category_label,
        incident.incident_subcategory,
        subcategory_choice.label as incident_subcategory_label,
        incident.incident_severity,
        severity_choice.label as incident_severity_label,
        incident.incident_state,
        state_choice.label as incident_state_label,
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
        business_impact_choice.label as business_impact_label,
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
    left join sys_choice category_choice
        on incident.incident_category = category_choice.sys_choice_value
        and category_choice.sys_choice_name = 'incident'
        and category_choice.element = 'category'
        and incident.source_relation = category_choice.source_relation
    left join sys_choice subcategory_choice
        on incident.incident_subcategory = subcategory_choice.sys_choice_value
        and subcategory_choice.sys_choice_name = 'incident'
        and subcategory_choice.element = 'subcategory'
        and incident.source_relation = subcategory_choice.source_relation
    left join sys_choice state_choice
        on incident.incident_state = state_choice.sys_choice_value
        and state_choice.sys_choice_name = 'incident'
        and state_choice.element = 'state'
        and incident.source_relation = state_choice.source_relation
    left join sys_choice business_impact_choice
        on incident.business_impact = business_impact_choice.sys_choice_value
        and business_impact_choice.sys_choice_name = 'incident'
        and business_impact_choice.element = 'business_impact'
        and incident.source_relation = business_impact_choice.source_relation
    left join sys_choice severity_choice
        on incident.incident_severity = severity_choice.sys_choice_value
        and severity_choice.sys_choice_name = 'incident'
        and severity_choice.element = 'severity'
        and incident.source_relation = severity_choice.source_relation
)

select *
from incident_enhanced