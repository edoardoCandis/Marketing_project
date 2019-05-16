view: opportunities {
  sql_table_name: salesforce.opportunities ;;

 # ------- Dimensions hidden --------------
  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: account_id {
    type: string
    hidden: yes
    sql: ${TABLE}.account_id ;;
  }

  dimension: last_modified_by_id {
    hidden: yes
    type: string
    sql: ${TABLE}.last_modified_by_id ;;
  }

  dimension_group: last_modified {
    hidden: yes
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension: multiplier_account_c {
    hidden: yes
    type: string
    sql: ${TABLE}.multiplier_account_c ;;
  }

  dimension: pricebook_2_id {
    hidden: yes
    type: string
    sql: ${TABLE}.pricebook_2_id ;;
  }
  dimension: record_type_id {
    type: string
    hidden: yes
    sql: CASE WHEN ${TABLE}.record_type_id ='0121t000000LSPjAAO' THEN 'Company' ELSE 'Multiplier' END ;;
  }
  dimension: share_companies_25_employees_c {
    type: string
    hidden: yes
    sql: ${TABLE}.share_companies_25_employees_c ;;
  }

  dimension: description {
    hidden: yes
    #field not used
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: get_my_invoices_c {
    hidden: yes
    type: string
    sql: ${TABLE}.get_my_invoices_c ;;
  }

  dimension: gmi_notes_c {
    hidden: yes
    type: string
    sql: ${TABLE}.gmi_notes_c ;;
  }

  dimension: has_open_activity {
    hidden: yes
    type: yesno
    sql: ${TABLE}.has_open_activity ;;
  }

  dimension: has_opportunity_line_item {
    hidden: yes
    type: yesno
    sql: ${TABLE}.has_opportunity_line_item ;;
  }

  dimension: has_overdue_task {
    hidden: yes
    type: yesno
    sql: ${TABLE}.has_overdue_task ;;
  }

  dimension: created_by_id {
    hidden: yes
    type: string
    sql: ${TABLE}.created_by_id ;;
  }


  dimension: duocliends_c {
    hidden: yes
    type: number
    sql: ${TABLE}.duocliends_c ;;
  }

  dimension: duoexperience_c {
    hidden: yes
    type: string
    sql: ${TABLE}.duoexperience_c ;;
  }

  dimension: email_c {
    hidden: yes
    type: string
    sql: ${TABLE}.email_c ;;
  }
  dimension: forecast_category {
    hidden: yes
    type: string
    sql: ${TABLE}.forecast_category ;;
  }

  dimension: forecast_category_name {
    hidden: yes
    type: string
    sql: ${TABLE}.forecast_category_name ;;
  }

  dimension: opportunity_segment_c {
    hidden: yes
    type: string
    sql: ${TABLE}.opportunity_segment_c ;;
  }

  dimension: potential_smartbooks_c {
    hidden: yes
    type: number
    sql: ${TABLE}.potential_smartbooks_c ;;
  }

  dimension: potential_workflows_c {
    hidden: yes
    type: number
    sql: ${TABLE}.potential_workflows_c ;;
  }

  dimension: practice_digitzies_invoices_c {
    type: yesno
    hidden: yes
    sql: ${TABLE}.practice_digitzies_invoices_c ;;
  }

  dimension: subscription_id_c {
    hidden: yes
    type: string
    sql: ${TABLE}.subscription_id_c ;;
  }

  dimension: total_bookkeeping_clients_c {
    hidden: yes
    type: number
    sql: ${TABLE}.total_bookkeeping_clients_c ;;
  }

  dimension: bob_folder_clients_c {
    hidden: yes
    # this is only interesting for multiplier sales
    type: number
    sql: ${TABLE}.bob_folder_clients_c ;;
  }

  dimension: gmiaccount_email_c {
    hidden: yes
    type: string
    sql: ${TABLE}.gmiaccount_email_c ;;
  }
  dimension: hrneed_for_new_employees_c {
    hidden: yes
    type: string
    sql: ${TABLE}.hrneed_for_new_employees_c ;;
  }
  dimension: is_closed {
    hidden: yes
    type: yesno
    sql: ${TABLE}.is_closed ;;
  }

  dimension: multiplier_payment_conditions_c {
    # we take it from multiplier account
    hidden: yes
    type: string
    sql: ${TABLE}.multiplier_payment_conditions_c ;;
  }

  dimension: multiplier_stage_c {
    hidden: yes
    type: string
    sql: ${TABLE}.multiplier_stage_c ;;
  }

  dimension: is_deleted {
    hidden: yes
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: owner_id {
    hidden: yes
    type: string
    sql: ${TABLE}.owner_id ;;
  }

  dimension: cash_ledger_c {
    hidden: yes
    type: string
    sql: ${TABLE}.cash_ledger_c ;;
  }

  dimension: probability {
    hidden: yes
    type: string
    sql: ${TABLE}.probability ;;
  }

  dimension: additional_company_names_c {
    hidden: yes
    type: string
    sql: ${TABLE}.additional_company_names_c ;;
  }


  # --------------------------------------- Dimensions in use ------------------------------------------------------

  dimension: account_lead_engagement_c {
    group_label: "Marketing Information"
    label: "Interest Category"
    type: string
    sql: ${TABLE}.account_lead_engagement_c ;;
  }

  dimension: account_lead_method_c {
    group_label: "Marketing Information"
    label: "Lead Method"
    type: string
    sql: ${TABLE}.account_lead_method_c ;;
  }

  dimension: accounting_tool_in_use_c {
    group_label: "Company Information"
    label: "Accounting Tool in use"
    type: string
    sql: ${TABLE}.accounting_tool_in_use_c ;;
  }

  dimension: accounts_payable_process_c {
    group_label: "Company Information"
    label: "Accounts Payable Process"
    type: string
    sql: ${TABLE}.accounts_payable_process_c ;;
  }

  dimension: approval_workflow_c {
    group_label: "Company Information"
    label: "Approval Workflow"
    type: string
    sql: ${TABLE}.approval_workflow_c ;;
  }

  dimension: bank_accounts_c {
    group_label: "Company Information"
    label: "Bank Information"
    type: string
    sql: ${TABLE}.bank_accounts_c ;;
  }

  dimension: blocking_features_c {
    group_label: "Sales Process Information"
    label: "Blocking Features"
    type: string
    sql: ${TABLE}.blocking_features_c ;;
  }

  dimension: blocking_features_notes_c {
    group_label: "Sales Process Information"
    label: "Blocking Features Notes"
    type: string
    sql: ${TABLE}.blocking_features_notes_c ;;
  }

  dimension: buying_advantages_for_customer_c {
    group_label: "Sales Process Information"
    label: "Buying Advantages for Customer"
    type: string
    sql: ${TABLE}.buying_advantages_for_customer_c ;;
  }

  dimension: check_demo_done_c {
    group_label: "Key Funnel Events"
    label: "Demo done"
    type: yesno
    sql: ${TABLE}.check_demo_done_c ;;
  }

  dimension_group: close {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      day_of_month,
      quarter,
      year
    ]
    sql: ${TABLE}.close_date ;;
  }

  dimension: close_lost_reason_c {
    group_label: "Sales Process Information"
    label: "Close lost reason"
    type: string
    sql: ${TABLE}.close_lost_reason_c ;;
  }

  dimension: company_details_structure_c {
    group_label: "Company Information"
    label: "Company Structure Details"
    type: string
    sql: ${TABLE}.company_details_structure_c ;;
  }

  dimension: company_size_score_c {
    group_label: "Opportunity Scores"
    label: "Company Size"
    type: number
    sql: ${TABLE}.company_size_score_c ;;
  }

  dimension: competition_knowledge_c {
    group_label: "Sales Process Information"
    label: "Competition Knowledge"
    type: string
    sql: ${TABLE}.competition_knowledge_c ;;
  }

  dimension: competition_notes_c {
    group_label: "Sales Process Information"
    label: "Competition Knowledge Notes"
    type: string
    sql: ${TABLE}.competition_notes_c ;;
  }

  dimension: competitor_score_c {
    group_label: "Opportunity Scores"
    label: "Pain Definition"
    type: number
    sql: ${TABLE}.competitor_score_c ;;
  }

  dimension: contact_role_score_c {
    group_label: "Opportunity Scores"
    label: "Contact Role"
    type: number
    sql: ${TABLE}.contact_role_score_c ;;
  }


  dimension_group: created {
    label: "Opportunity Created"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      quarter_of_year,
      hour_of_day,
      year
    ]
    sql: ${TABLE}.created_date ;;
  }

  dimension: days_in_opportunity_funnel {
    group_label: "Funneltime"
    type: number
    sql: ${TABLE}.daysin_opportunity_funnel_c ;;
  }

  dimension: days_in_opportunity_funnel_bucket {
    group_label: "Funneltime"
    type: tier
    tiers: [ 0,7,14,21,28,]
    style: integer
    sql: ${days_in_opportunity_funnel}_funnel_c} ;;
  }

  dimension: days_to_close_after_demo {
    group_label: "Funneltime"
    type: number
    sql:  ${close_date}- ${demo_done_date_c_date} ;;

  }

  dimension: weeks_to_close_after_demo {
    group_label: "Funneltime"
    type: tier
    tiers: [ 0,7,14,21,28,35,42]
    style: integer
    sql: : ${close_date}- ${demo_done_date_c_date} ;;
  }
  dimension: decision_process_c {
    group_label: "Sales Process Information"
    label: "Decision Process"
    type: string
    sql: ${TABLE}.decision_process_c ;;
  }

  dimension: decision_process_score_c {
    group_label: "Opportunity Scores"
    label: "Decision Process"
    type: number
    sql: ${TABLE}.decision_process_score_c ;;
  }

  dimension: demo_booked_c {
    label: "Demo booked)"
    group_label: "Key Funnel Events"
    type: yesno
    sql: ${TABLE}.demo_booked_c ;;
  }

  dimension: demo_conclusion_c {
    group_label: "Sales Process Information"
    label: "Demo Conclusions"
    type: string
    sql: ${TABLE}.demo_conclusion_c ;;
  }

dimension_group: demo_booked_date_c {
  type: time
  timeframes: [
    raw,
    time,
    date,
    week,
    week_of_year,
    day_of_month,
    month,
    quarter,
    year
  ]
  sql: ${TABLE}.demo_booked_date_c ;;
}

  dimension_group: demo_done_date_c {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      week_of_year,
      day_of_month,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.demo_done_date_c ;;
  }

  dimension: demo_notes_c {
    group_label: "Sales Process Information"
    label: "Demo Notes"
    type: string
    sql: ${TABLE}.demo_notes_c ;;
  }

  dimension: employees_c {
    hidden: yes
    # we use the employee field from the account, not from the Opportunity
    group_label: "Company Information"
    label: "Employees"
    type: number
    sql: ${TABLE}.employees_c ;;
  }

  dimension: company_size{
    group_label: "Company Information"
    label: "Employee Groups"
    type: tier
    tiers: [ 25,100,200]
    style: integer
    sql: ${TABLE}.employees_c ;;
  }

  dimension: followup_owner_c {
    label: "Followup Owner"
    type: string
    sql: ${TABLE}.followup_owner_c ;;
  }

  dimension: incoming_invoices_per_month_c {
    group_label: "Company Information"
    label: "Incoming Invoices Monthly"
    type: string
    sql: ${TABLE}.incoming_invoices_per_month_c ;;
  }

  dimension: industry_c {
    group_label: "Company Information"
    label: "Industry"
    type: string
    sql: ${TABLE}.industry_c ;;
  }

  dimension: information_request_responsibility_c {
    group_label: "Company Information"
    type: string
    sql: ${TABLE}.information_request_responsibility_c ;;
  }

  dimension: invoice_creation_tool_c {
    group_label: "Company Information"
    type: string
    sql: ${TABLE}.invoice_creation_tool_c ;;
  }

  dimension: invoice_data_transfer_c {
    group_label: "Company Information"
    type: string
    sql: ${TABLE}.invoice_data_transfer_c ;;
  }

  dimension: invoice_reconciliation_responsibility_c {
    group_label: "Company Information"
    type: string
    sql: ${TABLE}.invoice_reconciliation_responsibility_c ;;
  }

  dimension: invoice_volume_score_c {
    group_label: "Opportunity Scores"
    label: "Invoice Volume"
    type: number
    sql: ${TABLE}.invoice_volume_score_c ;;
  }

  dimension: is_won {
    label: "Closed Won"
    group_label: "Key Funnel Events"
    type: yesno
    sql: ${TABLE}.is_won ;;
  }

  dimension_group: last_activity {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_activity_date ;;
  }



  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: next_steps_c {
    group_label: "Sales Process Information"
    label: "Next Steps"
    type: string
    sql: ${TABLE}.next_steps_c ;;
  }

  dimension: opportunity_score_c {
    group_label: "Opportunity Scores"
    label: "Total Score"
    type: number
    sql: ${TABLE}.opportunity_score_c ;;
  }

  dimension: other_tools_in_use_c {
    group_label: "Company Information"
    label: "Other Tools in use"
    type: string
    sql: ${TABLE}.other_tools_in_use_c ;;
  }

  dimension: outgoing_invoices_per_month_c {
    group_label: "Company Information"
    label: "Monthly Outgoing Invoices"
    type: string
    sql: ${TABLE}.outgoing_invoices_per_month_c ;;
  }

  dimension: pain_definition_score_c {
    group_label: "Opportunity Scores"
    label: "Pain Definition"
    type: number
    sql: ${TABLE}.pain_definition_score_c ;;
  }

  dimension: painpoint_notes_c {
    group_label: "Company Information"
    label: "Painpoint Details"
    type: string
    sql: ${TABLE}.painpoint_notes_c ;;
  }

  dimension: painpoints_c {
    group_label: "Company Information"
    type: string
    sql: ${TABLE}.painpoints_c ;;
  }

  dimension: preaccounting_c {
    group_label: "Company Information"
    type: string
    sql: ${TABLE}.preaccounting_c ;;
  }

  dimension: probability_category_c {
    label: "Probability Category"
    type: string
    sql: ${TABLE}.probability_category_c ;;
  }

  dimension: product_acquisition_channel_c {
    label: "Product"
    type: string
    sql: ${TABLE}.product_acquisition_channel_c ;;
  }

  dimension: product_expectations_c {
    group_label: "Company Information"
    type: string
    sql: ${TABLE}.product_expectations_c ;;
  }

  dimension_group: reapproach_date_c {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.reapproach_date_c ;;
  }


  dimension: share_digital_invoices_c {
    group_label: "Company Information"
    label: "Share digital Invoices"
    type: string
    sql: ${TABLE}.share_digital_invoices_c ;;
  }

  dimension: sql_c {
    type: yesno
    label: "SQL"
    group_label: "Marketing Information"
    description: "Opportunity marked as SalesQualifiedLead"
    sql: ${TABLE}.sql_c ;;
  }

  dimension: stage_name {
    label: "Stage"
    type: string
    sql: ${TABLE}.stage_name ;;
  }

  dimension: subscription_out_of_moneyback_c {
    label: "Out of MoneyBack"
    group_label: "Key Funnel Events"
    type: yesno
    sql: ${TABLE}.subscription_out_of_moneyback_c ;;
  }

  dimension: subscription_out_of_trial_stage_c {
    label: "Subscription Out of Trial"
    group_label: "Key Funnel Events"
    description: "Has the won customer made it out of Trial"
    type: yesno
    sql: ${TABLE}.subscription_out_of_trial_stage_c ;;
  }

  dimension: subscription_plan_c {
    label: "Subscription Plan"
    view_label: "Subscription Information"
    type: string
    sql: ${TABLE}.subscription_plan_c ;;
  }

  dimension: transaction_data_transfer_c {
    group_label: "Company Information"
    type: string
    sql: ${TABLE}.transaction_data_transfer_c ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: urgency_score_c {
    group_label: "Opportunity Scores"
    label: "Urgency"
    type: number
    sql: ${TABLE}.urgency_score_c ;;
  }

  dimension: days_demo_to_close {
    group_label: "Funneltime"
    type: number
    # if datediff is negative then take 0.
    sql: IF( ${close_date}<${check_demo_done_c},0,DATEDIFF('DAY', ${demo_done_date_c_date}, ${close_date}));;

  }

# --------------------------------calculations for measures--------------------------------


  measure: distinct_opportunity {
    type: count_distinct
    sql: ${id} ;;
  }
  measure: count {
    label: "Created Opportunities"
    type: count
    drill_fields: [detail*]
  }

  measure: gross_mrr {
    type: sum
    label: "Opportunity Gross MRR"
    #value_format: "0.00\€"
    value_format_name:eur
    sql: CAST(${TABLE}.amount as decimal);;
  }

  measure: gross_mrr_won_sum {
    type: sum
    label: "Gross MRR Won"
    #value_format: "0.00\€"
    value_format_name:eur
    sql: CAST(${TABLE}.amount as decimal);;
    filters: {
      field: stage_name
      value: "Closed Won" }
  }

  measure: gross_mrr_won_avg {
    type: average
    label: "Gross MRR Won/Opportunity"
    #value_format: "0.00\€"
    value_format_name: eur
    sql: CAST(${TABLE}.amount as decimal);;
    filters: {
      field: stage_name
      value: "Closed Won" }
  }

  measure: funnel_value_c {
    label: "Funnel Value"
    description: "Probability x Gross MRR (excluding Won Opportunities)"
    type: sum
    value_format_name: eur
    sql: CAST(${TABLE}.funnel_value_c as decimal);;
    filters: {
      field: is_won
      value: "false"
    }
  }
#--- Conversionrate definitions


 # measure: pct_of_cohort_converted {
  #  type: number
   # value_format: "0.00\%"
    #sql: 1.0 * ${won_opportunities} / NULLIF(${cohort_week.cohort_size},0) ;;
  #}

  measure: cr_3 {
    type: number
    group_label: "Conversion Metrics"
    value_format: "0.00\%"
    sql: ${won_opportunities}*100.0 / NULLIF(${done_demos},0) ;; }

  measure: cr_2 {
    type: number
    group_label: "Conversion Metrics"
    value_format: "0.00\%"
    sql: ${done_demos}*100.0 / NULLIF(${booked_demos},0) ;; }

  measure: cr_1 {
    type: number
    group_label: "Conversion Metrics"
    value_format: "0.00\%"
    sql: ${booked_demos}*100.0 / NULLIF(${count},0) ;; }

  measure: cr_total {
    type: number
    group_label: "Conversion Metrics"
    value_format: "0.00\%"
    sql: ${won_opportunities}*100.0 / NULLIF(${count},0) ;; }

  measure: cr_4 {
    type: number
    group_label: "Conversion Metrics"
    value_format: "0.00\%"
    sql: ${opportunities_out_of_moneyback}*100.0 / NULLIF(${won_opportunities},0) ;; }


  measure: opportunities_out_of_moneyback  {
    type: count_distinct
    sql: ${id} ;;
    filters: {
      field: subscription_out_of_moneyback_c
      value: "yes" }
    filters: {
      field: stage_name
      value: "Closed Won" }}

    measure: opportunities_out_of_trial  {
      type: count_distinct
      sql: ${id} ;;
      filters: {
        field: subscription_out_of_trial_stage_c
        value: "yes" }
      filters: {
        field: stage_name
        value: "Closed Won" }}

  measure: won_opportunities  {
    label: "Won Customers"
    type: count_distinct
    sql: ${id} ;;
    filters: {
      field: stage_name
      value: "Closed Won" } }

  measure: done_demos  {
    label: "Demos done"
    type: count_distinct
    sql: ${id} ;;
    filters: {
      field: check_demo_done_c
      value: "yes" } }

  measure: booked_demos  {
    label: "Demos booked"
    type: count_distinct
    sql: ${id} ;;
    filters: {
      field: demo_booked_c
      value: "yes" } }

measure: average_funneltime {
  label: "Funneltime"
  description: "Only looks at Customers that are won"
  type: average
  sql: ${days_in_opportunity_funnel} ;;
  filters: {
    field: is_won
    value: "true"
  }
}
    measure: datediff_demo_to_close {
      label: "Funneltime Demo to Close"
      description: "Includes all closed Deals"
      type: average
      sql: ${close_date}- ${demo_done_date_c_date} ;;
      filters: {
        field: is_closed
        value: "true"
      }
    }
    # this here we need to replace by parameters: https://discourse.looker.com/t/dynamic-measures-with-parameters/6069
    measure: weeks_demo_to_close {
      label: "Funneltime Demo to Close (Weeks)"
      description: "Only looks at Customers that are won"
      type: average
      sql: DATEDIFF('WEEK', ${demo_done_date_c_date}, ${close_date});;
      filters: {
      field: is_closed
       value: "true"
      }
    }

# -------Period Over Period Analysis

  parameter: previous_period_comparison_granularity {
    description: "Select the comparison period. E.g. choosing Month will compare the selected range against the same dates 30 days ago. "
    type: unquoted

    allowed_value: {
      label: "Week"
      value: "7"
    }
    allowed_value: {
      label: "Month"
      value: "30"
    }
    allowed_value: {
      label: "Year"
      value: "365"
    }
  }

# -------------- DEFINITION OF FILTERS  -----------

  filter: previous_period_filter {
    label: "Previous Period/This Period filter Range"
    description: "Previous Period Filter for specific measures. User Date filter for any regular measures."
    type: date
    sql:
    {% if period_over_period._in_query %}
    (${close_date} >=  {% date_start previous_period_filter %}
    AND ${close_date} <= {% date_end previous_period_filter %})
     OR
     (${close_date} >= DATEADD(day,-{{ previous_period_comparison_granularity._parameter_value }}, {% date_start previous_period_filter %} )
     AND ${close_date} <= DATEADD(day,-{{ previous_period_comparison_granularity._parameter_value }}+DATEDIFF(day,{% date_start previous_period_filter %}, {% date_end previous_period_filter %}),{% date_start previous_period_filter %} ))
    {% else %}
    {% condition previous_period_filter %} CAST(${close_date} as DATE) {% endcondition %}
    {% endif %}
    ;;
  }

  dimension: period_over_period {
    type: string
    description: "The reporting period as selected by the Previous Period Filter"
    sql:
      CASE
        WHEN {% date_start previous_period_filter %} is not null AND {% date_end previous_period_filter %} is not null /* date ranges or in the past x days */
          THEN
            CASE
              WHEN ${close_date} >=  {% date_start previous_period_filter %}
                AND ${close_date} <= {% date_end previous_period_filter %}
                THEN 'This Period'

                WHEN ${close_date} >= DATEADD(day,-{{ previous_period_comparison_granularity._parameter_value }}, {% date_start previous_period_filter %} )
                AND ${close_date} <= DATEADD(day,-{{ previous_period_comparison_granularity._parameter_value }}+DATEDIFF(day,{% date_start previous_period_filter %}, {% date_end previous_period_filter %}),{% date_start previous_period_filter %} )

                THEN 'Previous Period'
            END
            ELSE
            'This Period'
          END ;;
  }



  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      stage_name,
      name,
      accounts.name,
      accounts.id
    ]
  }

  set: basic_opportunity_information {
    fields: [
      stage_name,
      booked_demos,
      demo_booked_c,
      is_won,
      gross_mrr_won_sum,
      gross_mrr_won_avg,
      funnel_value_c

    ]
  }
}
