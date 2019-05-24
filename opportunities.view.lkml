view: opportunities {
  sql_table_name: salesforce.opportunities ;;

 # ------- Dimensions hidden --------------
  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
    link: {
      label: "View in Salesforce"
      url: "https://eu16.lightning.force.com/lightning/r/Opportunity/{{value}}/view"
    }
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

  dimension: gross_mrr {
    type: number
    hidden: yes
    label: "Gross MRR"
    #value_format: "0.00\€"
    value_format_name:eur
    sql: CAST(${TABLE}.amount as decimal);;
  }

  dimension: demo_notes {
    group_label: "Sales Process Information"
    hidden: yes
    label: "Demo Notes"
    type: string
    sql: ${TABLE}.demo_notes_c ;;
  }

  dimension_group: last_activity {
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
    sql: ${TABLE}.last_activity_date ;;
  }


  # --------------------------------------- Dimensions in use ------------------------------------------------------

  dimension: account_lead_engagement_c {
    group_label: "Marketing Information"
    description: "active interest=Warmcall, passive&no interest=Coldcall"
    label: "Interest Category"
    type: string
    sql: CASE WHEN ${TABLE}.account_lead_engagement_c='active interest' THEN 'Warmcall' ELSE 'Coldcall' END  ;;
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
    label: "Opportunity closed"
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

  dimension: contact_role_score_c {
    group_label: "Opportunity Scores"
    label: "Contact Role"
    type: number
    sql: ${TABLE}.contact_role_score_c ;;
  }


  dimension_group: created {
    label: "Opportunity created"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      day_of_week,
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
    label: "Time Demo to Close (Days)"
    type: number
    sql:  ${close_date}- ${demo_done_date_c_date} ;;

  }

  dimension: weeks_to_close_after_demo {
    group_label: "Funneltime"
    label: "Time Demo to Close (Weeks)"
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

  dimension: demo_booked_c {
    label: "Demo booked"
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
  label: "Demo Booked"
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
    label: "Demo Done"
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
    label: "Followup Assigned to"
    type: string
    # hardcoding the names here to avoid having to join presales twice in the same explore
    sql: CASE WHEN ${TABLE}.followup_owner_c='0051t000001yRQMAA2' THEN 'Gabi Schröthlin'
              WHEN ${TABLE}.followup_owner_c='0051t000002eMZdAAM' THEN 'Kai Schröthlin'
              WHEN ${TABLE}.followup_owner_c='0051t000002VY56AAG' THEN 'Chris Schaller' ELSE ${TABLE}.followup_owner_c END;;
  }

  dimension: incoming_invoices_per_month {
    group_label: "Company Information"
    label: "Incoming Invoices Monthly"
    type: string
    sql: ${TABLE}.incoming_invoices_per_month_c ;;
  }

  dimension: industry {
    group_label: "Company Information"
    label: "Industry"
    type: string
    sql: ${TABLE}.industry_c ;;
  }

  dimension: information_request_responsibility {
    group_label: "Company Information"
    type: string
    sql: ${TABLE}.information_request_responsibility_c ;;
  }

  dimension: invoice_creation_tool {
    group_label: "Company Information"
    type: string
    sql: ${TABLE}.invoice_creation_tool_c ;;
  }

  dimension: invoice_data_transfer {
    group_label: "Company Information"
    type: string
    sql: ${TABLE}.invoice_data_transfer_c ;;
  }

  dimension: invoice_reconciliation_responsibility {
    group_label: "Company Information"
    type: string
    sql: ${TABLE}.invoice_reconciliation_responsibility_c ;;
  }

  dimension: is_won {
    label: "Closed Won"
    group_label: "Key Funnel Events"
    type: yesno
    sql: ${TABLE}.is_won ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: next_steps {
    group_label: "Sales Process Information"
    label: "Next Steps"
    type: string
    sql: ${TABLE}.next_steps_c ;;
  }

  dimension: opportunity_score {
    group_label: "Opportunity Scores"
    label: "Total Score"
    type: number
    sql: ${TABLE}.opportunity_score_c ;;
  }

  dimension: industry_score_c {
    group_label: "Opportunity Scores"
    label: "Industry"
    type: number
    sql: ${TABLE}.industry_score_c ;;
  }

  dimension: other_tools_in_use {
    group_label: "Company Information"
    label: "Other Tools in use"
    type: string
    sql: ${TABLE}.other_tools_in_use_c ;;
  }

  dimension: outgoing_invoices_per_month {
    group_label: "Company Information"
    label: "Monthly Outgoing Invoices"
    type: string
    sql: ${TABLE}.outgoing_invoices_per_month_c ;;
  }

  dimension: pain_definition_score {
    group_label: "Opportunity Scores"
    label: "Pain Definition"
    type: number
    sql: ${TABLE}.pain_definition_score_c ;;
  }

  dimension: share_digital_invoices_score_c {
    group_label: "Opportunity Scores"
    label: "Share Digital Invoices"
    type: number
    sql: ${TABLE}.share_digital_invoices_score_c ;;
  }

  dimension: painpoint_notes {
    group_label: "Company Information"
    label: "Painpoint Details"
    type: string
    sql: ${TABLE}.painpoint_notes_c ;;
  }

  dimension: painpoints {
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
    type: tier
    tiers: [25,50,75]
    style: integer
    value_format: "00\%"
    sql: ${TABLE}.share_digital_invoices_c ;;
  }

  dimension: sql_c {
    hidden: yes
    # hidden for now since this doesnt make any sense currently
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
    description: "Upsell, Reactivation, New Sale"
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: testgroup_upfront_payments {
    type: yesno
    sql: ${TABLE}.testgroup_for_upfront_payments_only_c ;;
   # sql: CASE WHEN ${TABLE}${testgroup_upfront_payments}=true THEN "yes" ELSE "no" END ;;
  }

  dimension: urgency_score_c {
    group_label: "Opportunity Scores"
    label: "Urgency"
    type: number
    sql: ${TABLE}.urgency_score_c ;;
  }

  dimension: days_demo_to_close {
    group_label: "Funneltime"
    label: "Time Demo to Close (Days)"
    type: number
    # if datediff is negative then take 0.
    sql: IF( ${close_date}<${check_demo_done_c},0,DATEDIFF('DAY', ${demo_done_date_c_date}, ${close_date}));;
  }



# --------------------------------calculations for measures--------------------------------


  measure: distinct_opportunity {
    # whitespace ensures that this is shown at the start
    label: "    Total Opportunities created"
    group_label: "Logo Metrics"
    type: count_distinct
    sql: ${id} ;;
    drill_fields: [detail*]
  }

  measure: gross_mrr_won_sum {
    type: sum
    label: "Total Revenue won (Gross MRR)"
    group_label: "Revenue Metrics"
    #value_format: "0.00\€"
    value_format_name:eur
    sql: CAST(${TABLE}.amount as decimal);;
    filters: {
      field: stage_name
      value: "Closed Won" }
  }

  measure: gross_mrr_won_avg {
    type: average
    label: "Avg Revenue/Customer (Gross MRR)"
    group_label: "Revenue Metrics"
    #value_format: "0.00\€"
    value_format_name: eur
    sql: CAST(${TABLE}.amount as decimal);;
    filters: {
      field: stage_name
      value: "Closed Won" }
  }

  measure: funnel_value_c {
    label: "Total Funnel Value"
    group_label: "Revenue Metrics"
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
    label: "CR 3"
    description: "Demo done -> Customer won"
    type: number
    group_label: "Conversion Metrics"
    value_format: "0.00\%"
    sql: ${won_opportunities}*100.0 / NULLIF(${done_demos},0) ;; }

  measure: cr_2 {
    label: "CR 2"
    type: number
    group_label: "Conversion Metrics"
    value_format: "0.00\%"
    sql: ${done_demos}*100.0 / NULLIF(${booked_demos},0) ;; }

  measure: cr_1 {
    label: "CR 1"
    type: number
    group_label: "Conversion Metrics"
    value_format: "0.00\%"
    sql: ${booked_demos}*100.0 / NULLIF(${distinct_opportunity},0) ;; }

  measure: cr_total {
    label: "CR Total"
    type: number
    group_label: "Conversion Metrics"
    value_format: "0.00\%"
    sql: ${won_opportunities}*100.0 / NULLIF(${distinct_opportunity},0) ;; }

  measure: cr_4 {
    label: "CR 4"
    description: "Closed -> Out of Moneyback"
    type: number
    group_label: "Conversion Metrics"
    value_format: "0.00\%"
    sql: ${opportunities_out_of_moneyback}*100.0 / NULLIF(${won_opportunities},0) ;; }


  measure: opportunities_out_of_moneyback  {
    label: "Total Opportunities out of Moneyback"
    group_label: "Logo Metrics"
    type: count_distinct
    sql: ${id} ;;
    filters: {
      field: subscription_out_of_moneyback_c
      value: "yes" }
    filters: {
      field: stage_name
      value: "Closed Won" }}

    measure: opportunities_out_of_trial  {
      label: "Total Opportunities out of Trial"
      group_label: "Logo Metrics"
      type: count_distinct
      sql: ${id} ;;
      filters: {
        field: subscription_out_of_trial_stage_c
        value: "yes" }
      filters: {
        field: stage_name
        value: "Closed Won" }}

  measure: won_opportunities  {
    label: " Total Opportunities won"
    group_label: "Logo Metrics"
    type: count_distinct
    sql: ${id} ;;
    drill_fields: [detail*]
    filters: {
      field: stage_name
      value: "Closed Won" } }

  measure: done_demos  {
    label: "  Total Demos done"
    group_label: "Logo Metrics"
    type: count_distinct
    sql: ${id} ;;
    filters: {
      field: check_demo_done_c
      value: "yes" } }

  measure: booked_demos  {
    label: "   Total Demos booked"
    group_label: "Logo Metrics"
    type: count_distinct
    sql: ${id} ;;
    filters: {
      field: demo_booked_c
      value: "yes" } }

  measure: average_funneltime {
    group_label: "Funneltime Metrics"
    label: "Avg. Time in Funnel (Days)"
    description: "Only looks at Customers that are won"
    type: average
    sql: ${days_in_opportunity_funnel} ;;
    filters: {
      field: is_won
      value: "true"
    }
  }
    measure: datediff_demo_to_close {
      group_label: "Funneltime Metrics"
      label: "Time Demo to Close (Days)"
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
      group_label: "Funneltime Metrics"
      label: "Time Demo to Close (Weeks)"
      description: "Only looks at Customers that are won"
      type: average
      sql: DATEDIFF('WEEK', ${demo_done_date_c_date}, ${close_date});;
      filters: {
      field: is_closed
       value: "true"
      }
    }

# ------ opportunity scores
      measure: company_size_score_avg {
        group_label: "Opportunity Scores"
        label: "Company Size"
        type: average
        sql: ${company_size_score_c} ;;
      }

      measure: contact_role_score_avg {
        group_label: "Opportunity Scores"
        label: "Contact Role"
        type: average
        sql: ${contact_role_score_c};;
      }

      measure: pain_defeinition_score_avg {
        group_label: "Opportunity Scores"
        label: "Pain Definition"
        type: average
        sql: ${pain_definition_score};;
      }

      measure: urgency_score_avg {
        group_label: "Opportunity Scores"
        label: "Urgency"
        type: average
        sql: ${urgency_score_c};;
      }

      measure: share_digital_invoices_score_avg {
        group_label: "Opportunity Scores"
        label: "Digital Invoices"
        type: average
        sql: ${share_digital_invoices_score_c};;
      }

      measure: industry_score_avg {
        group_label: "Opportunity Scores"
        label: "Industry"
        type: average
        sql: ${industry_score_c};;
      }

      measure: opportunity_score_avg {
        group_label: "Opportunity Scores"
        label: "Total Score"
        type: average
        sql: ${opportunity_score};;
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
      accounts.id,
      gross_mrr
    ]
  }

  set: basic_opportunity_information {
    fields: [
      stage_name,
      booked_demos,
      demo_booked_c,
      demo_booked_date_c_date,
      demo_booked_date_c_week,
      demo_booked_date_c_month,
      demo_booked_date_c_quarter,
      is_won,
      gross_mrr_won_sum,
      gross_mrr_won_avg,
      funnel_value_c

    ]
  }
}
