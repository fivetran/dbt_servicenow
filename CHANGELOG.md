# dbt_servicenow v0.1.1
[PR #7](https://github.com/fivetran/dbt_servicenow/pull/7) documents the DECISIONLOG in the README and moves the DECISIONLOG out of the /models folder, so that customers will be able to easily find it as a resource.

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
