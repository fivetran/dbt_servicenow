# dbt_servicenow v0.3.0
[PR #10](https://github.com/fivetran/dbt_servicenow/pull/10) includes the following updates:

## Breaking Changes
-  The following fields were removed from the `servicenow__task_enhanced` model as `problem_first_reported_by_task_value` was incorrectly assumed to have corresponding `sys_user` values, but in actuality is related to the task table and therefore have no user fields.
    - `problem_reporter_email`
    - `problem_reporter_manager_value`
    - `problem_reporter_department_value`
    - `problem_reporter_name`
    - `problem_reporter_roles`

## Feature Updates
#### Display Names
- The following fields were added to the `servicenow__incident_enhanced` model to add relevant display names to the `caller_id_value`.
  - `caller_email` 
  - `caller_manager_value`
  - `caller_department_value`
  - `caller_name`
  - `caller_roles`
- The following fields were added to the `servicenow__user_enhanced` model to add relevant display names to the `company_value` and `manager_value`. 
  - `company_name`
  - `manager_name`
- The following label fields were added to respective choice fields in order to bring the display value (`dv`), or human-readable text available in the ServiceNow UI, displayed for each choice option:
  - `dv_priority_label`
  - `dv_impact_label`
  - `dv_urgency_label`
  - `dv_task_state_label`
  - `dv_problem_state_label`
  - `dv_change_request_type_label`
  - `dv_change_request_phase_state_label`
  - `dv_change_request_risk_label`
  - `dv_incident_category_label`
  - `dv_incident_subcategory_label`
  - `dv_incident_severity_label`
  - `dv_incident_state_label`
  - `dv_business_impact_label`

- Certain choice fields have labels that can depend on the `dependent_value` field in the `sys_choice` table. This dependency typically arises when the same choice field can have different labels based on the context in which it is used. Therefore some elements from `sys_choice` are also joined in on the additional `dependent_value` field. For example, here is a common example where `dependent_value` might influence the label:
    - `incident_category` and `incident_subcategory`: These fields often depend on each other. For instance, if the `incident_category` is "Software," the `incident_subcategory` might have different options compared to when the category is "Hardware." The `dependent_value` in this case could represent the incident_category and influence the incident_subcategory labels.
    - For more information about the logic used to attach labels to choice fields, refer to the [DECISIONLOG](https://github.com/fivetran/dbt_servicenow/blob/main/DECISIONLOG.md#methodology-for-adding-label-for-choice-fields) where a section has been added (titled *Methodology for Adding Labels for Choice Fields*).

#### New Staging Model
- To include labels, we used a new source table `sys_choice`. This is reflected upstream, in the newly added `stg_servicenow__sys_choice` and `stg_servicenow__sys_choice_base`. 

#### Aggregations in User Models
- The following fields, which previously only existed in intermediate CTEs, have been persisted through to the `servicenow__user_aggregated` and `servicenow__user_enhanced` models to add more user metadata:
  - `count_distinct_sys_user_group_ids`
  - `count_distinct_sys_user_role_ids`
  - `count_distinct_sys_user_role_names`
  - `count_distinct_included_roles`
  - `count_distinct_sys_user_group_roles`
- Additionally, we've realized the way these fields were previously aggregated could unintentionally also include blank values that were not-null, so we have updated the logic accordingly.

## Under The Hood
- Added explicit casts to timestamp fields, as well as string casts to choice fields in order to join them later downstream on `sys_choice.element`.
- Added consistency and integrity validation tests within integration_tests folder for all current end models.
- Updated the logic for 

# dbt_servicenow v0.2.0
[PR #8](https://github.com/fivetran/dbt_servicenow/pull/8) includes the following updates:

## Feature Updates
- Adds the following new models:


| **Model**                 | **Description**                                                                                                    |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| [servicenow__problem_enhanced](https://fivetran.github.io/dbt_servicenow/#!/model/model.servicenow.servicenow__problem_enhanced)  | Each record represents a problem with additional information about users who have interacted with it, pertinent task data, and relevant timestamps.    |
| [servicenow__incident_enhanced](https://fivetran.github.io/dbt_servicenow/#!/model/model.servicenow.servicenow__incident_enhanced)  | Each record represents an incident with additional information about users who have interacted with it and relevant timestamps.    |
| [servicenow__change_request_enhanced](https://fivetran.github.io/dbt_servicenow/#!/model/model.servicenow.servicenow__change_request_enhanced)  | Each record represents a change request with additional information about users who have interacted with it, pertinent task data, and relevant timestamps.    |
| [servicenow__user_aggregated](https://fivetran.github.io/dbt_servicenow/#!/model/model.servicenow.servicenow__user_aggregated)  | Each record represents a user with their associated groups and roles.    |
| [servicenow__user_enhanced](https://fivetran.github.io/dbt_servicenow/#!/model/model.servicenow.servicenow__user_enhanced)  | Each record represents a user with their associated groups and roles, in addition to additional user info from the sys_user table.    |

- In addition, adds the following upstream tables: `stg_servicenow__sys_user_grmember_base`, `stg_servicenow__sys_user_has_role_base` , `stg_servicenow__sys_user_role_base`

## 🚨 Breaking Changes
- Records where `_fivetran_deleted` is marked true have been removed.

## Under The Hood
- Updates field names upstream to specify what type of entity it pertains to (example: _incident_*)
- Introduces the `servicenow__using_roles` to enable the user role/group-based tables, which are disabled by default.

# dbt_servicenow v0.1.1
[PR #7](https://github.com/fivetran/dbt_servicenow/pull/7) includes the following updates:

## Documentation Updates 
- Documents the DECISIONLOG in the README and moves the DECISIONLOG out of the `/models` folder, so that customers will be able to easily find it as a resource.

# dbt_servicenow v0.1.0
This is the initial release of the ServiceNow dbt package!

# 📣 What does this dbt package do?
This package models ServiceNow data from [Fivetran's connector](https://fivetran.com/docs/applications/servicenow). It uses data in the format described by [this ERD](https://fivetran.com/docs/applications/servicenow#schemainformation).

The main focus of the package is to transform the core object tables into analytics-ready models, including:
<!--section="servicenow_model"-->
  - Materializes [ServiceNow staging and output models](https://fivetran.github.io/dbt_servicenow/#!/overview/servicenow_source/models/?g_v=1) which leverage data in the format described by [this ERD](https://fivetran.com/docs/applications/servicenow/#schemainformation). 
  - The staging tables clean, test, and prepare your ServiceNow data from [Fivetran's connector](https://fivetran.com/docs/applications/servicenow) for analysis by doing the following:
    - Renames fields for consistency and standardization. For example, primary keys `sys_id` are renamed to `<table_name>_id`.
    - Adds column-level testing where applicable. For example, all primary keys are tested for uniqueness and non-null values.
    - Generates a comprehensive data dictionary of your ServiceNow data through the [dbt docs site](https://fivetran.github.io/dbt_servicenow/).

  - The output models are focused around task Management. 
    - Summarizes task, problem, change, incident, and change request data by varying grains including last updated day, status, priority, impact, and urgency.
    - Enhances each task record with additional information about its associated problem, incident, or change request. Finally, it contains user information for who opened, started, updated, reported, fixed, closed, requested, reported, or confirmed the task.
  
For more information, refer to the [README](./README.md)
