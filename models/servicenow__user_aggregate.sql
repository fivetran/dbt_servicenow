{{ config(enabled=var('servicenow__using_roles', False)) }}

with user as (
    
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

user_aggregates as (

    select
        user.sys_user_id,
        user.source_relation,
        {{ dbt.listagg(measure="user_grmember.sys_user_group_id") }} as sys_user_group_ids,
        {{ dbt.listagg(measure="user_has_role.sys_user_role_id") }} as sys_user_role_ids


    from user
    left join user_grmember
        on user.sys_user_id = user_grmember.sys_user_id
        and user.source_relation = user_grmember.source_relation
    left join user_group
        on user_grmember.sys_user_group_id = user_group.sys_user_group_id
        and user_grmember.source_relation = user_group.source_relation
    left join user_has_role
        on user.sys_user_id = user_has_role.sys_user_id
        and user.source_relation = user_has_role.source_relation
    left join user_role
        on user_has_role.sys_user_role_id = user_role.sys_user_role_id
        and user_has_role.source_relation = user_role.source_relation

    {{ dbt_utils.group_by(2) }}
)

select * 
from user_aggregates