
{{ config(
    tags="fivetran_validations",
    enabled=(var('fivetran_validation_tests_enabled', false) and var('servicenow__using_roles', true))
) }}

with source as (
    select
        sys_user_id as join_key,
        count(*) as row_count
    from {{ ref('stg_servicenow__sys_user') }}
    group by 1
),

user_enhanced as (
    select
        sys_user_id as join_key,
        count(*) as row_count
    from {{ ref('servicenow__user_enhanced') }}
    group by 1
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