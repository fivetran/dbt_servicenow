with problem as (

    select *
    from {{ ref('stg_servicenow__problem') }}
),

problem_task as (
    
    select
        problem_value,
        source_relation,
        count(problem_task_id) as total_tasks
    from {{ ref('stg_servicenow__problem_task') }}
    group by 1,2
),

problem_enhanced as (

    select 

        problem.problem_id,
        problem.problem_subcategory,
        problem.problem_category,
        problem.problem_state,
        problem.problem_created_at,
        problem.problem_updated_at,
        problem.problem_confirmed_at,
        problem.problem_confirmed_by_link,
        problem.problem_confirmed_by_value,
        problem.problem_fix_at,
        problem.problem_fix_by_link,
        problem.problem_fix_by_value,
        problem.problem_resolution_code,
        problem.problem_resolved_at,
        problem.resolved_by_link,
        problem.problem_resolved_by_value,
        problem.problem_first_reported_by_task_link,
        problem.problem_first_reported_by_task_value,
        problem.fix_communicated_at,
        problem.fix_communicated_by_link,
        problem.fix_communicated_by_value,
        problem.reopen_count,
        problem.reopened_at,
        problem.reopened_by_link,
        problem.reopened_by_value,
        problem.cause_notes,
        problem.duplicate_of_link,
        problem.duplicate_of_value,
        problem.problem_fix_notes,
        problem.is_known_error,
        problem.is_major_problem,
        problem.problem_related_incidents,
        problem.review_outcome,
        problem.rfc_link,
        problem.rfc_value,
        problem.workaround,
        problem.workaround_applied,
        problem.workaround_communicated_at,
        problem.workaround_communicated_by_link,
        problem.workaround_communicated_by_value,
        {{ dbt.datediff("problem.problem_created_at", "problem.problem_fix_at", 'minute') }} as problem_minutes_created_to_fix,
        {{ dbt.datediff("problem.problem_created_at", "problem.problem_resolved_at", 'minute') }} as problem_minutes_created_to_resolved,
        problem._fivetran_synced,
        problem_task.total_tasks as total_related_tasks,
        problem.source_relation

        -- add user values

    from problem
    left join problem_task
        on problem.problem_id = problem_task.problem_value
        and problem.source_relation = problem_task.source_relation
    where not _fivetran_deleted
)

select *
from problem_enhanced