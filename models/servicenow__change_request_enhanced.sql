with change_request as (
    select * 
    from {{ ref('stg_servicenow__change_request') }}
),

change_task as (
    select
        change_request_value,
        source_relation,
        count(change_task_id) as total_tasks
    from {{ ref('stg_servicenow__change_task') }}
    group by 1,2
),

sys_user as (
    select *
    from {{ ref('stg_servicenow__sys_user') }}
),

sys_choice as (
    select *
    from {{ ref('stg_servicenow__sys_choice') }}
    where sys_choice_name = 'change_request'
),

change_request_enhanced as (
    select

    -- number, -- task
    -- service, -- task
    -- configuration_item, -- na
    -- priority, -- task
    -- impact,  -- task
    -- approval,  -- task
    -- state, -- task
    -- assignment_group, -- task
    -- assigned_to,-- task
    -- short_description,-- task
    -- description, -- task

        change_request.change_request_id,
        change_request.change_request_category,
        change_request.change_request_type,
        type_choice.label as dv_change_request_type_label,
        change_request.change_request_created_at,
        change_request.change_request_created_date,
        change_request.change_request_updated_at,
        change_request.change_request_updated_date,
        change_request.change_request_start_date,
        change_request.change_requested_by_date,
        change_request.change_requested_by_link,
        change_request.change_requested_by_value,
        change_requestor.email as change_requestor_email,
        change_requestor.manager_value as change_requestor_manager_value,
        change_requestor.department_value as change_requestor_department_value,
        change_requestor.sys_user_name as change_requestor_name,
        change_requestor.sys_user_roles as change_requestor_roles,
        change_request.change_request_review_date,
        change_request.change_request_review_status,
        change_request.review_comments,
        change_request.change_request_change_plan,
        change_request.change_request_backout_plan,
        change_request.chg_model_link,
        change_request.chg_model_value,
        change_request.change_request_close_code,
        change_request.conflict_last_run,
        change_request.conflict_status,
        change_request.change_request_phase,
        change_request.change_request_phase_state,
        phase_state_choice.label as dv_change_request_phase_state_label,
        change_request.change_request_implementation_plan,
        change_request.change_request_justification,
        change_request.is_change_request_on_hold,
        change_request.change_request_on_hold_reason,
        change_request.on_hold_task,
        change_request.outside_maintenance_schedule,
        change_request.is_production_system,
        change_request.change_request_reason,
        change_request.change_request_risk,
        risk_choice.label as dv_change_request_risk_label,
        change_request.risk_impact_analysis,
        change_request.change_request_scope,
        change_request.change_request_test_plan,
        change_request.is_change_request_unauthorized,
        change_request.cab_date,
        change_request.cab_date_time,
        change_request.cab_delegate_link,
        change_request.cab_delegate_value,
        change_request.cab_recommendation,
        change_request.is_cab_required,
        change_request._fivetran_synced,
        {{ dbt.datediff("cast(change_request.change_request_created_date as " ~ dbt.type_timestamp() ~ " ) ", "cast(change_request.change_request_start_date as " ~ dbt.type_timestamp() ~ " ) ", 'day') }} as change_request_days_created_to_start,
        {{ dbt.datediff("cast(change_request.change_requested_by_date as " ~ dbt.type_timestamp() ~ " ) " , "cast(change_request.change_request_start_date as " ~ dbt.type_timestamp() ~ " ) ", 'day') }} as change_request_days_requested_by_to_start, 
        {{ dbt.datediff("cast(change_request.change_request_created_date as " ~ dbt.type_timestamp() ~ " ) ", "cast(change_request.change_request_review_date as " ~ dbt.type_timestamp() ~ " ) ", 'day') }} as change_request_days_created_to_reviewed,
        change_task.total_tasks as total_related_tasks,
        change_request.source_relation

    from change_request
    left join change_task
        on change_request.change_request_id = change_task.change_request_value
        and change_request.source_relation = change_task.source_relation
    left join sys_user change_requestor
        on change_request.change_requested_by_value = change_requestor.sys_user_id
        and change_request.source_relation = change_requestor.source_relation
    left join sys_choice type_choice
        on change_request.change_request_type = type_choice.sys_choice_value
        and type_choice.element = 'type'
        and change_request.source_relation = type_choice.source_relation
    left join sys_choice phase_state_choice
        on change_request.change_request_phase_state = phase_state_choice.sys_choice_value
        and phase_state_choice.element = 'phase_state'
        and change_request.change_request_phase = phase_state_choice.dependent_value
        and change_request.source_relation = phase_state_choice.source_relation
    left join sys_choice risk_choice
        on change_request.change_request_risk = risk_choice.sys_choice_value
        and risk_choice.element = 'risk'
        and change_request.source_relation = risk_choice.source_relation
)

select *
from change_request_enhanced