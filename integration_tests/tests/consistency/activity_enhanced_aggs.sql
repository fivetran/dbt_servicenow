{{ config(
    tags="fivetran_validations",
    enabled=var('fivetran_validation_tests_enabled', false)
) }}

with prod as (
    select
        task_updated_date,
        source_relation,
        sum(total_active_tasks) as total_active_tasks,
        sum(total_active_problem_tasks) as total_active_problem_tasks,
        sum(total_active_change_tasks) as total_active_change_tasks,
        sum(total_associated_problems) as total_associated_problems, 
        sum(total_incidents_caused_by_problems) as total_incidents_caused_by_problems,
        sum(total_change_requests) as total_change_requests,
        sum(total_closed_tasks) as total_closed_tasks,
        sum(average_minutes_open_to_close) as average_minutes_open_to_close,
        sum(total_tasks_made_slas) as total_tasks_made_slas

    from {{ target.schema }}_servicenow_prod.servicenow__activity_summary
    group by 1,2
),

dev as (
    select
        task_updated_date,
        source_relation,
        sum(total_active_tasks) as total_active_tasks,
        sum(total_active_problem_tasks) as total_active_problem_tasks,
        sum(total_active_change_tasks) as total_active_change_tasks,
        sum(total_associated_problems) as total_associated_problems, 
        sum(total_incidents_caused_by_problems) as total_incidents_caused_by_problems,
        sum(total_change_requests) as total_change_requests,
        sum(total_closed_tasks) as total_closed_tasks,
        sum(average_minutes_open_to_close) as average_minutes_open_to_close,
        sum(total_tasks_made_slas) as total_tasks_made_slas

    from {{ target.schema }}_servicenow_dev.servicenow__activity_summary
    group by 1,2
),

final as (
    select
        prod.task_updated_date as prod_task_updated_date,
        dev.task_updated_date as dev_task_updated_date,
        prod.source_relation as prod_source_relation,
        dev.source_relation as dev_source_relation,
        prod.total_active_tasks as prod_total_active_tasks,
        dev.total_active_tasks as dev_total_active_tasks,
        prod.total_active_problem_tasks as prod_total_active_problem_tasks,
        dev.total_active_problem_tasks as dev_total_active_problem_tasks,
        prod.total_active_change_tasks as prod_total_active_change_tasks,
        dev.total_active_change_tasks as dev_total_active_change_tasks,
        prod.total_associated_problems as prod_total_associated_problems, 
        dev.total_associated_problems as dev_total_associated_problems, 
        prod.total_incidents_caused_by_problems as prod_total_incidents_caused_by_problems,
        dev.total_incidents_caused_by_problems as dev_total_incidents_caused_by_problems,
        prod.total_change_requests as prod_total_change_requests,
        dev.total_change_requests as dev_total_change_requests,
        prod.total_closed_tasks as prod_total_closed_tasks,
        dev.total_closed_tasks as dev_total_closed_tasks,
        prod.average_minutes_open_to_close as prod_average_minutes_open_to_close,
        dev.average_minutes_open_to_close as dev_average_minutes_open_to_close,
        prod.total_tasks_made_slas as prod_total_tasks_made_slas,
        dev.total_tasks_made_slas as dev_total_tasks_made_slas

    from prod
    full outer join dev
        on prod.task_updated_date = dev.task_updated_date
        and prod.source_relation = dev.source_relation
)

select * 
from final
where
    abs(prod_total_active_tasks - dev_total_active_tasks) > .1 or
    abs(prod_total_active_problem_tasks - dev_total_active_problem_tasks) > .1 or
    abs(prod_total_active_change_tasks - dev_total_active_change_tasks) > .1 or
    abs(prod_total_associated_problems - dev_total_associated_problems) > .1 or
    abs(prod_total_incidents_caused_by_problems - dev_total_incidents_caused_by_problems) > .1 or
    abs(prod_total_change_requests - dev_total_change_requests) > .1 or
    abs(prod_total_closed_tasks - dev_total_closed_tasks) > .1 or
    abs(prod_average_minutes_open_to_close - dev_average_minutes_open_to_close) > .1 or
    abs(prod_total_tasks_made_slas - dev_total_tasks_made_slas) > .1
