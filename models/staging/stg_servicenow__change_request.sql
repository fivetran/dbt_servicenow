
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
        cast(sys_id as {{ dbt.type_string() }}) as change_id,
        cast(sys_created_on as {{ dbt.type_timestamp() }}) as change_created_at,
        cast(sys_updated_on as {{ dbt.type_timestamp() }}) as change_updated_at,
        _fivetran_deleted,
        _fivetran_synced,
        backout_plan,
        cab_date,
        cab_date_time,
        cab_delegate_link,
        cab_delegate_value,
        cab_recommendation,
        cab_required as is_cab_required,
        category as change_category,
        change_plan,
        chg_model_link,
        chg_model_value,
        close_code as change_close_code,
        conflict_last_run,
        conflict_status,
        end_date as change_end_date,
        implementation_plan as change_implementation_plan,
        justification as change_justification,
        on_hold as is_change_on_hold,
        on_hold_reason as change_on_hold_reason,
        on_hold_task,
        outside_maintenance_schedule,
        phase as change_phase,
        phase_state as change_phase_state,
        production_system as is_production_system,
        reason as change_reason,
        requested_by_date as change_requested_by_date,
        requested_by_link as change_requested_by_link,
        requested_by_value as change_requested_by_value,
        review_comments,
        review_date as change_review_date,
        review_status as change_review_status,
        risk as change_risk,
        risk_impact_analysis,
        scope as change_scope,
        start_date as change_start_date,
        std_change_producer_version_link,
        std_change_producer_version_value,
        test_plan as change_test_plan,
        type as change_type,
        unauthorized as is_change_unauthorized
    from fields
)

select *
from final
