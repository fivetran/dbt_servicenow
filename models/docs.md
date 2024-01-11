{% docs stg_servicenow__task %}
Staging table containing all tasks related information. A task represents a unit of work that needs to be accomplished or tracked within the ServiceNow system. It can be related to various processes, such as incident resolution, change management, or other workflows.
{% enddocs %}

{% docs task %}
Table containing all tasks related information. A task represents a unit of work that needs to be accomplished or tracked within the ServiceNow system. It can be related to various processes, such as incident resolution, change management, or other workflows.
{% enddocs %}

{% docs stg_servicenow__problem %}
Staging table containing all problem information.
{% enddocs %}

{% docs problem %}
Table containing all problem information.
{% enddocs %}

{% docs stg_servicenow__task_sla %}
Staging table containing all Service Level Agreement (SLA) information related to the task.
{% enddocs %}

{% docs task_sla %}
Table containing all Service Level Agreement (SLA) information related to the task.
{% enddocs %}

{% docs stg_servicenow__sys_user %}
Staging table containing all information related to the system user associated with the task.
{% enddocs %}

{% docs sys_user %}
Table containing all information related to the system user associated with the task.
{% enddocs %}

{% docs stg_servicenow__problem_task %} 
Staging table containing all the information related to the problem tasks.  
{% enddocs %}

{% docs problem_task %} 
Table containing all the information related to the problem tasks.  
{% enddocs %}

{% docs stg_servicenow__incident %} 
Staging table containing all information related to incidents.
{% enddocs %}

{% docs incident %} 
Table containing all information related to incidents.
{% enddocs %}

{% docs stg_servicenow__change_task %} 
Staging table containing all information related to change tasks.
{% enddocs %}

{% docs change_task %} 
Table containing all information related to change tasks.
{% enddocs %}

{% docs stg_servicenow__change_request %} 
Staging table that contains all information related to change requests.
{% enddocs %}

{% docs change_request %} 
Table that contains all information related to change requests.
{% enddocs %}

{% docs _fivetran_deleted %}
Indicates whether the task record has been marked as deleted by the Fivetran connector.
{% enddocs %}

{% docs _fivetran_synced %}
Indicates whether the task record has been synchronized by the Fivetran connector.
{% enddocs %}

{% docs source_relation %}
Indicates the schema which the field originated. This is especially important when leveraging the union schema feature.
{% enddocs %}

{% docs active %}
Flag indicating whether the task is currently active or completed.
{% enddocs %}

{% docs is_task_active %}
Flag indicating whether the task is currently active or completed.
{% enddocs %}

{% docs is_active %}
Flag indicating whether the record is currently active.
{% enddocs %}

{% docs activity_due %}
The due date or time for completing the activity associated with the task.
{% enddocs %}

{% docs additional_assignee_list %}
List of additional users or assignees associated with the task.
{% enddocs %}

{% docs approval %}
Information related to the approval status and process for the task.
{% enddocs %}

{% docs approval_history %}
History of approvals associated with the task.
{% enddocs %}

{% docs approval_set %}
Set of approvals linked to the task.
{% enddocs %}

{% docs assigned_to_link %}
Link to the user or group assigned to the task.
{% enddocs %}

{% docs assigned_to_value %}
Value representing the user or group assigned to the task.
{% enddocs %}

{% docs assignment_group_link %}
Link to the assignment group associated with the task.
{% enddocs %}

{% docs assignment_group_value %}
Value representing the assignment group associated with the task.
{% enddocs %}

{% docs business_duration %}
The duration of the task in terms of business hours.
{% enddocs %}

{% docs business_service_link %}
Link to the business service associated with the task.
{% enddocs %}

{% docs business_service_value %}
Value representing the business service associated with the task.
{% enddocs %}

{% docs calendar_duration %}
The duration of the task in terms of calendar time.
{% enddocs %}

{% docs close_notes %}
Additional notes or comments recorded upon task closure.
{% enddocs %}

{% docs closed_at %}
Date and time when the task was closed or completed.
{% enddocs %}

{% docs closed_by_link %}
Link to the user who closed or completed the task.
{% enddocs %}

{% docs closed_by_value %}
Value representing the user who closed or completed the task.
{% enddocs %}

{% docs cmdb_ci_link %}
Link to the configuration item (CI) associated with the task in the Configuration Management Database (CMDB).
{% enddocs %}

{% docs cmdb_ci_value %}
Value representing the configuration item (CI) associated with the task.
{% enddocs %}

{% docs comments %}
General comments or notes related to the task.
{% enddocs %}

{% docs comments_and_work_notes %}
Combined information of comments and work notes recorded during the task's lifecycle.
{% enddocs %}

{% docs company_link %}
Link to the company associated with the task.
{% enddocs %}

{% docs company_value %}
Value representing the company associated with the task.
{% enddocs %}

{% docs contact_type %}
Type of contact associated with the task (e.g., customer, vendor).
{% enddocs %}

{% docs contract_link %}
Link to the contract associated with the task.
{% enddocs %}

{% docs contract_value %}
Value representing the contract associated with the task.
{% enddocs %}

{% docs correlation_display %}
Display information related to correlation of the task with other records.
{% enddocs %}

{% docs correlation_id %}
Identifier used for correlating the task with related records.
{% enddocs %}

