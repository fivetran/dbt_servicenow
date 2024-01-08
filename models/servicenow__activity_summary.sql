with ticket_enhanced as (

    select * 
    from {{ ref('servicenow__ticket_enhanced') }}
)

select  
    cast(task_updated_at as date) as ticket_updated_date,
    task_state, 
    priority, 
    impact, 
    urgency, 
    source_relation,
    count(distinct case when is_task_active then task_id end) as total_active_tasks,
    count(distinct case when is_problem_task and is_task_active then task_id end) as total_active_problem_tasks,
    count(distinct case when is_change_task and is_task_active then task_id end) as total_active_change_tasks,
    count(distinct associated_problem_id) as total_associated_problems, 
    sum(total_incidents_caused_by_problem) as total_incidents_caused_by_problems,
    count(distinct associated_change_request_id) as total_change_requests,
    count(distinct case when task_closed_at is not null then task_id end) as total_closed_tasks,
    avg(task_minutes_to_close) as average_minutes_to_close  -- just added this.. need to debug 

from ticket_enhanced
group by 1,2,3,4,5,6
