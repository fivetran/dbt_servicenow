
with base as (

    select * 
    from {{ ref('stg_servicenow__change_request_base') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_servicenow__change_request_base')),
                staging_columns=get_change_request_columns()
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
        cast(sys_id as {{ dbt.type_string() }}) as change_request_id,
        cast(sys_created_on as {{ dbt.type_timestamp() }}) as change_request_created_at,
        cast ({{ dbt.date_trunc('day', 'sys_created_on') }} as date) as change_request_created_date,
        cast(sys_updated_on as {{ dbt.type_timestamp() }}) as change_request_updated_at,
        cast ({{ dbt.date_trunc('day', 'sys_updated_on') }} as date) as change_request_updated_date,
        _fivetran_deleted,
        _fivetran_synced,
        backout_plan,
        cab_date,
        cab_date_time,
        cab_delegate_link,
        cast(cab_delegate_value as {{ dbt.type_string() }}) as cab_delegate_value,
        cab_recommendation,
        cab_required as is_cab_required,
        category as change_request_category,
        change_plan,
        chg_model_link,
        cast(chg_model_value as {{ dbt.type_string() }}) as chg_model_value,
        close_code as change_request_close_code,
        conflict_last_run,
        conflict_status,
        end_date as change_request_end_date, -- sometimes the actual change and the change request timelines don't line up, so let's specify this is pertaining to the change request.
        implementation_plan as change_request_implementation_plan,
        justification as change_request_justification,
        on_hold as is_change_request_on_hold,
        on_hold_reason as change_request_on_hold_reason,
        on_hold_task,
        outside_maintenance_schedule,
        phase as change_request_phase,
        phase_state as change_request_phase_state,
        production_system as is_production_system,
        reason as change_request_reason,
        requested_by_date as change_requested_by_date,
        requested_by_link as change_requested_by_link,
        cast(requested_by_value as {{ dbt.type_string() }}) as change_requested_by_value,
        review_comments,
        review_date as change_request_review_date,
        review_status as change_request_review_status,
        risk as change_request_risk,
        risk_impact_analysis,
        scope as change_request_scope,
        start_date as change_request_start_date,
        test_plan as change_request_test_plan,
        type as change_request_type,
        unauthorized as is_change_request_unauthorized
    from fields
    where not _fivetran_deleted
)

select *
from final
