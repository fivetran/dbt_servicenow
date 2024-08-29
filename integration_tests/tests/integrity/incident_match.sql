
{{ config(
    tags="fivetran_validations",
    enabled=var('fivetran_validation_tests_enabled', false)
) }}

with source as (
    select
        incident_id as join_key,
        count(*) as row_count
    from {{ ref('stg_servicenow__incident') }}
    group by 1
),

incident as (
    select
        incident_id as join_key,
        count(*) as row_count
    from {{ ref('servicenow__incident_enhanced') }}
    group by 1
),

match_check as (
    select 
        source.row_count as source_row_count,
        incident.row_count as end_model_row_count
    from source
    full outer join incident
        on source.join_key = incident.join_key
)

select *
from match_check
where end_model_row_count != source_row_count