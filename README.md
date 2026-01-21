<!--section="servicenow_transformation_model"-->
# ServiceNow dbt Package

<p align="left">
    <a alt="License"
        href="https://github.com/fivetran/dbt_servicenow/blob/main/LICENSE">
        <img src="https://img.shields.io/badge/License-Apache%202.0-blue.svg" /></a>
    <a alt="dbt-core">
        <img src="https://img.shields.io/badge/dbt_Core™_version->=1.3.0,_<3.0.0-orange.svg" /></a>
    <a alt="Maintained?">
        <img src="https://img.shields.io/badge/Maintained%3F-yes-green.svg" /></a>
    <a alt="PRs">
        <img src="https://img.shields.io/badge/Contributions-welcome-blueviolet" /></a>
    <a alt="Fivetran Quickstart Compatible"
        href="https://fivetran.com/docs/transformations/data-models/quickstart-management#quickstartmanagement">
        <img src="https://img.shields.io/badge/Fivetran_Quickstart_Compatible%3F-yes-green.svg" /></a>
</p>

This dbt package transforms data from Fivetran's Servicenow connector into analytics-ready tables.

## Resources

- Number of materialized models¹: 39
- Connector documentation
  - [ServiceNow connector documentation](https://fivetran.com/docs/connectors/applications/servicenow)
  - [ServiceNow ERD](https://fivetran.com/docs/connectors/applications/servicenow#schemainformation)
- dbt package documentation
  - [GitHub repository](https://github.com/fivetran/dbt_servicenow)
  - [dbt Docs](https://fivetran.github.io/dbt_servicenow/#!/overview)
  - [DAG](https://fivetran.github.io/dbt_servicenow/#!/overview?g_v=1)
  - [Changelog](https://github.com/fivetran/dbt_servicenow/blob/main/CHANGELOG.md)

## What does this dbt package do?
This package enables you to transform core object tables into analytics-ready models and enhance task management data with user information. It creates enriched models with metrics focused on task, problem, change, incident, and change request data.

### Output schema
Final output tables are generated in the following target schema:

```
<your_database>.<connector/schema_name>_servicenow
```

### Final output tables

By default, this package materializes the following final tables:

| Table | Description |
| :---- | :---- |
| [servicenow__activity_summary](https://fivetran.github.io/dbt_servicenow/#!/model/model.servicenow.servicenow__activity_summary) | Aggregates IT service management activity across tasks, problems, changes, and incidents by update date and multiple dimensions (state, priority, impact, urgency) including task counts, averages, and SLA metrics for comprehensive operational visibility. <br></br>**Example Analytics Questions:**<ul><li>How many critical or high-priority tickets are currently open?</li><li>What's our average resolution time for urgent issues compared to normal priority?</li><li>Are we meeting our SLA targets this week across different ticket types?</li></ul>|
| [servicenow__task_enhanced](https://fivetran.github.io/dbt_servicenow/#!/model/model.servicenow.servicenow__task_enhanced) | Tracks tasks with links to related problems, incidents, or change requests, plus comprehensive user activity (opener, assignee, closer), timing metrics, SLA status, and state information to understand task workflows and completion patterns. <br></br>**Example Analytics Questions:**<ul><li>What's our average resolution time for high-priority tickets?</li><li>Do tickets that get reassigned multiple times miss their SLAs?</li><li>Which types of work (incidents, problems, changes) take longest to resolve?</li></ul>|
| [servicenow__problem_enhanced](https://fivetran.github.io/dbt_servicenow/#!/model/model.servicenow.servicenow__problem_enhanced) | Chronicles problems with state, category, user interactions (confirmer, fixer, resolver), timing metrics, known error status, and related task/incident counts to track problem management and resolution effectiveness. <br></br>**Example Analytics Questions:**<ul><li>How quickly are we fixing known errors compared to new problems?</li><li>Which problems are causing the most incidents across our systems?</li><li>Are major problems being resolved faster than minor ones, or are they reopened more often?</li></ul>|
| [servicenow__incident_enhanced](https://fivetran.github.io/dbt_servicenow/#!/model/model.servicenow.servicenow__incident_enhanced) | Provides comprehensive incident records with severity, state, category info, user interactions (caller, resolver, reopener), timing metrics, and problem associations to analyze incident response efficiency and resolution patterns. <br></br>**Example Analytics Questions:**<ul><li>How quickly are critical incidents being resolved compared to lower severity issues?</li><li>Which types of incidents are reopened most often, indicating incomplete resolutions?</li><li>Do incidents with high business impact get resolved faster than their severity level would suggest?</li></ul>|
| [servicenow__change_request_enhanced](https://fivetran.github.io/dbt_servicenow/#!/model/model.servicenow.servicenow__change_request_enhanced) | Tracks change requests with user interaction details, change phases, risk levels, review status, timing metrics, and related task counts to monitor change management processes, approval workflows, and implementation efficiency. <br></br>**Example Analytics Questions:**<ul><li>How long does it take to start implementing changes after they're requested, especially for high-risk changes?</li><li>Which types of changes require the most supporting tasks to complete?</li><li>Are we reviewing and approving changes within our target timeframes?</li></ul>|
| [servicenow__user_aggregated](https://fivetran.github.io/dbt_servicenow/#!/model/model.servicenow.servicenow__user_aggregated) | Summarizes user profiles with group memberships, role assignments, and counts of distinct groups, roles, and included roles to understand team structures, access permissions, and organizational hierarchies. <br></br>**Example Analytics Questions:**<ul><li>Which users have the highest count_distinct_sys_user_role_ids and count_distinct_sys_user_group_ids?</li><li>How are sys_user_role_names distributed across different user groups?</li><li>What is the average count_distinct_included_roles per user by primary role?</li></ul>|
| [servicenow__user_enhanced](https://fivetran.github.io/dbt_servicenow/#!/model/model.servicenow.servicenow__user_enhanced) | Provides detailed user profiles enriched with group memberships, role assignments, personal info, department, manager, company details, and activity status to enable user-level analysis and access management reporting. <br></br>**Example Analytics Questions:**<ul><li>Which users have the most role assignments (count_distinct_sys_user_role_ids) by department_value?</li><li>How are active versus inactive users (is_active) distributed across companies and departments?</li><li>What is the relationship between manager_name hierarchies and role assignments?</li></ul>|

¹ Each Quickstart transformation job run materializes these models if all components of this data model are enabled. This count includes all staging, intermediate, and final models materialized as `view`, `table`, or `incremental`.

---

## Prerequisites
To use this dbt package, you must have the following:

- At least one Fivetran ServiceNow connection syncing data into your destination.
- A **BigQuery**, **Snowflake**, **Redshift**, **Databricks**, or **PostgreSQL** destination.

## How do I use the dbt package?
You can either add this dbt package in the Fivetran dashboard or import it into your dbt project:

- To add the package in the Fivetran dashboard, follow our [Quickstart guide](https://fivetran.com/docs/transformations/data-models/quickstart-management#quickstartmanagement).
- To add the package to your dbt project, follow the setup instructions in the dbt package's [README file](https://github.com/fivetran/dbt_servicenow/blob/main/README.md#how-do-i-use-the-dbt-package) to use this package.

<!--section-end-->

### Install the package
Include the following ServiceNow package version in your `packages.yml` file:
> TIP: Check [dbt Hub](https://hub.getdbt.com/) for the latest installation instructions or [read the dbt docs](https://docs.getdbt.com/docs/package-management) for more information on installing packages.
```yml
packages:
  - package: fivetran/servicenow
    version: [">=0.8.0", "<0.9.0"] # we recommend using ranges to capture non-breaking changes automatically
```

#### Databricks dispatch configuration
If you are using a Databricks destination with this package, you must add the following (or a variation of the following) dispatch configuration within your `dbt_project.yml`. This is required in order for the package to accurately search for macros within the `dbt-labs/spark_utils` then the `dbt-labs/dbt_utils` packages respectively.
```yml
dispatch:
  - macro_namespace: dbt_utils
    search_order: ['spark_utils', 'dbt_utils']
```

### Define database and schema variables
#### Single connection
By default, this package runs using your destination and the `servicenow` schema. If this is not where your ServiceNow data is (for example, if your ServiceNow schema is named `servicenow_fivetran`), add the following configuration to your root `dbt_project.yml` file:

```yml
# dbt_project.yml

vars:
    servicenow_database: your_database_name
    servicenow_schema: your_schema_name
```
#### Union multiple connections
If you have multiple ServiceNow connections in Fivetran and would like to use this package on all of them simultaneously, we have provided functionality to do so. The package will union all of the data together and pass the unioned table into the transformations. You will be able to see which source it came from in the `source_relation` column of each model. To use this functionality, you will need to set either the `servicenow_union_schemas` OR `servicenow_union_databases` variables (cannot do both) in your root `dbt_project.yml` file:

```yml
# dbt_project.yml

vars:
    servicenow_union_schemas: ['servicenow_usa','servicenow_canada'] # use this if the data is in different schemas/datasets of the same database/project
    servicenow_union_databases: ['servicenow_usa','servicenow_canada'] # use this if the data is in different databases/projects but uses the same schema name
```

> NOTE: The native `source.yml` connection set up in the package will not function when the union schema/database feature is utilized. Although the data will be correctly combined, you will not observe the sources linked to the package models in the Directed Acyclic Graph (DAG). This happens because the package includes only one defined `source.yml`.

To connect your multiple schema/database sources to the package models, follow the steps outlined in the [Union Data Defined Sources Configuration](https://github.com/fivetran/dbt_fivetran_utils/tree/releases/v0.4.latest#union_data-source) section of the Fivetran Utils documentation for the union_data macro. This will ensure a proper configuration and correct visualization of connections in the DAG.

### (Optional) Additional configurations

#### Enable/Disable the User End Models
Our user grain models are enabled by default, but we do understand that not everyone syncs the underlying tables: `sys_user_role`, `sys_user_has_role`, and `sys_user_grmember`. If these tables do not exist in your schema, set this following variable `servicenow__using_roles` to False in order to disable the end models `servicenow__user_aggregated` and `servicenow__user_enhanced`.

```yml
# dbt_project.yml

vars:
    servicenow__using_roles: False # Disable if you are not using user roles
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

### (Optional) Orchestrate your models with Fivetran Transformations for dbt Core™
<details><summary>Expand for details</summary>
<br>

Fivetran offers the ability for you to orchestrate your dbt project through [Fivetran Transformations for dbt Core™](https://fivetran.com/docs/transformations/dbt#transformationsfordbtcore). Learn how to set up your project for orchestration through Fivetran in our [Transformations for dbt Core setup guides](https://fivetran.com/docs/transformations/dbt/setup-guide#transformationsfordbtcoresetupguide).
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

<!--section="servicenow_maintenance"-->
## How is this package maintained and can I contribute?

### Package Maintenance
The Fivetran team maintaining this package only maintains the [latest version](https://hub.getdbt.com/fivetran/servicenow/latest/) of the package. We highly recommend you stay consistent with the latest version of the package and refer to the [CHANGELOG](https://github.com/fivetran/dbt_servicenow/blob/main/CHANGELOG.md) and release notes for more information on changes across versions.

### Contributions
A small team of analytics engineers at Fivetran develops these dbt packages. However, the packages are made better by community contributions.

We highly encourage and welcome contributions to this package. Learn how to contribute to a package in dbt's [Contributing to an external dbt package article](https://discourse.getdbt.com/t/contributing-to-a-dbt-package/657).

### Opinionated Modelling Decisions

ServiceNow tables can be complex, for example exhibiting many-to-many relationships. For more information on table relationships and how they informed our model development, you may refer to the [DECISIONLOG](https://github.com/fivetran/dbt_servicenow/blob/main/DECISIONLOG.md).

<!--section-end-->

## Are there any resources available?
- If you have questions or want to reach out for help, see the [GitHub Issue](https://github.com/fivetran/dbt_servicenow/issues/new/choose) section to find the right avenue of support for you.
- If you would like to provide feedback to the dbt package team at Fivetran or would like to request a new dbt package, fill out our [Feedback Form](https://www.surveymonkey.com/r/DQ7K7WW).