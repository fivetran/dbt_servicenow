<p align="center">
    <a alt="License"
        href="https://github.com/fivetran/dbt_servicenow/blob/main/LICENSE">
        <img src="https://img.shields.io/badge/License-Apache%202.0-blue.svg" /></a>
    <a alt="dbt-core">
        <img src="https://img.shields.io/badge/dbt_Core™_version->=1.3.0_<2.0.0-orange.svg" /></a>
    <a alt="Maintained?">
        <img src="https://img.shields.io/badge/Maintained%3F-yes-green.svg" /></a>
    <a alt="PRs">
        <img src="https://img.shields.io/badge/Contributions-welcome-blueviolet" /></a>
</p>


# ServiceNow dbt Package ([Docs](https://fivetran.github.io/dbt_servicenow/))

## What does this dbt package do?

This package models ServiceNow data from [Fivetran's connector](https://fivetran.com/docs/applications/servicenow). It uses data in the format described by [this ERD](https://fivetran.com/docs/applications/servicenow#schemainformation).

The main focus of the package is to transform the core object tables into analytics-ready models, including:

- Materializes [ServiceNow staging and output models](https://fivetran.github.io/dbt_servicenow/#!/overview/servicenow/models/?g_v=1) which leverage data in the format described by [this ERD](https://fivetran.com/docs/applications/servicenow/#schemainformation).
- The staging tables clean, test, and prepare your ServiceNow data from [Fivetran's connector](https://fivetran.com/docs/applications/servicenow) for analysis by doing the following:
    - Renames fields for consistency and standardization. For example, primary keys `sys_id` are renamed to `<table_name>_id`.
    - Adds column-level testing where applicable. For example, all primary keys are tested for uniqueness and non-null values.
    - Generates a comprehensive data dictionary of your ServiceNow data through the [dbt docs site](https://fivetran.github.io/dbt_servicenow/).
- The output models are focused around task management.
    - Summarizes task, problem, change, incident, and change request data by varying grains including last updated day, status, priority, impact, and urgency.
    - Enhances each task record with additional information about its associated problem, incident, or change request. Finally, it contains user information for who opened, started, updated, reported, fixed, closed, requested, reported, or confirmed the task.
    - Enhances user data with associated roles and groups.

The output models are focused around the task management feature of ServiceNow in addition to enhancing user records.

<!--section="servicenow_transformation_model"-->
The following table provides a detailed list of all tables materialized within this package by default.
> TIP: See more details about these tables in the package's [dbt docs site](https://fivetran.github.io/dbt_servicenow/#!/overview/servicenow).

| **Table**                 | **Description**                                                                                                    |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| [servicenow__activity_summary](https://fivetran.github.io/dbt_servicenow/#!/model/model.servicenow.servicenow__activity_summary)  | Each record represents aggregate task, problem, change, incident, and change request data by varying grains including update date, status, priority, impact, and urgency.    |
| [servicenow__task_enhanced](https://fivetran.github.io/dbt_servicenow/#!/model/model.servicenow.servicenow__task_enhanced)  | Each record represents a task with additional information about its associated problem, incident, or change request. Additionally, it contains user information for who opened, started, updated, reported, fixed, closed, requested, reported, or confirmed the task.  |
| [servicenow__problem_enhanced](https://fivetran.github.io/dbt_servicenow/#!/model/model.servicenow.servicenow__problem_enhanced)  | Each record represents a problem with additional information about users who have interacted with it, pertinent task data, and relevant timestamps.    |
| [servicenow__incident_enhanced](https://fivetran.github.io/dbt_servicenow/#!/model/model.servicenow.servicenow__incident_enhanced)  | Each record represents an incident with additional information about users who have interacted with it and relevant timestamps.    |
| [servicenow__change_request_enhanced](https://fivetran.github.io/dbt_servicenow/#!/model/model.servicenow.servicenow__change_request_enhanced)  | Each record represents a change request with additional information about users who have interacted with it, pertinent task data, and relevant timestamps.    |
| [servicenow__user_aggregated](https://fivetran.github.io/dbt_servicenow/#!/model/model.servicenow.servicenow__user_aggregated)  | Each record represents a user with their associated groups and roles.    |
| [servicenow__user_enhanced](https://fivetran.github.io/dbt_servicenow/#!/model/model.servicenow.servicenow__user_enhanced)  | Each record represents a user with their associated groups and roles, in addition to additional user info from the sys_user table.    |
<!--section-end-->


### Opinionated Modelling Decisions

Servicenow tables can be complex, for example exhibiting many-to-many relationships. For more information on table relationships and how they informed our model development, you may refer to the [DECISIONLOG](https://github.com/fivetran/dbt_servicenow/blob/main/DECISIONLOG.md).

## How do I use the dbt package?

### Step 1: Prerequisites
To use this dbt package, you must have the following:

- At least one Fivetran ServiceNow connector syncing data into your destination.
- A **BigQuery**, **Snowflake**, **Redshift**, **Databricks**, or **PostgreSQL** destination.

#### Databricks dispatch configuration
If you are using a Databricks destination with this package, you must add the following (or a variation of the following) dispatch configuration within your `dbt_project.yml`. This is required in order for the package to accurately search for macros within the `dbt-labs/spark_utils` then the `dbt-labs/dbt_utils` packages respectively.
```yml
dispatch:
  - macro_namespace: dbt_utils
    search_order: ['spark_utils', 'dbt_utils']
```

### Step 2: Install the package
Include the following ServiceNow package version in your `packages.yml` file:
> TIP: Check [dbt Hub](https://hub.getdbt.com/) for the latest installation instructions or [read the dbt docs](https://docs.getdbt.com/docs/package-management) for more information on installing packages.
```yml
packages:
  - package: fivetran/servicenow
    version: [">=0.3.0", "<0.4.0"] # we recommend using ranges to capture non-breaking changes automatically
```

### Step 3: Define database and schema variables
#### Single connector
By default, this package runs using your destination and the `servicenow` schema. If this is not where your ServiceNow data is (for example, if your ServiceNow schema is named `servicenow_fivetran`), add the following configuration to your root `dbt_project.yml` file:

```yml
# dbt_project.yml

vars:
    servicenow_database: your_database_name
    servicenow_schema: your_schema_name
```
#### Union multiple connectors
If you have multiple ServiceNow connectors in Fivetran and would like to use this package on all of them simultaneously, we have provided functionality to do so. The package will union all of the data together and pass the unioned table into the transformations. You will be able to see which source it came from in the `source_relation` column of each model. To use this functionality, you will need to set either the `servicenow_union_schemas` OR `servicenow_union_databases` variables (cannot do both) in your root `dbt_project.yml` file:

```yml
# dbt_project.yml

vars:
    servicenow_union_schemas: ['servicenow_usa','servicenow_canada'] # use this if the data is in different schemas/datasets of the same database/project
    servicenow_union_databases: ['servicenow_usa','servicenow_canada'] # use this if the data is in different databases/projects but uses the same schema name
```

> NOTE: The native `source.yml` connection set up in the package will not function when the union schema/database feature is utilized. Although the data will be correctly combined, you will not observe the sources linked to the package models in the Directed Acyclic Graph (DAG). This happens because the package includes only one defined `source.yml`.

To connect your multiple schema/database sources to the package models, follow the steps outlined in the [Union Data Defined Sources Configuration](https://github.com/fivetran/dbt_fivetran_utils/tree/releases/v0.4.latest#union_data-source) section of the Fivetran Utils documentation for the union_data macro. This will ensure a proper configuration and correct visualization of connections in the DAG.

### (Optional) Step 4: Additional configurations

#### Populating the User Models
Our user grain models are disabled by default because not everyone syncs the underlying tables: `sys_user_role`, `sys_user_has_role`, and `sys_user_grmember`. If these tables do exist in your schema, set this following variable `servicenow__using_roles` to True in order to populate the user models `servicenow__user_aggregated` and `servicenow__user_enhanced`.

```yml
# dbt_project.yml

vars:
    servicenow__using_roles: True
```

#### Changing the Build Schema
By default this package will build the ServiceNow staging models within a schema titled (<target_schema> + `_stg_servicenow`) and the ServiceNow final models within a schema titled (<target_schema> + `_servicenow`) in your target database. If this is not where you would like your modeled qualtrics data to be written to, add the following configuration to your `dbt_project.yml` file:

```yml
# dbt_project.yml

models:
  servicenow:
    +schema: my_new_schema_name # leave blank for just the target_schema
    staging:
        +schema: my_new_schema_name # leave blank for just the target_schema
```

#### Change the source table references
If an individual source table has a different name than the package expects, add the table name as it appears in your destination to the respective variable:

> IMPORTANT: See this project's [`dbt_project.yml`](https://github.com/fivetran/dbt_servicenow/blob/main/dbt_project.yml) variable declarations to see the expected names.

```yml
# dbt_project.yml

vars:
    servicenow_<default_source_table_name>_identifier: your_table_name 
```
</details>


### (Optional) Step 5: Orchestrate your models with Fivetran Transformations for dbt Core™
<details><summary>Expand for details</summary>
<br>
    
Fivetran offers the ability for you to orchestrate your dbt project through [Fivetran Transformations for dbt Core™](https://fivetran.com/docs/transformations/dbt). Learn how to set up your project for orchestration through Fivetran in our [Transformations for dbt Core setup guides](https://fivetran.com/docs/transformations/dbt#setupguide).
</details>


## Does this package have dependencies?
This dbt package is dependent on the following dbt packages. These dependencies are installed by default within this package. For more information on the following packages, refer to the [dbt hub](https://hub.getdbt.com/) site.
> IMPORTANT: If you have any of these dependent packages in your own `packages.yml` file, we highly recommend that you remove them from your root `packages.yml` to avoid package version conflicts.
    
```yml
packages:
    - package: fivetran/fivetran_utils
      version: [">=0.4.0", "<0.5.0"]

    - package: dbt-labs/dbt_utils
      version: [">=1.0.0", "<2.0.0"]
```
## How is this package maintained and can I contribute?
### Package Maintenance
The Fivetran team maintaining this package _only_ maintains the latest version of the package. We highly recommend you stay consistent with the [latest version](https://hub.getdbt.com/fivetran/servicenow/latest/) of the package and refer to the [CHANGELOG](https://github.com/fivetran/dbt_servicenow/blob/main/CHANGELOG.md) and release notes for more information on changes across versions.

### Contributions
A small team of analytics engineers at Fivetran develops these dbt packages. However, the packages are made better by community contributions.

We highly encourage and welcome contributions to this package. Check out [this dbt Discourse article](https://discourse.getdbt.com/t/contributing-to-a-dbt-package/657) on the best workflow for contributing to a package.


## Are there any resources available?
- If you have questions or want to reach out for help, see the [GitHub Issue](https://github.com/fivetran/dbt_servicenow/issues/new/choose) section to find the right avenue of support for you.
- If you would like to provide feedback to the dbt package team at Fivetran or would like to request a new dbt package, fill out our [Feedback Form](https://www.surveymonkey.com/r/DQ7K7WW).