{% docs delivery_plan_link %}
Link to the delivery plan associated with the task.
{% enddocs %}

{% docs delivery_plan_value %}
Value representing the delivery plan associated with the task.
{% enddocs %}

{% docs delivery_task_link %}
Link to the delivery task associated with the task.
{% enddocs %}

{% docs delivery_task_value %}
Value representing the delivery task associated with the task.
{% enddocs %}

{% docs description %}
Detailed description or information about the task.
{% enddocs %}

{% docs task_description %}
Detailed description or information about the task.
{% enddocs %}

{% docs due_date %}
The date by which the task is expected to be completed.
{% enddocs %}

{% docs task_due_date_at %}
The date by which the task is expected to be completed.
{% enddocs %}

{% docs escalation %}
Information about any escalation procedures or steps related to the task.
{% enddocs %}

{% docs expected_start %}
The expected start date or time for the task.
{% enddocs %}

{% docs follow_up %}
Timestamp of when follow up was applied to the task.
{% enddocs %}

{% docs task_follow_up_at %}
Timestamp of when follow up was applied to the task.
{% enddocs %}

{% docs group_list %}
List of groups associated with the task.
{% enddocs %}

{% docs impact %}
Assessment of the impact that completing or not completing the task may have.
{% enddocs %}

{% docs knowledge %}
Indication of whether the task is associated with knowledge or documentation.
{% enddocs %}

{% docs location_link %}
Link to the location associated with the task.
{% enddocs %}

{% docs location_value %}
Value representing the location associated with the task.
{% enddocs %}

{% docs made_sla %}
Indicates whether the task was completed within the agreed-upon Service Level Agreement (SLA).
{% enddocs %}

{% docs number %}
Unique identifier or reference number assigned to the task.
{% enddocs %}

{% docs task_number %}
Unique identifier or reference number assigned to the task.
{% enddocs %}

{% docs opened_at %}
Date and time when the task was initially opened.
{% enddocs %}

{% docs task_opened_at %}
Date and time when the task was initially opened.
{% enddocs %}

{% docs opened_by_link %}
Link to the user who initially opened the task.
{% enddocs %}

{% docs opened_by_value %}
Value representing the user who initially opened the task.
{% enddocs %}

{% docs order %}
Order or sequence number associated with the task.
{% enddocs %}

{% docs task_order %}
Order or sequence number associated with the task.
{% enddocs %}

{% docs parent_link %}
Link to the parent task or record associated with the task.
{% enddocs %}

{% docs parent_value %}
Value representing the parent task or record associated with the task.
{% enddocs %}

{% docs priority %}
Priority level assigned to the task.
{% enddocs %}

{% docs reassignment_count %}
Count of how many times the task has been reassigned.
{% enddocs %}

{% docs rejection_goto_link %}
Link to the record or step to be followed in case of task rejection.
{% enddocs %}

{% docs rejection_goto_value %}
Value representing the record or step to be followed in case of task rejection.
{% enddocs %}

{% docs route_reason %}
Reason or criteria for routing the task to a particular user or group.
{% enddocs %}

{% docs service_offering_link %}
Link to the service offering associated with the task.
{% enddocs %}

{% docs service_offering_value %}
Value representing the service offering associated with the task.
{% enddocs %}

{% docs short_description %}
Brief or concise summary of the task.
{% enddocs %}

{% docs sla_due %}
Date and time by which the task is expected to meet the Service Level Agreement (SLA).
{% enddocs %}

{% docs state %}
Current state or status of the task (e.g., in progress, on hold, closed).
{% enddocs %}

{% docs task_state %}
Current state or status of the task (e.g., in progress, on hold, closed).
{% enddocs %}

{% docs sys_class_name %}
Name of the table in which the record is stored.
{% enddocs %}

{% docs sys_created_by %}
User who initially created the record.
{% enddocs %}

{% docs sys_created_on %}
Date and time when the record was initially created.
{% enddocs %}

{% docs created_at %}
Date and time when the record was initially created.
{% enddocs %}

{% docs updated_at %}
Date and time when the record was last updated.
{% enddocs %}

{% docs change_task_created_at %}
Date and time when the change task record was initially created.
{% enddocs %}

{% docs change_task_updated_at %}
Date and time when the change task record was last updated.
{% enddocs %}

{% docs incident_created_at %}
Date and time when the incident record was initially created.
{% enddocs %}

{% docs incident_updated_at %}
Date and time when the incident record was last updated.
{% enddocs %}

{% docs problem_created_at %}
Date and time when the problem record was initially created.
{% enddocs %}

{% docs problem_updated_at %}
Date and time when the problem record was last updated.
{% enddocs %}

{% docs problem_task_created_at %}
Date and time when the problem task record was initially created.
{% enddocs %}

{% docs problem_task_updated_at %}
Date and time when the problem task record was last updated.
{% enddocs %}

{% docs user_created_at %}
Date and time when the user record was initially created.
{% enddocs %}

{% docs user_updated_at %}
Date and time when the user record was last updated.
{% enddocs %}

{% docs task_created_at %}
Date and time when the task record was initially created.
{% enddocs %}

{% docs task_updated_at %}
Date and time when the task record was last updated.
{% enddocs %}

{% docs task_sla_created_at %}
Date and time when the task sla record was initially created.
{% enddocs %}

