
with base as (

    select * 
    from {{ ref('stg_servicenow__task_sla_base') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_servicenow__task_sla_base')),
                staging_columns=get_task_sla_columns()
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
        cast(sys_id as {{ dbt.type_string() }}) as task_sla_id,
        cast(sys_created_on as {{ dbt.type_timestamp() }}) as task_sla_created_at,
        cast(sys_updated_on as {{ dbt.type_timestamp() }}) as task_sla_updated_at,
        _fivetran_deleted,
        _fivetran_synced,
        active,
        business_duration,
        business_pause_duration,
        business_percentage,
        business_time_left,
        duration,
        end_time,
        has_breached,
        original_breach_time,
        pause_duration,
        pause_time,
        percentage,
        planned_end_time,
        schedule_link,
        cast(schedule_value as {{ dbt.type_string() }}) as schedule_value,
        sla_link,
        cast(sla_value as {{ dbt.type_string() }}) as sla_value,
        stage,
        start_time,
        sys_created_by,
        sys_mod_count,
        sys_updated_by,
        task_link,
        cast(task_value as {{ dbt.type_string() }}) as task_value,
        time_left,
        timezone
    from fields
    where not coalesce(_fivetran_deleted, false)
)

select *
from final
