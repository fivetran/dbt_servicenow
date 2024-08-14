{{ config(enabled=var('servicenow__using_roles', False)) }}

with user_aggregates as (

    select *
    from {{ ref('servicenow__user_aggregated')}}
),

sys_user as (
    
    select *
    from {{ ref('stg_servicenow__sys_user') }}
),

core_company as (
    
    select *
    from {{ ref('stg_servicenow__core_company') }}
),

user_enhanced as (

    select

        user_aggregates.*,
        sys_user.user_created_at,
        sys_user.user_updated_at,
        sys_user.accumulated_roles,
        sys_user.first_name,
        sys_user.last_name,
        sys_user.sys_user_name,
        sys_user.is_active,
        sys_user.company_link,
        sys_user.company_value,
        core_company.company_name,
        sys_user.cost_center_link,
        sys_user.cost_center_value,
        sys_user.department_link,
        sys_user.department_value,
        sys_user.email,
        sys_user.employee_number,
        sys_user.gender,
        sys_user.hashed_user_id,
        sys_user.last_password,
        sys_user.ldap_server_link,
        sys_user.ldap_server_value,
        sys_user.manager_link,
        sys_user.manager_value,
        manager.sys_user_name as manager_name,
        sys_user.mobile_phone,
        sys_user.phone,
        sys_user.sys_user_roles,
        sys_user.schedule_link,
        sys_user.schedule_value,
        sys_user.source,
        sys_user.state,
        sys_user.sys_class_name,
        sys_user.sys_domain_link,
        sys_user.sys_domain_path,
        sys_user.sys_domain_value,
        sys_user.time_format,
        sys_user.time_zone,
        sys_user.user_name,
        sys_user.user_password

    from user_aggregates
    left join sys_user
        on user_aggregates.sys_user_id = sys_user.sys_user_id
        and user_aggregates.source_relation = sys_user.source_relation
    left join core_company 
        on sys_user.company_value = core_company.core_company_id
        and sys_user.source_relation = core_company.source_relation
    left join sys_user manager
        on sys_user.manager_value = manager.sys_user_id
        and sys_user.source_relation = manager.source_relation
)

select *
from user_enhanced