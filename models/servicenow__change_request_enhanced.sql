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

change_request_enhanced as (
    select
        change_request.change_request_id,
        change_request.change_request_category,
        change_request.change_request_type,
        change_request.change_request_created_at,
        change_request.change_request_created_date,
        change_request.change_request_updated_at,
        change_request.change_request_updated_date,
        change_request.change_request_start_date,
        change_request.change_requested_by_date,
        change_request.change_requested_by_link,
        change_request.change_requested_by_value,
        change_request.change_request_review_date,
        change_request.change_request_review_status,
        change_request.review_comments,
        change_request.change_plan,
        change_request.backout_plan,
        change_request.chg_model_link,
        change_request.chg_model_value,
        change_request.change_request_close_code,
        change_request.conflict_last_run,
        change_request.conflict_status,
        change_request.change_request_phase,
        change_request.change_request_phase_state,
        change_request.change_request_implementation_plan,
        change_request.change_request_justification,
        change_request.is_change_request_on_hold,
        change_request.change_request_on_hold_reason,
        change_request.on_hold_task,
        change_request.outside_maintenance_schedule,
        change_request.is_production_system,
        change_request.change_request_reason,
        change_request.change_request_risk,
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
        {{ dbt.datediff("change_request.change_request_created_date","change_request.change_request_review_date", 'day') }} as change_request_days_created_to_reviewed,
        {{ dbt.datediff("change_request.change_request_created_date","change_request.change_request_start_date", 'day') }} as change_request_days_created_to_start,
        {{ dbt.datediff("change_request.change_requested_by_date","change_request.change_request_start_date", 'minute') }} as change_request_minutes_requested_by_to_start,
        change_task.total_tasks as total_related_tasks,
        change_request.source_relation

    from change_request
    left join change_task
        on change_request.change_request_id = change_task.change_request_value
        and change_request.source_relation = change_task.source_relation
    where not _fivetran_deleted
)

select *
from change_request_enhanced

