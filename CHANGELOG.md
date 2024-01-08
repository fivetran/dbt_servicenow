# dbt_servicenow v0.1.0
This is the initial release of the Service Now dbt package!

# 📣 What does this dbt package do?
This package models Service Now data from [Fivetran's connector](https://fivetran.com/docs/applications/servicenow). It uses data in the format described by [this ERD](https://fivetran.com/docs/applications/servicenow#schemainformation).

The main focus of the package is to transform the core object tables into analytics-ready models, including:
<!--section="servicenow_model"-->
  - Materializes [ServiceNow staging and output models](https://fivetran.github.io/dbt_servicenow/#!/overview/servicenow_source/models/?g_v=1) which leverage data in the format described by [this ERD](https://fivetran.com/docs/applications/servicenow/#schemainformation). 
  - The staging tables clean, test, and prepare your ServiceNow data from [Fivetran's connector](https://fivetran.com/docs/applications/servicenow_source) for analysis by doing the following: 
    - Renames fields for consistency and standardization.
    - Adds column-level testing where applicable. For example, all primary keys are tested for uniqueness and non-null values.
    - Generates a comprehensive data dictionary of your ServiceNow data through the [dbt docs site](https://fivetran.github.io/dbt_servicenow/).

The output models are focused around the task management feature of Service Now. For more information, refer to the [README](./README.md) 