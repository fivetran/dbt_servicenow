with sys_user as (
    
    select *
    from {{ ref('stg_servicenow__sys_user') }}
),