{% docs task_sla_updated_at %}
Date and time when the task sla record was last updated.
{% enddocs %}

{% docs sys_domain_link %}
Link to the system domain associated with the task.
{% enddocs %}

{% docs sys_domain_path %}
Path of the system domain associated with the task.
{% enddocs %}

{% docs sys_domain_value %}
Value representing the system domain associated with the task.
{% enddocs %}

{% docs sys_id %}
Unique identifier for the record.
{% enddocs %}

{% docs sys_mod_count %}
Number of times the record has been modified.
{% enddocs %}

{% docs sys_updated_by %}
User who last updated or modified the record.
{% enddocs %}

{% docs sys_updated_on %}
Date and time when the record was last updated.
{% enddocs %}

{% docs task_effective_number %}
Effective number or identifier associated with the task.
{% enddocs %}

{% docs universal_request_link %}
Link to the universal request associated with the task.
{% enddocs %}

{% docs universal_request_value %}
Value representing the universal request associated with the task.
{% enddocs %}

{% docs upon_approval %}
Actions or steps to be taken upon the approval of the task.
{% enddocs %}

{% docs upon_reject %}
Actions or steps to be taken upon the rejection of the task.
{% enddocs %}

{% docs urgency %}
Level of urgency associated with the task.
{% enddocs %}

{% docs watch_list %}
List of users or groups who are monitoring or "watching" the task.
{% enddocs %}

{% docs wf_activity_link %}
Link to the workflow activity associated with the task.
{% enddocs %}

{% docs wf_activity_value %}
Value representing the workflow activity associated with the task.
{% enddocs %}

{% docs work_end %}
Date and time when the work on the task is scheduled to end.
{% enddocs %}

{% docs work_notes %}
Notes or comments recorded during the work on the task.
{% enddocs %}

{% docs work_notes_list %}
List of work notes recorded during the task's lifecycle.
{% enddocs %}

{% docs work_start %}
Date and time when the work on the task is scheduled to start.
{% enddocs %}

{% docs business_pause_duration %}
Duration of business pause associated with the task.
{% enddocs %}

{% docs business_percentage %}
Percentage of business time completed for the task.
{% enddocs %}

{% docs business_time_left %}
Remaining business time for the completion of the task.
{% enddocs %}

{% docs duration %}
Total duration of the task, including both business and non-business time.
{% enddocs %}

{% docs end_time %}
The scheduled or expected end time for the task.
{% enddocs %}

{% docs has_breached %}
Indicates whether the task has breached the defined SLA or time limits.
{% enddocs %}

{% docs original_breach_time %}
Original time when the SLA breach for the task was detected.
{% enddocs %}

{% docs pause_duration %}
Duration of the pause associated with the task.
{% enddocs %}

{% docs pause_time %}
Time when the task was paused or put on hold.
{% enddocs %}

{% docs percentage %}
Percentage of total time completed for the task.
{% enddocs %}

{% docs planned_end_time %}
The originally planned or expected end time for the task.
{% enddocs %}

{% docs schedule_link %}
Link to the schedule associated with the task.
{% enddocs %}

{% docs schedule_value %}
Value representing the schedule associated with the task.
{% enddocs %}

{% docs sla_link %}
Link to the Service Level Agreement (SLA) associated with the task.
{% enddocs %}

{% docs sla_value %}
Value representing the Service Level Agreement (SLA) associated with the task.
{% enddocs %}

{% docs stage %}
Current stage or phase of the task's lifecycle.
{% enddocs %}

{% docs start_time %}
The scheduled or expected start time for the task.
{% enddocs %}

{% docs task_link %}
Link to the related task record.
{% enddocs %}

{% docs task_value %}
Value representing the related task record.
{% enddocs %}

{% docs time_left %}
Remaining time for the completion of the task.
{% enddocs %}

{% docs timezone %}
Timezone information associated with the task.
{% enddocs %}

{% docs accumulated_roles %}
Roles accumulated or associated with the system user over time.
{% enddocs %}

{% docs avatar %}
Avatar or profile picture associated with the system user.
{% enddocs %}

{% docs building_link %}
Link to the building associated with the system user.
{% enddocs %}

{% docs building_value %}
Value representing the building associated with the system user.
{% enddocs %}

{% docs calendar_integration %}
Information about the integration of the user's calendar with the ServiceNow system.
{% enddocs %}

{% docs city %}
City information associated with the record.
{% enddocs %}

{% docs cost_center_link %}
Link to the cost center associated with the system user.
{% enddocs %}

{% docs cost_center_value %}
Value representing the cost center associated with the system user.
{% enddocs %}

{% docs country %}
Country information associated with the record.
{% enddocs %}

{% docs date_format %}
The format in which dates are displayed or recorded for the system user.
{% enddocs %}

{% docs default_perspective_link %}
Link to the default perspective associated with the system user.
{% enddocs %}

{% docs default_perspective_value %}
Value representing the default perspective associated with the system user.
{% enddocs %}

{% docs department_link %}
Link to the department associated with the system user.
{% enddocs %}

{% docs department_value %}
Value representing the department associated with the system user.
{% enddocs %}

{% docs edu_status %}
Education status or level associated with the system user.
{% enddocs %}

{% docs email %}
Email address associated with the system user.
{% enddocs %}

