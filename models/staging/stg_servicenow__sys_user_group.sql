
with base as (

    select * 
    from {{ ref('stg_servicenow__sys_user_group_base') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_servicenow__sys_user_group_base')),
                staging_columns=get_sys_user_group_columns()
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
        cast(sys_id as {{ dbt.type_string() }}) as sys_user_group_id,
        cast(sys_created_on as {{ dbt.type_timestamp() }}) as sys_user_group_created_at,
        cast(sys_updated_on as {{ dbt.type_timestamp() }}) as sys_user_group_updated_at,
        _fivetran_deleted,
        _fivetran_synced,
        active as is_active,
        cost_center_link,
        cast(cost_center_value as {{ dbt.type_string() }}) as cost_center_value,
        default_assignee_link,
        cast(default_assignee_value as {{ dbt.type_string() }}) as default_assignee_value,
        description,
        email,
        exclude_manager,
        include_members,
        manager_link,
        cast(manager_value as {{ dbt.type_string() }}) as manager_value,
        name as sys_user_group_name,
        parent_link,
        cast(parent_value as {{ dbt.type_string() }}) as parent_value,
        roles,
        source,
        sys_created_by,
        sys_mod_count,
        sys_updated_by,
        type
    from fields
)

select *
from final
