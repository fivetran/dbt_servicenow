
{{ config(
    tags="fivetran_validations",
    enabled=var('fivetran_validation_tests_enabled', false)
) }}

-- The necessary source and source_filter adjustments used below originate from the int_zendesk__sla_policy_applied model
with source as (
    select
        1 as join_key,
        count(*) as row_count
    from {{ ref('stg_servicenow__task') }}
),

task as (
    select
        1 as join_key,
        count(*) as row_count
    from {{ ref('servicenow__task_enhanced') }}
),

match_check as (
    select 
        source.row_count as source_row_count,
        task.row_count as end_model_row_count
    from source
    full outer join task
        on source.join_key = task.join_key
)

select *
from match_check
where end_model_row_count != source_row_count