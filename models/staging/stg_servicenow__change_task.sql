
with base as (

    select * 
    from {{ ref('stg_servicenow__change_task_base') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_servicenow__change_task_base')),
                staging_columns=get_change_task_columns()
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
        cast(sys_id as {{ dbt.type_string() }}) as change_task_id,
        cast(sys_created_on as {{ dbt.type_timestamp() }}) as change_task_created_at,
        cast(sys_updated_on as {{ dbt.type_timestamp() }}) as change_task_updated_at,
        _fivetran_deleted,
        _fivetran_synced,
        change_request_link,
        cast(change_request_value as {{ dbt.type_string() }}) as change_request_value,
        change_task_type,
        close_code as change_task_close_code,
        created_from as change_task_created_from,
        on_hold as is_change_on_hold,
        on_hold_reason as change_on_hold_reason,
        planned_end_date as change_task_planned_end_date,
        planned_start_date as change_task_planned_start_date
    from fields
    where not _fivetran_deleted
)

select *
from final