{% docs employee_number %}
Employee number or identifier associated with the system user.
{% enddocs %}

{% docs enable_multifactor_authn %}
Indication of whether multifactor authentication is enabled for the system user.
{% enddocs %}

{% docs failed_attempts %}
Number of failed login attempts for the system user.
{% enddocs %}

{% docs first_name %}
First name of the system user.
{% enddocs %}

{% docs gender %}
Gender information associated with the system user.
{% enddocs %}

{% docs hashed_user_id %}
Hashed identifier associated with the system user.
{% enddocs %}

{% docs home_phone %}
Home phone number associated with the system user.
{% enddocs %}

{% docs internal_integration_user %}
Indication of whether the system user is an internal integration user.
{% enddocs %}

{% docs introduction %}
Introduction or bio information associated with the system user.
{% enddocs %}

{% docs last_login %}
Date and time of the last login.
{% enddocs %}

{% docs last_login_day_date %}
Date and time of the last login.
{% enddocs %}

{% docs last_login_device %} 
The device used for the user's last login to the system. 
{% enddocs %}

{% docs last_login_time %} 
The specific time when the user last logged in to the system. 
{% enddocs %}

{% docs last_login_at %} 
The specific time when the user last logged in to the system. 
{% enddocs %}

{% docs last_name %} 
The family name or surname of the user. 
{% enddocs %}

{% docs last_password %} 
The timestamp or information related to the user's last password update. 
{% enddocs %}

{% docs ldap_server_link %} 
A link to the LDAP (Lightweight Directory Access Protocol) server associated with the user. 
{% enddocs %}

{% docs ldap_server_value %} 
The value or name of the LDAP server associated with the user. 
{% enddocs %}

{% docs locked_out %} 
Information about whether the user account is currently locked. 
{% enddocs %}

{% docs manager_link %} 
A link to the user's manager or supervisor in the organizational hierarchy. 
{% enddocs %}

{% docs manager_value %} 
The name or identifier of the user's manager or supervisor. 
{% enddocs %}

{% docs middle_name %} 
The middle name or initial of the user. 
{% enddocs %}

{% docs mobile_phone %} 
The contact number for the user's mobile phone. 
{% enddocs %}

{% docs name %} 
The full name of the record.
{% enddocs %}

{% docs sys_user_name %} 
The system username or identifier for the user. 
{% enddocs %}

{% docs notification %} 
Information related to user notifications or alerts. 
{% enddocs %}

{% docs password_needs_reset %} 
Indicates whether the user needs to reset their password. 
{% enddocs %}

{% docs phone %} 
The contact number belonging to this record. 
{% enddocs %}

{% docs photo %} 
A link or reference to the user's profile photo. 
{% enddocs %}

{% docs preferred_language %} 
The language preference set by the user. 
{% enddocs %}

{% docs roles %} 
The roles assigned to the user in the system or organization. 
{% enddocs %}

{% docs source %} 
The source or origin of the user's profile information. 
{% enddocs %}

{% docs time_format %} 
The preferred time format for the user (e.g., 12-hour or 24-hour). 
{% enddocs %}

{% docs time_zone %} 
The time zone configured for the user. 
{% enddocs %}

{% docs title %} 
The job title or position of the user within the organization. 
{% enddocs %}

{% docs user_name %} 
The username used by the user to log in to the system. 
{% enddocs %}

{% docs user_password %} 
The user's current password information or status. 
{% enddocs %}

{% docs vip %} 
Indicates whether the user has VIP (Very Important Person) status. 
{% enddocs %}

{% docs web_service_access_only %} 
Indicates whether the user has access only through web services. 
{% enddocs %}

{% docs zip %} 
The postal code or ZIP code associated with the record.
{% enddocs %}

{% docs cause_notes %} 
Additional notes or details about the cause of a particular issue or incident. 
{% enddocs %}

{% docs confirmed_at %} 
The timestamp indicating when an issue or incident was confirmed or acknowledged. 
{% enddocs %}

{% docs problem_confirmed_at %} 
The timestamp indicating when the problem was confirmed or acknowledged. 
{% enddocs %}

{% docs confirmed_by_link %} 
A link to the person or entity who confirmed or acknowledged the issue. 
{% enddocs %}

{% docs problem_confirmed_by_link %} 
A link to the person or entity who confirmed or acknowledged the problem. 
{% enddocs %}

{% docs confirmed_by_value %} 
The name or identifier of the person or entity who confirmed or acknowledged the issue. 
{% enddocs %}

{% docs problem_confirmed_by_value %} 
The name or identifier of the person or entity who confirmed or acknowledged the problem. 
{% enddocs %}

{% docs duplicate_of_link %} 
A link to the related issue that is identified as a duplicate of the current one. 
{% enddocs %}

{% docs duplicate_of_value %} 
The name or identifier of the related issue that is identified as a duplicate. 
{% enddocs %}

{% docs first_reported_by_task_link %} 
A link to the task or activity that first reported the issue. 
{% enddocs %}

{% docs problem_first_reported_by_task_link %} 
A link to the task or activity that first reported the problem. 
{% enddocs %}

{% docs first_reported_by_task_value %} 
The name or identifier of the task or activity that first reported the issue. 
{% enddocs %}

{% docs problem_first_reported_by_task_value %} 
The name or identifier of the task or activity that first reported the problem. 
{% enddocs %}

