{{ config(
    tags="fivetran_validations",
    enabled=var('fivetran_validation_tests_enabled', false)
) }}

with prod as (
    select
        1 as join_key,
        source_relation,
        count(*) as row_count
    from {{ target.schema }}_servicenow_prod.servicenow__task_enhanced
    group by 1,2
),

dev as (
    select
        1 as join_key,
        source_relation,
        count(*) as row_count

    from {{ target.schema }}_servicenow_dev.servicenow__task_enhanced
    group by 1,2
),

final as (
    select 
        prod.row_count as prod_row_count,
        dev.row_count as dev_row_count

    from prod
    full outer join dev
        on prod.join_key = dev.join_key
        and prod.source_relation = dev.source_relation
)

select * 
from final
where prod_row_count != dev_row_count