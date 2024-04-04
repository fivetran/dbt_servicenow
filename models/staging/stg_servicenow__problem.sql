
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
        cast(confirmed_at as {{ dbt.type_timestamp() }}) as problem_confirmed_at,
        confirmed_by_link as problem_confirmed_by_link,
        cast(confirmed_by_value as {{ dbt.type_string() }}) as problem_confirmed_by_value,
        duplicate_of_link,
        cast(duplicate_of_value as {{ dbt.type_string() }}) as duplicate_of_value,
        first_reported_by_task_link as problem_first_reported_by_task_link,
        first_reported_by_task_value as problem_first_reported_by_task_value,
        cast(fix_at as {{ dbt.type_timestamp() }}) as problem_fix_at,
        fix_by_link as problem_fix_by_link,
        cast(fix_by_value as {{ dbt.type_string() }}) as problem_fix_by_value,
        cast(fix_communicated_at as {{ dbt.type_timestamp() }}) as fix_communicated_at,
        fix_communicated_by_link,
        cast(fix_communicated_by_value as {{ dbt.type_string() }}) as fix_communicated_by_value,
        fix_notes as problem_fix_notes,
        known_error as is_known_error,
        major_problem as is_major_problem,
        problem_state,
        related_incidents as problem_related_incidents,
        reopen_count,
        cast(reopened_at as {{ dbt.type_timestamp() }}) as reopened_at,
        reopened_by_link,
        cast(reopened_by_value as {{ dbt.type_string() }}) as reopened_by_value,
        resolution_code as problem_resolution_code,
        cast(resolved_at as {{ dbt.type_timestamp() }}) as problem_resolved_at,
        resolved_by_link,
        cast(resolved_by_value as {{ dbt.type_string() }}) as problem_resolved_by_value,
        review_outcome,
        rfc_link,
        cast(rfc_value as {{ dbt.type_string() }}) as rfc_value,
        subcategory as problem_subcategory,
        workaround,
        workaround_applied,
        cast(workaround_communicated_at as {{ dbt.type_timestamp() }}) as workaround_communicated_at,
        workaround_communicated_by_link,
        cast(workaround_communicated_by_value as {{ dbt.type_string() }}) as workaround_communicated_by_value 
    from fields
    where not coalesce(_fivetran_deleted, false)
)

select *
from final
