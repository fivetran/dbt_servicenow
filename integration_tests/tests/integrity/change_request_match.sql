
{{ config(
    tags="fivetran_validations",
    enabled=var('fivetran_validation_tests_enabled', false)
) }}

with source as (
    select
        change_request_id as join_key,
        count(*) as row_count
    from {{ ref('stg_servicenow__change_request') }}
    group by 1
),

change_request as (
    select
        change_request_id as join_key,
        count(*) as row_count
    from {{ ref('servicenow__change_request_enhanced') }}
    group by 1
),

match_check as (
    select 
        source.row_count as source_row_count,
        change_request.row_count as end_model_row_count
    from source
    full outer join change_request
        on source.join_key = change_request.join_key
)

select *
from match_check
where end_model_row_count != source_row_count