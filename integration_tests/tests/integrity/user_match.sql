
{{ config(
    tags="fivetran_validations",
    enabled=var('fivetran_validation_tests_enabled', false)
) }}

with source as (
    select
        1 as join_key,
        count(*) as row_count
    from {{ ref('stg_servicenow__sys_user') }}
),

user_enhanced as (
    select
        1 as join_key,
        count(*) as row_count
    from {{ ref('servicenow__user_enhanced') }}
),

match_check as (
    select 
        source.row_count as source_row_count,
        user_enhanced.row_count as end_model_row_count
    from source
    full outer join user_enhanced
        on source.join_key = user_enhanced.join_key
)

select *
from match_check
where end_model_row_count != source_row_count