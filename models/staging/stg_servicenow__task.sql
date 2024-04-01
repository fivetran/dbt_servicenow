
with base as (

    select * 
    from {{ ref('stg_servicenow__task_base') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_servicenow__task_base')),
                staging_columns=get_task_columns()
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
        cast(sys_id as {{ dbt.type_string() }}) as task_id,
        cast(sys_created_on as {{ dbt.type_timestamp() }}) as task_created_at,
        cast(sys_updated_on as {{ dbt.type_timestamp() }}) as task_updated_at,
        _fivetran_deleted,
        _fivetran_synced,
        cast(active as {{ dbt.type_boolean() }}) as is_task_active,
        activity_due,
        additional_assignee_list,
        approval,
        approval_history,
        approval_set,
        assigned_to_link,
        cast(assigned_to_value as {{ dbt.type_string() }}) as assigned_to_value,
        assignment_group_link,
        cast(assignment_group_value as {{ dbt.type_string() }}) as assignment_group_value,
        business_duration,
        business_service_link,
        cast(business_service_value as {{ dbt.type_string() }}) as business_service_value,
        calendar_duration,
        close_notes,
        closed_at as task_closed_at,
        closed_by_link,
        cast(closed_by_value as {{ dbt.type_string() }}) as closed_by_value,
        cmdb_ci_link,
        cast(cmdb_ci_value as {{ dbt.type_string() }}) as cmdb_ci_value,
        comments,
        comments_and_work_notes,
        company_link,
        cast(company_value as {{ dbt.type_string() }}) as company_value,
        contact_type,
        contract_link,
        cast(contract_value as {{ dbt.type_string() }}) as contract_value,
        correlation_display,
        correlation_id,
        delivery_plan_link,
        cast(delivery_plan_value as {{ dbt.type_string() }}) as delivery_plan_value,
        delivery_task_link,
        cast(delivery_task_value as {{ dbt.type_string() }}) as delivery_task_value,
        description as task_description,
        cast ({{ dbt.date_trunc('day', 'due_date') }} as date)  as task_due_date_at,
        escalation,
        expected_start,
        follow_up as task_follow_up_at,
        group_list,
        impact,
        knowledge,
        location_link,
        cast(location_value as {{ dbt.type_string() }}) as location_value,
        cast(made_sla as {{ dbt.type_boolean() }}) as is_made_sla,
        number as task_number,
        opened_at as task_opened_at,
        opened_by_link,
        cast(opened_by_value as {{ dbt.type_string() }}) as opened_by_value,
        task_order, -- Renamed within the get_task_columns() macro.
        parent_link,
        cast(parent_value as {{ dbt.type_string() }}) as parent_value,
        priority,
        reassignment_count,
        rejection_goto_link,
        cast(rejection_goto_value as {{ dbt.type_string() }}) as rejection_goto_value,
        route_reason,
        service_offering_link,
        cast(service_offering_value as {{ dbt.type_string() }}) as service_offering_value,
        short_description,
        sla_due,
        state as task_state,
        sys_class_name,
        sys_created_by,
        sys_domain_link,
        sys_domain_path,
        cast(sys_domain_value as {{ dbt.type_string() }}) as sys_domain_value,
        sys_mod_count,
        sys_updated_by,
        task_effective_number,
        universal_request_link,
        cast(universal_request_value as {{ dbt.type_string() }}) as universal_request_value,
        upon_approval,
        upon_reject,
        urgency,
        watch_list,
        wf_activity_link,
        cast(wf_activity_value as {{ dbt.type_string() }}) as wf_activity_value,
        work_end,
        work_notes,
        work_notes_list,
        work_start
    from fields
    where not _fivetran_deleted
)

select *
from final
