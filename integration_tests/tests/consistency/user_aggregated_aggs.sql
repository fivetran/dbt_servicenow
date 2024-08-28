{{ config(
    tags="fivetran_validations",
    enabled=var('fivetran_validation_tests_enabled', false)
) }}

with prod as (
    select
        sys_user_id,
        source_relation,
        count_distinct_sys_user_group_ids,
        count_distinct_sys_user_role_ids,
        count_distinct_sys_user_role_names,
        count_distinct_included_roles,
        count_distinct_sys_user_group_roles
    from {{ target.schema }}_servicenow_prod.servicenow__user_aggregated
    group by 1,2
),

dev as (
    select
        sys_user_id,
        source_relation,
        count_distinct_sys_user_group_ids,
        count_distinct_sys_user_role_ids,
        count_distinct_sys_user_role_names,
        count_distinct_included_roles,
        count_distinct_sys_user_group_roles

    from {{ target.schema }}_servicenow_dev.servicenow__user_aggregated
    group by 1,2
),

final as (
    select
        prod.sys_user_id,
        dev.sys_user_id,
        prod.source_relation,
        dev.source_relation,
        prod.count_distinct_sys_user_group_ids,
        dev.count_distinct_sys_user_group_ids,
        prod.count_distinct_sys_user_role_ids,
        dev.count_distinct_sys_user_role_ids,
        prod.count_distinct_sys_user_role_names,
        dev.count_distinct_sys_user_role_names,
        prod.count_distinct_included_roles,
        dev.count_distinct_included_roles,
        prod.count_distinct_sys_user_group_roles,
        dev.count_distinct_sys_user_group_roles

    from prod
    full outer join dev
        on prod.sys_user_id = dev.sys_user_id
        and prod.source_relation = dev.source_relation
)

select * 
from final
where
    abs(count_distinct_sys_user_group_ids - count_distinct_sys_user_group_ids) > .1 or
    abs(count_distinct_sys_user_role_ids - count_distinct_sys_user_role_ids) > .1 or
    abs(count_distinct_sys_user_role_names - count_distinct_sys_user_role_names) > .1 or
    abs(count_distinct_included_roles - count_distinct_included_roles) > .1 or
    abs(count_distinct_sys_user_group_roles - count_distinct_sys_user_group_roles) > .1