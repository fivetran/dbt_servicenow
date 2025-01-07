{{ config(
    tags="fivetran_validations",
    enabled=(var('fivetran_validation_tests_enabled', false) and var('servicenow__using_roles', true))
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
),

final as (
    select
        prod.sys_user_id as prod_sys_user_id,
        dev.sys_user_id as dev_sys_user_id,
        prod.source_relation as prod_source_relation,
        dev.source_relation as dev_source_relation,
        prod.count_distinct_sys_user_group_ids as prod_count_distinct_sys_user_group_ids,
        dev.count_distinct_sys_user_group_ids as dev_count_distinct_sys_user_group_ids,
        prod.count_distinct_sys_user_role_ids as prod_count_distinct_sys_user_role_ids,
        dev.count_distinct_sys_user_role_ids as dev_count_distinct_sys_user_role_ids,
        prod.count_distinct_sys_user_role_names as prod_count_distinct_sys_user_role_names,
        dev.count_distinct_sys_user_role_names as dev_count_distinct_sys_user_role_names,
        prod.count_distinct_included_roles as prod_count_distinct_included_roles,
        dev.count_distinct_included_roles as dev_count_distinct_included_roles,
        prod.count_distinct_sys_user_group_roles as prod_count_distinct_sys_user_group_roles,
        dev.count_distinct_sys_user_group_roles as dev_count_distinct_sys_user_group_roles

    from prod
    full outer join dev
        on prod.sys_user_id = dev.sys_user_id
        and prod.source_relation = dev.source_relation
)

select * 
from final
where
    abs(prod_count_distinct_sys_user_group_ids - dev_count_distinct_sys_user_group_ids) > .1 or
    abs(prod_count_distinct_sys_user_role_ids - dev_count_distinct_sys_user_role_ids) > .1 or
    abs(prod_count_distinct_sys_user_role_names - dev_count_distinct_sys_user_role_names) > .1 or
    abs(prod_count_distinct_included_roles - dev_count_distinct_included_roles) > .1 or
    abs(prod_count_distinct_sys_user_group_roles - dev_count_distinct_sys_user_group_roles) > .1