
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
