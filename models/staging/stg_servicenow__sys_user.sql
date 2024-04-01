
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
        cast(sys_id as {{ dbt.type_string() }}) as sys_user_id,
        cast(sys_created_on as {{ dbt.type_timestamp() }}) as user_created_at,
        sys_created_by,
        cast(sys_updated_on as {{ dbt.type_timestamp() }}) as user_updated_at,
        sys_updated_by,
        _fivetran_deleted,
        _fivetran_synced,
        accumulated_roles,
        active as is_active,
        avatar,
        building_link,
        cast(building_value as {{ dbt.type_string() }}) as building_value,
        calendar_integration,
        city,
        company_link,
        cast(company_value as {{ dbt.type_string() }}) as company_value,
        cost_center_link,
        cast(cost_center_value as {{ dbt.type_string() }}) as cost_center_value,
        country,
        date_format,
        default_perspective_link,
        cast(default_perspective_value as {{ dbt.type_string() }}) as default_perspective_value,
        department_link,
        cast(department_value as {{ dbt.type_string() }}) as department_value,
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
        cast ({{ dbt.date_trunc('day', 'last_login') }} as date)  as last_login_day_date,
        last_login_device,
        last_login_time as last_login_at,
        last_name,
        last_password,
        ldap_server_link,
        cast(ldap_server_value as {{ dbt.type_string() }}) as ldap_server_value,
        location_link,
        cast(location_value as {{ dbt.type_string() }}) as location_value,
        locked_out,
        manager_link,
        cast(manager_value as {{ dbt.type_string() }}) as manager_value,
        middle_name,
        mobile_phone,
        name as sys_user_name,
        notification,
        password_needs_reset,
        phone,
        photo,
        preferred_language,
        roles as sys_user_roles,
        schedule_link,
        cast(schedule_value as {{ dbt.type_string() }}) as schedule_value,
        source,
        state,
        sys_class_name,
        sys_domain_link,
        sys_domain_path,
        cast(sys_domain_value as {{ dbt.type_string() }}) as sys_domain_value,
        sys_mod_count,
        time_format,
        time_zone,
        title,
        user_name,
        user_password,
        vip,
        web_service_access_only,
        zip
    from fields
    where not _fivetran_deleted
)

select *
from final
