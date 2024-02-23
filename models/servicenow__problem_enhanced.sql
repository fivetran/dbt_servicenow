
with problem as (

  select *
  from {{ ref('stg_servicenow__problem') }}
),

problem_task as (
    
  select *
  from {{ ref('stg_servicenow__problem_task') }}
),

problem_enhanced as (

select 

  problem.problem_id,
  

from problem
left join 
)

select *
from problem_enhanced