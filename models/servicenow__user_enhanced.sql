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
)

select
    user.sys_user_id,
    -- user.user_created_at,
    -- user.user_updated_at,
    -- user._fivetran_deleted,
    -- user.accumulated_roles,
    -- user.first_name,
    -- user.last_name,
    -- user.sys_user_name,
    -- user.is_active,
    -- user.company_link,
    -- user.company_value,
    -- user.cost_center_link,
    -- user.cost_center_value,
    -- user.department_link,
    -- user.department_value,
    -- user.email,
    -- user.employee_number,
    -- user.gender,
    -- user.hashed_user_id,
    -- user.last_password,
    -- user.ldap_server_link,
    -- user.ldap_server_value,
    -- user.manager_link,
    -- user.manager_value,
    -- user.mobile_phone,
    -- user.phone,
    -- user.roles,
    -- user.schedule_link,
    -- user.schedule_value,
    -- user.source,
    -- user.state,
    -- user.sys_class_name,
    -- user.sys_domain_link,
    -- user.sys_domain_path,
    -- user.sys_domain_value,
    -- user.time_format,
    -- user.time_zone,
    -- user.user_name,
    -- user.user_password,
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
