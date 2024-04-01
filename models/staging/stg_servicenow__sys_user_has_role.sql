{{ config(enabled=var('servicenow__using_roles', False)) }}

with base as (

    select * 
    from {{ ref('stg_servicenow__sys_user_has_role_base') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_servicenow__sys_user_has_role_base')),
                staging_columns=get_sys_user_has_role_columns()
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
        cast(sys_id as {{ dbt.type_string() }}) as sys_user_has_role_id,
        cast(sys_created_on as {{ dbt.type_timestamp() }}) as sys_user_has_role_created_at,
        sys_created_by,
        cast(sys_updated_on as {{ dbt.type_timestamp() }}) as sys_user_has_role_updated_at,
        sys_updated_by,
        user_link,
        cast(user_value as {{ dbt.type_string() }}) as sys_user_id, 
        role_link,
        cast(role_value as {{ dbt.type_string() }}) as sys_user_role_id,
        _fivetran_deleted,
        _fivetran_synced,
        granted_by_link,
        granted_by_value,
        included_in_role_instance_link,
        included_in_role_instance_value,
        included_in_role_link,
        included_in_role_value,
        inh_count,
        inh_map,
        inherited,
        state as sys_user_has_role_state,
        sys_mod_count
    from fields
)

select *
from final
where not _fivetran_deleted