{% docs fix_at %} 
The timestamp indicating when the issue is scheduled or planned to be fixed. 
{% enddocs %}

{% docs problem_fix_at %} 
The timestamp indicating when the problem is scheduled or planned to be fixed. 
{% enddocs %}

{% docs fix_by_link %} 
A link to the person or entity responsible for fixing the issue. 
{% enddocs %}

{% docs problem_fix_by_link %} 
A link to the person or entity responsible for fixing the problem. 
{% enddocs %}

{% docs fix_by_value %} 
The name or identifier of the person or entity responsible for fixing the issue. 
{% enddocs %}

{% docs problem_fix_by_value %} 
The name or identifier of the person or entity responsible for fixing the problem. 
{% enddocs %}

{% docs fix_communicated_at %} 
The timestamp indicating when the fix for the issue was communicated. 
{% enddocs %}

{% docs fix_communicated_by_link %} 
A link to the person or entity who communicated the fix for the issue. 
{% enddocs %}

{% docs fix_communicated_by_value %} 
The name or identifier of the person or entity who communicated the fix for the issue. 
{% enddocs %}

{% docs fix_notes %} 
Additional notes or details related to the fix for the issue. 
{% enddocs %}

{% docs problem_fix_notes %} 
Additional notes or details related to the fix for the problem. 
{% enddocs %}

{% docs known_error %} 
Indicates whether the issue is a known error with a documented resolution. 
{% enddocs %}

{% docs is_known_error %} 
Indicates whether the issue is a known error with a documented resolution.
{% enddocs %}

{% docs major_problem %} 
Indicates whether the issue is categorized as a major problem. 
{% enddocs %}

{% docs is_major_problem %} 
Indicates whether the issue is categorized as a major problem. 
{% enddocs %}

{% docs problem_state %} 
The current state or status of the problem or issue. 
{% enddocs %}

{% docs related_incidents %} 
Information about other incidents that are related to the current issue. 
{% enddocs %}

{% docs problem_related_incidents %} 
Information about other incidents that are related to the current problem. 
{% enddocs %}

{% docs reopen_count %} 
The count of how many times the issue has been reopened. 
{% enddocs %}

{% docs reopened_at %} 
The timestamp indicating when the issue was last reopened. 
{% enddocs %}

{% docs reopened_by_link %} 
A link to the person or entity who reopened the issue. 
{% enddocs %}

{% docs reopened_by_value %} 
The name or identifier of the person or entity who reopened the issue. 
{% enddocs %}

{% docs resolution_code %} 
The code or identifier associated with the resolution of the issue. 
{% enddocs %}

{% docs problem_resolution_code %} 
The code or identifier associated with the resolution of the problem. 
{% enddocs %}

{% docs resolved_at %} 
The timestamp indicating when the issue was resolved. 
{% enddocs %}

{% docs problem_resolved_at %} 
The timestamp indicating when the problem was resolved. 
{% enddocs %}

{% docs resolved_by_link %} 
A link to the person or entity who resolved the issue. 
{% enddocs %}

{% docs resolved_by_value %} 
The name or identifier of the person or entity who resolved the issue. 
{% enddocs %}

{% docs problem_resolved_by_value %} 
The name or identifier of the person or entity who resolved the problem. 
{% enddocs %}

{% docs review_outcome %} 
The outcome or result of the review process for the issue. 
{% enddocs %}

{% docs rfc_link %} 
A link to the Request for Change (RFC) associated with the issue or incident. 
{% enddocs %}

{% docs rfc_value %} 
The unique identifier or name associated with the Request for Change (RFC) linked to the issue. 
{% enddocs %}

{% docs problem_rfc_value %} 
The unique identifier or name associated with the Request for Change (RFC) linked to the problem. 
{% enddocs %}

{% docs subcategory %} 
The specific subcategory or classification of the issue, providing more detailed information about its nature. 
{% enddocs %}

{% docs problem_subcategory %} 
The specific subcategory or classification of the issue, providing more detailed information about its nature. 
{% enddocs %}

{% docs workaround %} 
A description of a temporary or alternative solution that can be applied to address the issue before a permanent fix 
is implemented. {% enddocs %}

{% docs workaround_applied %} 
Indicates whether a workaround has been applied to address the issue. 
{% enddocs %}

{% docs workaround_communicated_at %} 
The timestamp indicating when the workaround for the issue was communicated. 
{% enddocs %}

{% docs workaround_communicated_by_link %} 
A link to the person or entity who communicated the workaround for the issue. 
{% enddocs %}

{% docs workaround_communicated_by_value %} 
The name or identifier of the person or entity who communicated the workaround for the issue. 
{% enddocs %}

{% docs cause_code %} 
The code or identifier associated with the cause of the issue or problem. 
{% enddocs %}

{% docs problem_task_cause_code %} 
The code or identifier associated with the cause of the issue or problem. 
{% enddocs %}

{% docs close_code %} 
The code or identifier associated with the closure or resolution. 
{% enddocs %}

{% docs problem_task_close_code %} 
The code or identifier associated with the closure or resolution of the problem task. 
{% enddocs %}

{% docs change_task_close_code %} 
The code or identifier associated with the closure or resolution of the change task. 
{% enddocs %}

