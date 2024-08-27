with task as (
  select *
  from {{ ref('stg_servicenow__task') }}
),

problem_task as (
  select *
  from {{ ref('stg_servicenow__problem_task') }}
),

problem as (
  select *
  from {{ ref('stg_servicenow__problem') }}
),

change_task as (
  select *
  from {{ ref('stg_servicenow__change_task') }}
),

change_request as (
  select *
  from {{ ref('stg_servicenow__change_request') }}
),

sys_user as (
  select *
  from {{ ref('stg_servicenow__sys_user') }}
),

sys_user_group as (
  select *
  from {{ ref('stg_servicenow__sys_user_group') }}
),

core_company as (
  select *
  from {{ ref('stg_servicenow__core_company') }}
),

cmdb_ci as (
  select *
  from {{ ref('stg_servicenow__cmdb_ci') }}
),

cmdb_ci_service as (
  select *
  from {{ ref('stg_servicenow__cmdb_ci_service') }}
),

sys_choice as (
  select *
  from {{ ref('stg_servicenow__sys_choice') }}
  where sys_choice_name = 'task'
),

task_enhanced as (
  select 
    task.task_id,
    task.is_task_active,
    task.task_description,
    task.activity_due,
    task.priority,
    priority_choice.label as dv_priority_label,
    task.impact,
    impact_choice.label as dv_impact_label,
    task.urgency,
    urgency_choice.label as dv_urgency_label,
    task.task_state,
    state_choice.label as dv_task_state_label,
    task.task_number,
    task.task_order,
    cast( (case when problem_task.problem_task_id is not null 
      then true 
      else false 
    end) as {{ dbt.type_boolean() }}) as is_problem_task,
    cast( (case when change_task.change_task_id is not null 
      then true 
      else false 
    end) as {{ dbt.type_boolean() }}) as is_change_task,
    task.task_created_at,
    task.sys_created_by,
    task.cmdb_ci_link,
    task.cmdb_ci_value,
    cmdb_ci.cmdb_ci_name,
    creator.email as creator_email,
    creator.manager_value as creator_manager_value,
    creator.department_value as creator_department_value,
    creator.sys_user_name as creator_name,
    creator.sys_user_roles as creator_roles,
    task.task_updated_at,
    cast ({{ dbt.date_trunc('day', 'task.task_updated_at') }} as date) as task_updated_date,
    task.sys_updated_by,
    updater.email as updater_email,
    updater.manager_value as updater_manager_value,
    updater.department_value as updater_department_value,
    updater.sys_user_name as updater_name,
    updater.sys_user_roles as updater_roles,
    task.task_opened_at,
    task.opened_by_link,
    task.opened_by_value, 
    opener.manager_value as opener_manager_value,
    opener.email as opener_email,
    opener.department_value as opener_department_value,
    opener.sys_user_name as opener_name,
    opener.sys_user_roles as opener_roles,
    task.assigned_to_link, 
    task.assigned_to_value,
    assignee.email as assignee_email,
    assignee.manager_value as assignee_manager_value,
    assignee.department_value as assignee_department_value,
    assignee.sys_user_name as assignee_name,
    assignee.sys_user_roles as assignee_roles,
    task.task_closed_at,
    {{ dbt.datediff("cast(task.task_opened_at as " ~ dbt.type_timestamp() ~ " ) ", "cast(task.task_closed_at as " ~ dbt.type_timestamp() ~ " ) ", 'minute') }} as task_minutes_open_to_close,
    task.closed_by_link,
    task.closed_by_value,
    closer.email as closer_email,
    closer.manager_value as closer_manager_value,
    closer.department_value as closer_department_value,
    closer.sys_user_name as closer_name,
    closer.sys_user_roles as closer_roles,
    task.task_effective_number,
    task.additional_assignee_list,
    task.approval,
    task.approval_history,
    task.approval_set,
    task.assignment_group_link,
    task.assignment_group_value,
    assignment_group.sys_user_group_name as assignment_group_name,
    task.business_duration,
    task.calendar_duration,
    task.business_service_link,
    task.business_service_value,
    business_service.cmdb_ci_service_name as business_service_name,
    task.close_notes,
    task.comments,
    task.comments_and_work_notes,
    task.company_link,
    task.company_value, 
    core_company.company_name,
    task.contact_type, 
    task.task_due_date_at,
    task.expected_start,
    task.task_follow_up_at,
    task.group_list,
    task.knowledge,
    task.is_made_sla,
    task.sla_due,
    task.parent_link, 
    task.parent_value,
    task.reassignment_count,
    task.route_reason,
    task.short_description,
    task.sys_class_name,
    task.sys_domain_link,
    task.sys_domain_path,
    task.sys_domain_value,
    task.upon_approval,
    task.upon_reject,
    task.watch_list,
    task.work_start,
    task.work_end,
    task.work_notes,
    task.work_notes_list,
    problem_task.problem_task_cause_code,
    problem_task.problem_task_close_code,
    problem_task.problem_task_type,
    problem_task.problem_task_started_at,
    problem_task.started_by_value,
    problem_task_starter.email as problem_task_starter_email,
    problem_task_starter.manager_value as problem_task_starter_manager_value,
    problem_task_starter.department_value as problem_task_starter_department_value,
    problem_task_starter.sys_user_name as problem_task_starter_name,
    problem_task_starter.sys_user_roles as problem_task_starter_roles, 
    problem.problem_id as associated_problem_id,
    problem.problem_category,
    problem.cause_notes,
    problem.problem_confirmed_at,
    problem.problem_confirmed_by_value,
    problem_confirmer.email as problem_confirmer_email,
    problem_confirmer.manager_value as problem_confirmer_manager_value,
    problem_confirmer.department_value as problem_confirmer_department_value,
    problem_confirmer.sys_user_name as problem_confirmer_name,
    problem_confirmer.sys_user_roles as problem_confirmer_roles,
    problem.problem_first_reported_by_task_link,
    problem.problem_first_reported_by_task_value,
    problem.problem_fix_at,
    problem.problem_fix_by_value,
    problem_fixer.email as problem_fixer_email,
    problem_fixer.manager_value as problem_fixer_manager_value,
    problem_fixer.department_value as problem_fixer_department_value,
    problem_fixer.sys_user_name as problem_fixer_name,
    problem_fixer.sys_user_roles as problem_fixer_roles,
    problem.problem_fix_notes,
    problem.is_known_error as problem_is_known_error,
    problem.is_major_problem,
    problem.problem_state,
    problem.problem_related_incidents,
    problem.problem_resolution_code,
    problem.problem_resolved_at,
    problem.problem_resolved_by_value,
    problem.workaround_applied,
    problem_resolver.email as problem_resolver_email,
    problem_resolver.manager_value as problem_resolver_manager_value,
    problem_resolver.department_value as problem_resolver_department_value,
    problem_resolver.sys_user_name as problem_resolver_name,
    problem_resolver.sys_user_roles as problem_resolver_roles,
    problem.problem_subcategory,
    problem.problem_created_at,
    problem.problem_updated_at,
    change_task.change_task_type,
    change_task.change_task_close_code,
    change_task.change_task_created_from,
    change_task.is_change_on_hold,
    change_task.change_on_hold_reason,
    change_task.change_task_planned_end_date,
    change_task.change_task_planned_start_date,
    change_request.change_request_id as associated_change_request_id,
    change_request.change_request_created_at,
    change_request.change_request_updated_at,
    change_request.change_request_category,
    change_request.change_plan,
    change_request.change_request_close_code,
    change_request.change_request_end_date,
    change_request.change_request_implementation_plan,
    change_request.change_request_justification,
    change_request.is_change_request_on_hold,
    change_request.change_request_on_hold_reason,
    change_request.change_request_phase,
    change_request.change_request_phase_state,
    change_request.change_request_reason,
    change_request.change_requested_by_date,
    change_request.change_requested_by_value,
    change_requester.email as change_requester_email,
    change_requester.manager_value as change_requester_manager_value,
    change_requester.department_value as change_requester_department_value,
    change_requester.sys_user_name as change_requester_name,
    change_requester.sys_user_roles as change_requester_roles,
    change_request.change_request_review_date,
    change_request.change_request_review_status,
    change_request.change_request_risk,
    change_request.change_request_scope,
    change_request.change_request_start_date,
    change_request.change_request_test_plan,
    change_request.change_request_type,
    change_request.is_change_request_unauthorized,
    task.source_relation

from task
left join core_company
  on task.company_value = core_company.core_company_id
  and task.source_relation = core_company.source_relation
left join problem_task
  on task.task_id = problem_task.problem_task_id
  and task.source_relation = problem_task.source_relation
left join sys_user problem_task_starter
  on problem_task.started_by_value = problem_task_starter.sys_user_id
  and problem_task.source_relation = problem_task_starter.source_relation
left join problem
  on problem_task.problem_value = problem.problem_id
  and problem_task.source_relation = problem.source_relation
left join sys_user problem_confirmer
  on problem.problem_confirmed_by_value = problem_confirmer.sys_user_id
  and problem.source_relation = problem_confirmer.source_relation
left join sys_user problem_fixer
  on problem.problem_fix_by_value = problem_fixer.sys_user_id
  and problem.source_relation = problem_fixer.source_relation
left join sys_user problem_resolver
  on problem.problem_resolved_by_value = problem_resolver.sys_user_id
  and problem.source_relation = problem_resolver.source_relation
left join change_task
  on task.task_id = change_task.change_task_id
  and task.source_relation = change_task.source_relation
left join change_request
  on change_task.change_request_value = change_request.change_request_id
  and change_task.source_relation = change_request.source_relation
left join sys_user change_requester
  on change_request.change_requested_by_value = change_requester.sys_user_id
  and change_request.source_relation = change_requester.source_relation
left join sys_user assignee
  on task.assigned_to_value = assignee.sys_user_id
  and task.source_relation = assignee.source_relation
left join sys_user closer 
  on task.closed_by_value = closer.sys_user_id
  and task.source_relation = closer.source_relation
left join sys_user opener
  on task.opened_by_value = opener.sys_user_id
  and task.source_relation = opener.source_relation
left join sys_user creator
  on task.sys_created_by = creator.sys_user_id
  and task.source_relation = creator.source_relation
left join sys_user updater
  on task.sys_updated_by = updater.sys_user_id
  and task.source_relation = updater.source_relation
left join sys_user_group assignment_group
  on task.assignment_group_value = assignment_group.sys_user_group_id
  and task.source_relation = assignment_group.source_relation
left join cmdb_ci
  on task.cmdb_ci_value = cmdb_ci.cmdb_ci_id
  and task.source_relation = cmdb_ci.source_relation
left join cmdb_ci_service business_service
  on task.business_service_value = business_service.cmdb_ci_service_id
  and task.source_relation = business_service.source_relation
left join sys_choice state_choice
  on task.task_state = state_choice.sys_choice_value
  and state_choice.element = 'state'
  and task.source_relation = state_choice.source_relation
left join sys_choice priority_choice
  on task.priority = priority_choice.sys_choice_value
  and priority_choice.element = 'priority'
  and task.source_relation = priority_choice.source_relation
left join sys_choice impact_choice
  on task.impact = impact_choice.sys_choice_value
  and impact_choice.element = 'impact'
  and task.source_relation = impact_choice.source_relation
left join sys_choice urgency_choice
  on task.urgency = urgency_choice.sys_choice_value
  and urgency_choice.element = 'urgency'
  and task.source_relation = urgency_choice.source_relation
)

select *
from task_enhanced