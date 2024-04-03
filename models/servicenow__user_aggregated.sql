{{ config(enabled=var('servicenow__using_roles', False)) }}

with sys_user as (
    
    select *
    from {{ ref('stg_servicenow__sys_user') }}
),

user_grmember as (

    select * 
    from {{ ref('stg_servicenow__sys_user_grmember') }}
),

user_has_role as (

    select * 
    from {{ ref('stg_servicenow__sys_user_has_role') }}
),

user_role as (

    select * 
    from {{ ref('stg_servicenow__sys_user_role') }}
),

user_group as (

    select * 
    from {{ ref('stg_servicenow__sys_user_group')}}
),

aggregate_counts as (

    select 
        sys_user.sys_user_id,
        sys_user.source_relation,
        count(distinct user_grmember.sys_user_group_id) as count_distinct_sys_user_group_ids,
        count(distinct user_has_role.sys_user_role_id) as count_distinct_sys_user_role_ids,
        count(distinct user_role.sys_user_role_name) as count_distinct_sys_user_role_names,
        count(distinct user_role.includes_roles) as count_distinct_included_roles,
        count(distinct user_group.sys_user_group_roles) as count_distinct_sys_user_group_roles

    from sys_user
    left join user_grmember
        on sys_user.sys_user_id = user_grmember.sys_user_id
        and sys_user.source_relation = user_grmember.source_relation
    left join user_group
        on user_grmember.sys_user_group_id = user_group.sys_user_group_id
        and user_grmember.source_relation = user_group.source_relation
    left join user_has_role
        on sys_user.sys_user_id = user_has_role.sys_user_id
        and sys_user.source_relation = user_has_role.source_relation
    left join user_role
        on user_has_role.sys_user_role_id = user_role.sys_user_role_id
        and user_has_role.source_relation = user_role.source_relation

    {{ dbt_utils.group_by(2) }}
),

user_aggregates as (

    select
        sys_user.sys_user_id,
        sys_user.source_relation,
        case when
            aggregate_counts.count_distinct_sys_user_group_ids <= 5000 then {{ fivetran_utils.string_agg("distinct user_grmember.sys_user_group_id", "'\\n'") }}
            else 'Too many sys user group ids to render' 
        end as sys_user_group_ids,
        case when
            aggregate_counts.count_distinct_sys_user_role_ids <= 5000 then {{ fivetran_utils.string_agg("distinct user_has_role.sys_user_role_id", "'\\n'") }}
            else 'Too many sys user role ids to render' 
        end as sys_user_role_ids,
        case when
            aggregate_counts.count_distinct_sys_user_role_names <= 5000 then {{ fivetran_utils.string_agg("distinct user_role.sys_user_role_name", "'\\n'") }}
            else 'Too many sys user role names to render' 
        end as sys_user_role_names,
        case when
            aggregate_counts.count_distinct_included_roles <= 5000 then {{ fivetran_utils.string_agg("distinct user_role.includes_roles", "'\\n'") }}
            else 'Too many roles to render' 
        end as included_roles,
        case when
            aggregate_counts.count_distinct_sys_user_group_roles <= 5000 then {{ fivetran_utils.string_agg("distinct user_group.sys_user_group_roles", "'\\n'") }}
            else 'Too many sys user group roles to render' 
        end as sys_user_group_roles

    from sys_user
    left join aggregate_counts
        on sys_user.sys_user_id = aggregate_counts.sys_user_id
        and sys_user.source_relation = aggregate_counts.source_relation
    left join user_grmember
        on sys_user.sys_user_id = user_grmember.sys_user_id
        and sys_user.source_relation = user_grmember.source_relation
    left join user_group
        on user_grmember.sys_user_group_id = user_group.sys_user_group_id
        and user_grmember.source_relation = user_group.source_relation
    left join user_has_role
        on sys_user.sys_user_id = user_has_role.sys_user_id
        and sys_user.source_relation = user_has_role.source_relation
    left join user_role
        on user_has_role.sys_user_role_id = user_role.sys_user_role_id
        and user_has_role.source_relation = user_role.source_relation

    group by sys_user_id, source_relation, count_distinct_sys_user_group_ids, count_distinct_sys_user_role_ids, count_distinct_sys_user_role_names, count_distinct_included_roles, count_distinct_sys_user_group_roles
)

select * 
from user_aggregates