{% docs change_request_close_code %} 
The code or identifier associated with the closure or resolution of the change request. 
{% enddocs %}

{% docs other_reason %} 
Additional information or reasons associated with the issue, especially if it falls outside standard categories. 
{% enddocs %}

{% docs problem_link %} 
A link to the problem record associated with the issue or incident. 
{% enddocs %}

{% docs problem_task_type %} 
The type or category of the task associated with the problem or issue. 
{% enddocs %}

{% docs problem_value %} 
The unique identifier or name associated with the problem record linked to the issue. 
{% enddocs %}

{% docs started_at %} 
The timestamp indicating when the issue or incident was initiated or started. 
{% enddocs %}

{% docs problem_task_started_at %} 
The timestamp indicating when the issue or incident was initiated or started. 
{% enddocs %}

{% docs started_by_link %} 
A link to the person or entity who initiated or started the issue or incident. 
{% enddocs %}

{% docs started_by_value %} 
The name or identifier of the person or entity who initiated or started the issue or incident. 
{% enddocs %}

{% docs vendor_link %} 
A link to the vendor or external entity associated with the issue or incident. 
{% enddocs %}

{% docs vendor_value %} 
The name or identifier of the vendor or external entity linked to the issue or incident. 
{% enddocs %}

{% docs business_impact %} 
Information about the impact of the issue on business operations or services. 
{% enddocs %}

{% docs business_stc %} 
The business service that is impacted by the issue or incident. 
{% enddocs %}

{% docs calendar_stc %} 
The calendar or schedule associated with the business service impacted by the issue. 
{% enddocs %}

{% docs caller_id_link %} 
A link to the person or entity identified as the caller or reporter of the issue or incident. 
{% enddocs %}

{% docs caller_id_value %} 
The name or identifier of the person or entity identified as the caller or reporter of the issue. 
{% enddocs %}

{% docs cause %} 
A description or explanation of the root cause of the issue or incident. 
{% enddocs %}

{% docs caused_by_link %} 
A link to the record or entity that caused or triggered the issue or incident. 
{% enddocs %}

{% docs caused_by_value %} 
The name or identifier of the record or entity that caused or triggered the issue or incident. 
{% enddocs %}

{% docs child_incidents %} 
Information about other incidents that are identified as child incidents linked to the current incident. 
{% enddocs %}

{% docs hold_reason %} 
The reason or rationale for placing the issue or incident on hold. 
{% enddocs %}

{% docs incident_state %} 
The current state or status of the incident. 
{% enddocs %}

{% docs notify %} 
Indicates whether notifications or alerts have been configured for the issue or incident. 
{% enddocs %}

{% docs origin_id_link %} 
A link to the original or source record from which the current record originated. 
{% enddocs %}

{% docs origin_id_value %} 
The unique identifier or name associated with the original or source record linked to the current record. 
{% enddocs %}

{% docs parent_incident_link %} 
A link to the parent incident record, indicating the incident from which the current incident is derived or related. 
{% enddocs %}

{% docs parent_incident_value %} 
The unique identifier or name associated with the parent incident record linked to the current incident. 
{% enddocs %}

{% docs problem_id_link %} 
A link to the problem record associated with the current issue or incident. 
{% enddocs %}

{% docs problem_id_value %} 
The unique identifier or name associated with the problem record linked to the current issue or incident. 
{% enddocs %}

{% docs reopened_time %} 
The timestamp indicating when the issue or incident was reopened after being previously resolved. 
{% enddocs %}

{% docs severity %} 
The level of impact or seriousness assigned to the issue or incident. 
{% enddocs %}

{% docs change_request_link %} 
A link to the change request record associated with the issue or incident. 
{% enddocs %}

{% docs change_request_value %} 
The unique identifier or name associated with the change request record linked to the issue or incident. 
{% enddocs %}

{% docs change_task_type %} 
The type or category of the task associated with the change request or change record. 
{% enddocs %}

{% docs created_from %} 
Information about the source or origin of the current record, indicating how it was created or generated. 
{% enddocs %}

{% docs change_task_created_from %} 
Information about the source or origin of the current record, indicating how it was created or generated. 
{% enddocs %}

{% docs on_hold %} 
Indicates whether the issue or incident is currently on hold or paused. 
{% enddocs %}

{% docs is_change_on_hold %} 
Indicates whether the change task is currently on hold or paused. 
{% enddocs %}

{% docs is_change_request_on_hold %} 
Indicates whether the change is currently on hold or paused. 
{% enddocs %}

{% docs on_hold_reason %} 
The reason or rationale for placing the associated record on hold. 
{% enddocs %}

{% docs change_task_on_hold_reason %} 
The reason or rationale for placing the change task on hold. 
{% enddocs %}

{% docs change_request_on_hold_reason %} 
The reason or rationale for placing the change on hold. 
{% enddocs %}

{% docs planned_end_date %} 
The planned or scheduled end date for the change request or change record. 
{% enddocs %}

{% docs change_task_planned_end_date %} 
The planned or scheduled end date for the change request or change record. 
{% enddocs %}

{% docs planned_start_date %} 
The planned or scheduled start date for the change request or change record. 
{% enddocs %}

{% docs change_task_planned_start_date %} 
The planned or scheduled start date for the change request or change record. 
{% enddocs %}

