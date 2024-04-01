
with base as (

    select * 
    from {{ ref('stg_servicenow__problem_task_base') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_servicenow__problem_task_base')),
                staging_columns=get_problem_task_columns()
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
        cast(sys_id as {{ dbt.type_string() }}) as problem_task_id,
        cast(sys_created_on as {{ dbt.type_timestamp() }}) as problem_task_created_at,
        cast(sys_updated_on as {{ dbt.type_timestamp() }}) as problem_task_updated_at,
        _fivetran_deleted,
        _fivetran_synced,
        cause_code as problem_task_cause_code,
        close_code as problem_task_close_code,
        other_reason,
        problem_link,
        problem_task_type,
        cast(problem_value as {{ dbt.type_string() }}) as problem_value,
        reopen_count,
        reopened_at,
        reopened_by_link,
        cast(reopened_by_value as {{ dbt.type_string() }}) as reopened_by_value,
        started_at as problem_task_started_at,
        started_by_link,
        cast(started_by_value as {{ dbt.type_string() }}) as started_by_value,
        vendor_link,
        cast(vendor_value as {{ dbt.type_string() }}) as vendor_value 
    from fields
)

select *
from final
where not _fivetran_deleted
