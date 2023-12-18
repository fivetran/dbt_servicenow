
with base as (

    select * 
    from {{ ref('stg_servicenow__sys_user_base') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_servicenow__sys_user_base')),
                staging_columns=get_sys_user_columns()
            )
        }}
        {{ fivetran_utils.source_relation(
            union_schema_variable='servicenow_union_schemas', 
            union_database_variable='servicenow_union_databases') 
        }}
    from base
),

final as (
    
    select 
        source_relation,
        cast(sys_id as {{ dbt.type_string() }}) as user_id,
        cast(sys_created_on as {{ dbt.type_timestamp() }}) as user_created_at,
        cast(sys_updated_on as {{ dbt.type_timestamp() }}) as user_updated_at,
        _fivetran_deleted,
        _fivetran_synced,
        accumulated_roles,
        active as is_active,
        avatar,
        building_link,
        building_value,
        calendar_integration,
        city,
        company_link,
        company_value,
        cost_center_link,
        cost_center_value,
        country,
        date_format,
        default_perspective_link,
        default_perspective_value,
        department_link,
        department_value,
        edu_status,
        email,
        employee_number,
        enable_multifactor_authn,
        failed_attempts,
        first_name,
        gender,
        hashed_user_id,
        home_phone,
        internal_integration_user,
        introduction,
        last_login as last_login_day_date,
        last_login_device,
        last_login_time as last_login_at,
        last_name,
        last_password,
        ldap_server_link,
        ldap_server_value,
        location_link,
        location_value,
        locked_out,
        manager_link,
        manager_value,
        middle_name,
        mobile_phone,
        name as sys_user_name,
        notification,
        password_needs_reset,
        phone,
        photo,
        preferred_language,
        roles,
        schedule_link,
        schedule_value,
        source,
        state,
        sys_class_name,
        sys_created_by,
        sys_domain_link,
        sys_domain_path,
        sys_domain_value,
        sys_mod_count,
        sys_updated_by,
        time_format,
        time_zone,
        title,
        user_name,
        user_password,
        vip,
        web_service_access_only,
        zip
    from fields
)

select *
from final
