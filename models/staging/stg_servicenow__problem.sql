
with base as (

    select * 
    from {{ ref('stg_servicenow__problem_base') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_servicenow__problem_base')),
                staging_columns=get_problem_columns()
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
        cast(sys_id as {{ dbt.type_string() }}) as problem_id,
        cast(sys_created_on as {{ dbt.type_timestamp() }}) as problem_created_at,
        cast(sys_updated_on as {{ dbt.type_timestamp() }}) as problem_updated_at,
        _fivetran_deleted,
        _fivetran_synced,
        category as problem_category,
        cause_notes,
        confirmed_at as problem_confirmed_at,
        confirmed_by_link as problem_confirmed_by_link,
        confirmed_by_value as problem_confirmed_by_value,
        duplicate_of_link,
        duplicate_of_value,
        first_reported_by_task_link as problem_first_reported_by_task_link,
        first_reported_by_task_value as problem_first_reported_by_task_value,
        fix_at as problem_fix_at,
        fix_by_link as problem_fix_by_link,
        fix_by_value as problem_fix_by_value,
        fix_communicated_at,
        fix_communicated_by_link,
        fix_communicated_by_value,
        fix_notes as problem_fix_notes,
        known_error as is_known_error,
        major_problem as is_major_problem,
        problem_state,
        related_incidents as problem_related_incidents,
        reopen_count,
        reopened_at,
        reopened_by_link,
        reopened_by_value,
        resolution_code as problem_resolution_code,
        resolved_at as problem_resolved_at,
        resolved_by_link,
        resolved_by_value as problem_resolved_by_value,
        review_outcome,
        rfc_link,
        rfc_value,
        subcategory as problem_subcategory,
        workaround,
        workaround_applied,
        workaround_communicated_at,
        workaround_communicated_by_link,
        workaround_communicated_by_value
    from fields
)

select *
from final
