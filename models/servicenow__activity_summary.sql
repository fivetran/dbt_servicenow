with ticket_enhanced as (

    select * 
    from {{ ref('servicenow__task_enhanced') }}
)

select 
    task_updated_date,
    task_state,
    priority,
    impact,
    urgency,
    source_relation,
    count(distinct case when is_task_active = true then task_id end) as total_active_tasks,
    count(distinct case when is_problem_task = true and is_task_active = true then task_id end) as total_active_problem_tasks,
    count(distinct case when is_change_task = true and is_task_active = true then task_id end) as total_active_change_tasks,
    count(distinct associated_problem_id) as total_associated_problems, 
    sum(problem_related_incidents) as total_incidents_caused_by_problems,
    count(distinct associated_change_request_id) as total_change_requests,
    count(distinct case when task_closed_at is not null then task_id end) as total_closed_tasks,
    avg(task_minutes_open_to_close) as average_minutes_open_to_close,
    count(case when is_made_sla = true then 1 end) as total_tasks_made_slas

from ticket_enhanced
group by 1,2,3,4,5,6
