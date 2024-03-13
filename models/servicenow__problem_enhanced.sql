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

sys_user as (
    
    select *
    from {{ ref('stg_servicenow__sys_user') }}
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
        problem_confirmer.email as problem_confirmer_email,
        problem_confirmer.manager_value as problem_confirmer_manager_value,
        problem_confirmer.department_value as problem_confirmer_department_value,
        problem_confirmer.sys_user_name as problem_confirmer_name,
        problem_confirmer.roles as problem_confirmer_roles,
        problem.problem_fix_at,
        problem.problem_fix_by_link,
        problem.problem_fix_by_value,
        problem_fixer.email as problem_fixer_email,
        problem_fixer.manager_value as problem_fixer_manager_value,
        problem_fixer.department_value as problem_fixer_department_value,
        problem_fixer.sys_user_name as problem_fixer_name,
        problem_fixer.roles as problem_fixer_roles,
        problem.problem_resolution_code,
        problem.problem_resolved_at,
        problem.resolved_by_link,
        problem.problem_resolved_by_value,
        problem_resolver.email as problem_resolver_email,
        problem_resolver.manager_value as problem_resolver_manager_value,
        problem_resolver.department_value as problem_resolver_department_value,
        problem_resolver.sys_user_name as problem_resolver_name,
        problem_resolver.roles as problem_resolver_roles,
        problem.problem_first_reported_by_task_link,
        problem.problem_first_reported_by_task_value,
        problem.fix_communicated_at,
        problem.fix_communicated_by_link,
        problem.fix_communicated_by_value,
        problem_fix_communicator.email as problem_fix_communicator_email,
        problem_fix_communicator.manager_value as problem_fix_communicator_manager_value,
        problem_fix_communicator.department_value as problem_fix_communicator_department_value,
        problem_fix_communicator.sys_user_name as problem_fix_communicator_name,
        problem_fix_communicator.roles as problem_fix_communicator_roles,
        problem.reopen_count,
        problem.reopened_at,
        problem.reopened_by_link,
        problem.reopened_by_value,
        problem_reopener.email as problem_reopener_email,
        problem_reopener.manager_value as problem_reopener_manager_value,
        problem_reopener.department_value as problem_reopener_department_value,
        problem_reopener.sys_user_name as problem_reopener_name,
        problem_reopener.roles as problem_reopener_roles,
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
        problem_workaround_communicator.email as problem_workaround_communicator_email,
        problem_workaround_communicator.manager_value as problem_workaround_communicator_manager_value,
        problem_workaround_communicator.department_value as problem_workaround_communicator_department_value,
        problem_workaround_communicator.sys_user_name as problem_workaround_communicator_name,
        problem_workaround_communicator.roles as problem_workaround_communicator_roles,
        {{ dbt.datediff("problem.problem_created_at", "problem.problem_fix_at", 'minute') }} as problem_minutes_created_to_fix,
        {{ dbt.datediff("problem.problem_created_at", "problem.problem_resolved_at", 'minute') }} as problem_minutes_created_to_resolved,
        problem._fivetran_synced,
        problem_task.total_tasks as total_related_tasks,
        problem.source_relation

    from problem
    left join problem_task
        on problem.problem_id = problem_task.problem_value
        and problem.source_relation = problem_task.source_relation
    left join sys_user problem_confirmer
        on problem.problem_confirmed_by_value = problem_confirmer.sys_user_id
        and problem.source_relation = problem_confirmer.source_relation
    left join sys_user problem_fixer
        on problem.problem_fix_by_value = problem_fixer.sys_user_id
        and problem.source_relation = problem_fixer.source_relation
    left join sys_user problem_resolver
        on problem.problem_resolved_by_value = problem_resolver.sys_user_id
        and problem.source_relation = problem_resolver.source_relation
    left join sys_user problem_fix_communicator
        on problem.fix_communicated_by_value = problem_fix_communicator.sys_user_id
        and problem.source_relation = problem_fix_communicator.source_relation
    left join sys_user problem_reopener
        on problem.reopened_by_value = problem_reopener.sys_user_id
        and problem.source_relation = problem_reopener.source_relation
    left join sys_user problem_workaround_communicator
        on problem.workaround_communicated_by_value = problem_workaround_communicator.sys_user_id
        and problem.source_relation = problem_workaround_communicator.source_relation
    where not problem._fivetran_deleted
)

select *
from problem_enhanced