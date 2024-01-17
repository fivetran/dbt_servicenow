with incident as (
    
    select *
    from {{ ref('stg_servicenow__incident') }}
),

incidents_per_problem as (

    select
        problem_id_value,
        count(distinct incident_id) as total_incidents
    from incident
    group by 1
)

select * 
from incidents_per_problem