{% docs backout_plan %} 
Information about the plan or process for backing out or undoing the changes associated with the current record. 
{% enddocs %}

{% docs cab_date %} 
The date of the Change Advisory Board (CAB) meeting associated with the change request or change record. 
{% enddocs %}

{% docs cab_date_time %} 
The date and time of the Change Advisory Board (CAB) meeting associated with the change request or change record. 
{% enddocs %}

{% docs cab_delegate_link %} 
A link to the person or entity delegated to represent or act on behalf of the Change Advisory Board (CAB) in relation 
to the change request. {% enddocs %}

{% docs cab_delegate_value %} 
The name or identifier of the person or entity delegated to represent or act on behalf of the Change Advisory Board (CAB) 
in relation to the change request. {% enddocs %}

{% docs cab_recommendation %} 
The recommendation or decision made by the Change Advisory Board (CAB) regarding the change request. 
{% enddocs %}

{% docs cab_required %} 
Indicates whether the Change Advisory Board (CAB) approval is required for the change request. 
{% enddocs %}

{% docs is_cab_required %} 
Indicates whether the Change Advisory Board (CAB) approval is required for the change request. 
{% enddocs %}

{% docs change_plan %} 
Information about the plan or process for implementing the changes associated with the current record. 
{% enddocs %}

{% docs chg_model_link %} 
A link to the change model or template associated with the change request or change record. 
{% enddocs %}

{% docs chg_model_value %} 
The name or identifier of the change model or template linked to the change request or change record. 
{% enddocs %}

{% docs conflict_last_run %} 
The timestamp indicating when the conflict detection was last run for the change request or change record. 
{% enddocs %}

{% docs conflict_status %} 
The status or outcome of the conflict detection process for the change request or change record. 
{% enddocs %}

{% docs end_date %} 
The end date for the implementation or execution associated with the current record. 
{% enddocs %}

{% docs change_end_date %} 
The end date for the change or execution of the changes associated with the current record. 
{% enddocs %}

{% docs implementation_plan %} 
Information about the plan or process for implementing the changes associated with the current record. 
{% enddocs %}

{% docs change_implementation_plan %} 
Information about the plan or process for implementing the changes associated with the current record. 
{% enddocs %}

{% docs justification %} 
The reasoning or justification behind the changes associated with the current record, providing context or explanation for the modifications made. 
{% enddocs %}

{% docs change_justification %} 
The reasoning or justification behind the changes associated with the current record, providing context or explanation for the modifications made. 
{% enddocs %}

{% docs change_request_end_date %} 
The end date for the change or execution of the change request associated with the current record. 
{% enddocs %}

{% docs change_request_implementation_plan %} 
Information about the plan or process for implementing the changes associated with the current record. 
{% enddocs %}

{% docs change_request_justification %} 
The reasoning or justification behind the changes associated with the current record, providing context or explanation for the modifications made. 
{% enddocs %}

{% docs on_hold_task %} 
A link to the task or activity that indicates the current record is on hold, specifying the task associated with the 
hold status. {% enddocs %}

{% docs outside_maintenance_schedule %} 
Indicates whether the changes associated with the current record fall outside the regular maintenance schedule or window. 
{% enddocs %}

{% docs phase %} 
The phase or stage of the change request or change record within the change management process, indicating its progress or status. 
{% enddocs %}

{% docs change_phase %} 
The phase or stage of the change request or change record within the change management process, indicating its progress or status. 
{% enddocs %}

{% docs phase_state %} 
The current state or status of the phase associated with the change request or change record. 
{% enddocs %}

{% docs change_phase_state %} 
The current state or status of the phase associated with the change request or change record. 
{% enddocs %}

{% docs production_system %} 
Indicates whether the changes associated with the current record are intended for the production environment or system. 
{% enddocs %}

{% docs is_production_system %} 
Indicates whether the changes associated with the current record are intended for the production environment or system. 
{% enddocs %}

{% docs reason %} 
The reason or rationale behind the changes requested by the current record, providing context or explanation for the modifications made. 
{% enddocs %}

{% docs change_reason %} 
The reason or rationale behind the changes associated with the current record, providing context or explanation for the modifications made. 
{% enddocs %}

{% docs requested_by_date %} 
The date when the changes associated with the current record were requested or initiated. 
{% enddocs %}

{% docs change_requested_by_date %} 
The date when the changes associated with the current record were requested or initiated. 
{% enddocs %}

{% docs requested_by_link %} 
A link to the person or entity who requested or initiated the changes associated with the current record. 
{% enddocs %}

{% docs change_requested_by_link %} 
A link to the person or entity who requested or initiated the changes associated with the current record. 
{% enddocs %}

{% docs requested_by_value %} 
The name or identifier of the person or entity who requested or initiated the changes associated with the current record. 
{% enddocs %}

{% docs change_requested_by_value %} 
The name or identifier of the person or entity who requested or initiated the changes associated with the current record. 
{% enddocs %}

{% docs review_comments %} 
Comments or feedback provided during the review process for the changes associated with the current record. 
{% enddocs %}

{% docs review_date %} 
The date when the record was reviewed or evaluated. 
{% enddocs %}

{% docs change_review_date %} 
The date when the changes associated with the current record were reviewed or evaluated. 
{% enddocs %}

