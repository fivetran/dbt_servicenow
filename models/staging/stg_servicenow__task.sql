
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
        active as is_task_active,
        activity_due,
        additional_assignee_list,
        approval,
        approval_history,
        approval_set,
        assigned_to_link,
        assigned_to_value,
        assignment_group_link,
        assignment_group_value,
        business_duration,
        business_service_link,
        business_service_value,
        calendar_duration,
        close_notes,
        closed_at as task_closed_at,
        closed_by_link,
        closed_by_value,
        cmdb_ci_link,
        cmdb_ci_value,
        comments,
        comments_and_work_notes,
        company_link,
        company_value,
        contact_type,
        contract_link,
        contract_value,
        correlation_display,
        correlation_id,
        delivery_plan_link,
        delivery_plan_value,
        delivery_task_link,
        delivery_task_value,
        description as task_description,
        due_date as task_due_date_at,
        escalation,
        expected_start,
        follow_up as task_follow_up_at,
        group_list,
        impact,
        knowledge,
        location_link,
        location_value,
        made_sla,
        number as task_number,
        opened_at as task_opened_at,
        opened_by_link,
        opened_by_value,
        task_order, -- Renamed within the get_task_columns() macro.
        parent_link,
        parent_value,
        priority,
        reassignment_count,
        rejection_goto_link,
        rejection_goto_value,
        route_reason,
        service_offering_link,
        service_offering_value,
        short_description,
        sla_due,
        state as task_state,
        sys_class_name,
        sys_created_by,
        sys_domain_link,
        sys_domain_path,
        sys_domain_value,
        sys_mod_count,
        sys_updated_by,
        task_effective_number,
        universal_request_link,
        universal_request_value,
        upon_approval,
        upon_reject,
        urgency,
        watch_list,
        wf_activity_link,
        wf_activity_value,
        work_end,
        work_notes,
        work_notes_list,
        work_start
    from fields
)

select *
from final
