with user_aggregates as (

    select *
    from {{ ref('servicenow__user_aggregate')}}
),

user as (
    
    select *
    from {{ ref('stg_servicenow__sys_user') }}
),

user_enhanced as (

    select

        user_aggregates.*,
        user.user_created_at,
        user.user_updated_at,
        user._fivetran_deleted,
        user.accumulated_roles,
        user.first_name,
        user.last_name,
        user.sys_user_name,
        user.is_active,
        user.company_link,
        user.company_value,
        user.cost_center_link,
        user.cost_center_value,
        user.department_link,
        user.department_value,
        user.email,
        user.employee_number,
        user.gender,
        user.hashed_user_id,
        user.last_password,
        user.ldap_server_link,
        user.ldap_server_value,
        user.manager_link,
        user.manager_value,
        user.mobile_phone,
        user.phone,
        user.roles,
        user.schedule_link,
        user.schedule_value,
        user.source,
        user.state,
        user.sys_class_name,
        user.sys_domain_link,
        user.sys_domain_path,
        user.sys_domain_value,
        user.time_format,
        user.time_zone,
        user.user_name,
        user.user_password

    from user_aggregates
    left join user
        on user_aggregates.sys_user_id = user.sys_user_id
        and user_aggregates.source_relation = user.source_relation
)

select *
from user_enhanced