{% docs change_request_review_date %} 
The date when the change request was reviewed or evaluated. 
{% enddocs %}

{% docs review_status %} 
The status or outcome of the review process associated with the current record. 
{% enddocs %}

{% docs change_request_review_status %} 
The status or outcome of the review process for the change request associated with the current record. 
{% enddocs %}

{% docs risk %} 
The level of risk associated with the changes, indicating the potential impact or consequences of implementing the modifications outlined in the current record. 
{% enddocs %}

{% docs change_request_risk %} 
The level of risk associated with the changes, indicating the potential impact or consequences of implementing the modifications outlined in the current record. 
{% enddocs %}

{% docs risk_impact_analysis %} 
An analysis or assessment of the impact or consequences of the changes outlined in the current record. 
{% enddocs %}

{% docs scope %} 
The scope or extent of the changes outlined in the current record, specifying the areas or components affected by the modifications. 
{% enddocs %}

{% docs change_request_scope %} 
The scope or extent of the changes outlined in the current record, specifying the areas or components affected by the modifications. 
{% enddocs %}

{% docs change_request_start_date %} 
The requested start date for the implementation or execution of the changes associated with the current record. 
{% enddocs %}

{% docs start_date %} 
The start date associated with the current record. 
{% enddocs %}

{% docs std_change_producer_version_link %} 
A link to the version of the standard change producer associated with the current record. 
{% enddocs %}

{% docs std_change_producer_version_value %} 
The name or identifier of the version of the standard change producer linked to the current record. 
{% enddocs %}

{% docs test_plan %} 
Information about the plan or process for testing the changes associated with the current record. 
{% enddocs %}

{% docs change_request_test_plan %} 
Information about the plan or process for testing the changes requested by the change request of this record. 
{% enddocs %}

{% docs type %} 
The type or category regarding the current record
{% enddocs %}

{% docs change_request_type %} 
The type or category of the changes outlined in the current record, indicating the nature or purpose of the modifications. 
{% enddocs %}

{% docs unauthorized %} 
Indicates whether the changes associated with the current record were made without proper authorization or approval. 
{% enddocs %}

{% docs is_change_request_unauthorized %} 
Indicates whether the changes associated with the current record were made without proper authorization or approval. 
{% enddocs %}

{% docs category %} 
The category of the record.
{% enddocs %}

{% docs change_category %} 
The category of the change.
{% enddocs %}

{% docs problem_category %} 
The category of the problem.
{% enddocs %}

{% docs servicenow__ticket_enhanced %}
Each record represents a task with additional information about its associated problem, incident, or change request. Finally, it contains user information for who opened, started, updated, reported, fixed, closed, requested, reported, or confirmed the task.
{% enddocs %}

{% docs is_problem_task %}
A boolean of whether the task is a problem task.
{% enddocs %}

{% docs is_change_task %}
A boolean of whether the task is a change task.
{% enddocs %}

{% docs problem_minutes_to_resolve %}
The number of minutes from time that the problem was created to the time that the problem was resolved.
{% enddocs %}

{% docs task_minutes_to_close %}
The number of minutes from time that the task was created to the time that the task was closed.
{% enddocs %}

{% docs associated_problem_id %}
The associated problem with this task; the sys_id from the problem object.
{% enddocs %}

{% docs associated_change_request_id %}
The associated change request with this task; the sys_id from the change request object.
{% enddocs %}

{% docs servicenow__activity_summary %}
Each record represents aggregate task, problem, change, incident, and change request data by varying grains including status, priority, impact, and urgency. 
{% enddocs %}

{% docs total_incidents_caused_by_problem %}
The total number of incidents associated with this problem.
{% enddocs %}

{% docs total_active_tasks %}
Total number of active tasks
{% enddocs %}

{% docs total_active_problem_tasks %}
Total number of active problem tasks
{% enddocs %}

{% docs total_active_change_tasks %}
Total number of active change tasks
{% enddocs %}

{% docs total_associated_problems %}
Total number of problems
{% enddocs %}

{% docs total_incidents_caused_by_problems %}
Total number of incidents caused by associated problems
{% enddocs %}

{% docs total_change_requests %}
Total number of change requests
{% enddocs %}

{% docs total_closed_tasks %}
Total number of closed tasks
{% enddocs %}

{% docs average_minutes_to_close %}
Average number of minutes between the time that the task was created to the time that the task was closed.
{% enddocs %}

{% docs customer %}
Boolean of whether the company is a customer.
{% enddocs %}

{% docs fax_phone %}
Fax phone number of the record.
{% enddocs %}

{% docs fiscal_year %}
Company's fiscal year
{% enddocs %}

{% docs notes %}
Notes about the record
{% enddocs %}

{% docs address_state %}
The geographical state to which the record belongs
{% enddocs %}

{% docs street %}
The street to which the record belongs
{% enddocs %}

{% docs vendor %}
Boolean of whether the company is a vendor
{% enddocs %}

{% docs vendor_type %}
Vendor types group vendors that offer similar goods and services, and are useful for reporting and comparing vendor performance. Example: Hardware, Services
{% enddocs %}

{% docs website %}
Company website
{% enddocs %}

{% docs stg_servicenow__core_company %}
Staging table containing all records relating to companies.
{% enddocs %}

{% docs core_company %}
Table containing all company related information.
{% enddocs %}