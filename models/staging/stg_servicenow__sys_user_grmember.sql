{{ config(enabled=var('servicenow__using_roles', False)) }}

with base as (

    select * 
    from {{ ref('stg_servicenow__sys_user_grmember_base') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_servicenow__sys_user_grmember_base')),
                staging_columns=get_sys_user_grmember_columns()
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
        cast(sys_id as {{ dbt.type_string() }}) as sys_user_grmember_id,
        cast(sys_created_on as {{ dbt.type_timestamp() }}) as sys_user_grmember_created_at,
        cast(sys_updated_on as {{ dbt.type_timestamp() }}) as sys_user_grmember_updated_at,
        sys_created_by,
        sys_updated_by,
        _fivetran_deleted,
        _fivetran_synced,
        group_link,
        cast(group_value as {{dbt.type_string() }}) as sys_user_group_id,
        sys_mod_count,
        user_link,
        cast(user_value as {{dbt.type_string() }}) as sys_user_id
    from fields
    where not coalesce(_fivetran_deleted, false)
)

select *
from final
