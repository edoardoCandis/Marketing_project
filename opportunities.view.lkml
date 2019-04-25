view: opportunities {
  sql_table_name: salesforce.opportunities ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: account_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.account_id ;;
  }

  dimension: account_lead_engagement_c {
    type: string
    sql: ${TABLE}.account_lead_engagement_c ;;
  }

  dimension: account_lead_method_c {
    type: string
    sql: ${TABLE}.account_lead_method_c ;;
  }

  dimension: accounting_tool_in_use_c {
    type: string
    sql: ${TABLE}.accounting_tool_in_use_c ;;
  }

  dimension: accounts_payable_process_c {
    type: string
    sql: ${TABLE}.accounts_payable_process_c ;;
  }

  dimension: additional_company_names_c {
    type: string
    sql: ${TABLE}.additional_company_names_c ;;
  }

  dimension: amount {
    type: number
    label: "Gross MRR"
    sql: ${TABLE}.amount ;;
  }

  dimension: approval_workflow_c {
    type: string
    sql: ${TABLE}.approval_workflow_c ;;
  }

  dimension: bank_accounts_c {
    type: string
    sql: ${TABLE}.bank_accounts_c ;;
  }

  dimension: blocking_features_c {
    type: string
    sql: ${TABLE}.blocking_features_c ;;
  }

  dimension: blocking_features_notes_c {
    type: string
    sql: ${TABLE}.blocking_features_notes_c ;;
  }

  dimension: bob_folder_clients_c {
    type: number
    sql: ${TABLE}.bob_folder_clients_c ;;
  }

  dimension: buying_advantages_for_customer_c {
    type: string
    sql: ${TABLE}.buying_advantages_for_customer_c ;;
  }

  dimension: calendly_created_c {
    type: yesno
    sql: ${TABLE}.calendly_created_c ;;
  }

  dimension: cash_ledger_c {
    type: string
    sql: ${TABLE}.cash_ledger_c ;;
  }

  dimension: check_demo_done_c {
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
    type: string
    sql: ${TABLE}.close_lost_reason_c ;;
  }

  dimension: company_details_structure_c {
    type: string
    sql: ${TABLE}.company_details_structure_c ;;
  }

  dimension: company_name_c {
    type: string
    sql: ${TABLE}.company_name_c ;;
  }

  dimension: company_size_score_c {
    type: number
    sql: ${TABLE}.company_size_score_c ;;
  }

  dimension: competition_knowledge_c {
    type: string
    sql: ${TABLE}.competition_knowledge_c ;;
  }

  dimension: competition_notes_c {
    type: string
    sql: ${TABLE}.competition_notes_c ;;
  }

  dimension: competitor_score_c {
    type: number
    sql: ${TABLE}.competitor_score_c ;;
  }

  dimension: contact_role_score_c {
    type: number
    sql: ${TABLE}.contact_role_score_c ;;
  }

  dimension: created_by_id {
    type: string
    sql: ${TABLE}.created_by_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      quarter_of_year,
      year
    ]
    sql: ${TABLE}.created_date ;;
  }

  dimension: daysin_opportunity_funnel_c {
    type: number
    sql: ${TABLE}.daysin_opportunity_funnel_c ;;
  }

  dimension: days_in_opportunity_funnel_bucket {
    type: tier
    tiers: [ 0,7,14,21,28,]
    style: integer
    sql: ${daysin_opportunity_funnel_c} ;;
  }

  dimension: days_to_close_after_demo {
    type: number
    sql:  ${close_date}- ${demo_done_date_c_date} ;;

  }


  dimension: weeks_to_close_after_demo {
    type: tier
    tiers: [ 0,7,14,21,28,35,42]
    style: integer
    sql: : ${close_date}- ${demo_done_date_c_date} ;;
  }
  dimension: decision_process_c {
    type: string
    sql: ${TABLE}.decision_process_c ;;
  }

  dimension: decision_process_score_c {
    type: number
    sql: ${TABLE}.decision_process_score_c ;;
  }

  dimension: demo_booked_c {
    type: yesno
    sql: ${TABLE}.demo_booked_c ;;
  }

  dimension: demo_conclusion_c {
    type: string
    sql: ${TABLE}.demo_conclusion_c ;;
  }

  dimension_group: demo_done_date_c {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      week_of_year,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.demo_done_date_c ;;
  }

  dimension: demo_notes_c {
    type: string
    sql: ${TABLE}.demo_notes_c ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: duocliends_c {
    type: number
    sql: ${TABLE}.duocliends_c ;;
  }

  dimension: duoexperience_c {
    type: string
    sql: ${TABLE}.duoexperience_c ;;
  }

  dimension: email_c {
    type: string
    sql: ${TABLE}.email_c ;;
  }

  dimension: employees_c {
    type: number
    sql: ${TABLE}.employees_c ;;
  }

  dimension: company_size{
    type: tier
    tiers: [ 25,100,200]
    style: integer
    sql: ${TABLE}.employees_c ;;
  }

  dimension: fiscal {
    type: string
    sql: ${TABLE}.fiscal ;;
  }

  dimension: fiscal_quarter {
    type: number
    sql: ${TABLE}.fiscal_quarter ;;
  }

  dimension: fiscal_year {
    type: number
    sql: ${TABLE}.fiscal_year ;;
  }

  dimension: followup_owner_c {
    type: string
    sql: ${TABLE}.followup_owner_c ;;
  }

  dimension: forecast_category {
    type: string
    sql: ${TABLE}.forecast_category ;;
  }

  dimension: forecast_category_name {
    type: string
    sql: ${TABLE}.forecast_category_name ;;
  }


  dimension: get_my_invoices_c {
    type: string
    sql: ${TABLE}.get_my_invoices_c ;;
  }

  dimension: gmi_notes_c {
    type: string
    sql: ${TABLE}.gmi_notes_c ;;
  }

  dimension: gmiaccount_email_c {
    type: string
    sql: ${TABLE}.gmiaccount_email_c ;;
  }

  dimension: has_open_activity {
    type: yesno
    sql: ${TABLE}.has_open_activity ;;
  }

  dimension: has_opportunity_line_item {
    type: yesno
    sql: ${TABLE}.has_opportunity_line_item ;;
  }

  dimension: has_overdue_task {
    type: yesno
    sql: ${TABLE}.has_overdue_task ;;
  }

  dimension: hrneed_for_new_employees_c {
    type: string
    sql: ${TABLE}.hrneed_for_new_employees_c ;;
  }

  dimension: incoming_invoices_per_month_c {
    type: string
    sql: ${TABLE}.incoming_invoices_per_month_c ;;
  }

  dimension: incoming_invoices_per_month_legacy_c {
    type: string
    sql: ${TABLE}.incoming_invoices_per_month_legacy_c ;;
  }

  dimension: industry_c {
    type: string
    sql: ${TABLE}.industry_c ;;
  }

  dimension: information_request_responsibility_c {
    type: string
    sql: ${TABLE}.information_request_responsibility_c ;;
  }

  dimension: intro_c {
    type: string
    sql: ${TABLE}.intro_c ;;
  }

  dimension: invoice_creation_tool_c {
    type: string
    sql: ${TABLE}.invoice_creation_tool_c ;;
  }

  dimension: invoice_data_transfer_c {
    type: string
    sql: ${TABLE}.invoice_data_transfer_c ;;
  }

  dimension: invoice_reconciliation_responsibility_c {
    type: string
    sql: ${TABLE}.invoice_reconciliation_responsibility_c ;;
  }

  dimension: invoice_volume_score_c {
    type: number
    sql: ${TABLE}.invoice_volume_score_c ;;
  }

  dimension: is_closed {
    type: yesno
    sql: ${TABLE}.is_closed ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: is_won {
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

  dimension: last_modified_by_id {
    type: string
    sql: ${TABLE}.last_modified_by_id ;;
  }

  dimension_group: last_modified {
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

  dimension_group: last_referenced {
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
    sql: ${TABLE}.last_referenced_date ;;
  }

  dimension_group: last_viewed {
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
    sql: ${TABLE}.last_viewed_date ;;
  }

  dimension: lead_source {
    type: string
    sql: ${TABLE}.lead_source ;;
  }

  dimension: multiplier_account_c {
    type: string
    sql: ${TABLE}.multiplier_account_c ;;
  }

  dimension: multiplier_payment_conditions_c {
    type: string
    sql: ${TABLE}.multiplier_payment_conditions_c ;;
  }

  dimension: multiplier_stage_c {
    type: string
    sql: ${TABLE}.multiplier_stage_c ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: net_mrr_c {
    type: string
    sql: ${TABLE}.net_mrr_c ;;
  }

  dimension: next_step {
    type: string
    sql: ${TABLE}.next_step ;;
  }

  dimension: next_steps_c {
    type: string
    sql: ${TABLE}.next_steps_c ;;
  }

  dimension: opportunity_channel_c {
    type: string
    sql: ${TABLE}.opportunity_channel_c ;;
  }

  dimension: opportunity_count_c {
    type: number
    sql: ${TABLE}.opportunity_count_c ;;
  }

  dimension: opportunity_score_c {
    type: number
    sql: ${TABLE}.opportunity_score_c ;;
  }

  dimension: opportunity_segment_c {
    type: string
    sql: ${TABLE}.opportunity_segment_c ;;
  }

  dimension: opportunty_source_c {
    type: string
    sql: ${TABLE}.opportunty_source_c ;;
  }

  dimension: other_tools_in_use_c {
    type: string
    sql: ${TABLE}.other_tools_in_use_c ;;
  }

  dimension: outgoing_invoices_per_month_c {
    type: string
    sql: ${TABLE}.outgoing_invoices_per_month_c ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.owner_id ;;
  }

  dimension: pain_definition_score_c {
    type: number
    sql: ${TABLE}.pain_definition_score_c ;;
  }

  dimension: painpoint_notes_c {
    type: string
    sql: ${TABLE}.painpoint_notes_c ;;
  }

  dimension: painpoints_c {
    type: string
    sql: ${TABLE}.painpoints_c ;;
  }

  dimension: potential_smartbooks_c {
    type: number
    sql: ${TABLE}.potential_smartbooks_c ;;
  }

  dimension: potential_workflows_c {
    type: number
    sql: ${TABLE}.potential_workflows_c ;;
  }

  dimension: practice_digitzies_invoices_c {
    type: yesno
    sql: ${TABLE}.practice_digitzies_invoices_c ;;
  }

  dimension: preaccounting_c {
    type: string
    sql: ${TABLE}.preaccounting_c ;;
  }

  dimension: pricebook_2_id {
    type: string
    sql: ${TABLE}.pricebook_2_id ;;
  }

  dimension: probability {
    type: string
    sql: ${TABLE}.probability ;;
  }

  dimension: probability_category_c {
    type: string
    sql: ${TABLE}.probability_category_c ;;
  }

  dimension: product_acquisition_channel_c {
    type: string
    sql: ${TABLE}.product_acquisition_channel_c ;;
  }

  dimension: product_expectations_c {
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

  dimension_group: received {
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
    sql: ${TABLE}.received_at ;;
  }

  dimension: record_type_id {
    type: string
    sql: ${TABLE}.record_type_id ;;
  }

  dimension: share_companies_25_employees_c {
    type: string
    sql: ${TABLE}.share_companies_25_employees_c ;;
  }

  dimension: share_digital_invoices_c {
    type: string
    sql: ${TABLE}.share_digital_invoices_c ;;
  }

  dimension: sql_c {
    type: yesno
    sql: ${TABLE}.sql_c ;;
  }

  dimension: stage_name {
    type: string
    sql: ${TABLE}.stage_name ;;
  }

  dimension: subscription_id_c {
    type: string
    sql: ${TABLE}.subscription_id_c ;;
  }

  dimension: subscription_out_of_moneyback_c {
    type: yesno
    sql: ${TABLE}.subscription_out_of_moneyback_c ;;
  }

  dimension: subscription_out_of_trial_stage_c {
    type: yesno
    sql: ${TABLE}.subscription_out_of_trial_stage_c ;;
  }

  dimension: subscription_plan_c {
    type: string
    sql: ${TABLE}.subscription_plan_c ;;
  }

  dimension_group: system_modstamp {
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
    sql: ${TABLE}.system_modstamp ;;
  }

  dimension: text_intro_c {
    type: string
    sql: ${TABLE}.text_intro_c ;;
  }

  dimension: text_next_steps_c {
    type: string
    sql: ${TABLE}.text_next_steps_c ;;
  }

  dimension: text_process_c {
    type: string
    sql: ${TABLE}.text_process_c ;;
  }

  dimension: text_solution_match_c {
    type: string
    sql: ${TABLE}.text_solution_match_c ;;
  }

  dimension: total_bookkeeping_clients_c {
    type: number
    sql: ${TABLE}.total_bookkeeping_clients_c ;;
  }

  dimension: transaction_data_transfer_c {
    type: string
    sql: ${TABLE}.transaction_data_transfer_c ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: urgency_score_c {
    type: number
    sql: ${TABLE}.urgency_score_c ;;
  }

  dimension: uuid {
    type: number
    value_format_name: id
    sql: ${TABLE}.uuid ;;
  }

  dimension_group: uuid_ts {
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
    sql: ${TABLE}.uuid_ts ;;
  }

# calculations for measures

  measure: count {
    label: "Created Opportunities"
    type: count
    drill_fields: [detail*]
  }
  measure: datediff_demo_to_close {
    type: sum
    sql: ${close_date}- ${demo_done_date_c_date} ;;
  }

  dimension: days_demo_to_close {
    type: number
    sql: DATEDIFF('DAY', ${demo_done_date_c_date}, ${close_date});;
  }

  dimension: weeks_demo_to_close {
    type: number
    sql: DATEDIFF('WEEK', ${demo_done_date_c_date}, ${close_date});;
  }

  measure: gross_mrr_won_sum {
    type: sum
    label: "Gross MRR Won"
    value_format: "0.00\€"
    sql: ${amount};;
    filters: {
      field: stage_name
      value: "Closed Won" }
  }

  measure: gross_mrr_won_avg {
    type: average
    label: "Gross MRR Won/Opportunity"
    value_format: "0.00\€"
    sql: ${amount};;
    filters: {
      field: stage_name
      value: "Closed Won" }
  }

  measure: funnel_value_c {
    label: "Funnel Value"
    description: "Probability x Gross MRR (excluding Won Opportunities)"
    type: sum
    value_format: "0.00\€"
    sql: ${TABLE}.funnel_value_c ;;
    filters: {
      field: is_won
      value: "false"
    }
  }
#--- Conversionrate definitions


  measure: pct_of_cohort_converted {
    type: number
    value_format: "0.00\%"
    sql: 1.0 * ${won_opportunities} / NULLIF(${cohort_week.cohort_size},0) ;;
  }

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

  measure: won_opportunities  {
    type: count_distinct
    sql: ${id} ;;
    filters: {
      field: stage_name
      value: "Closed Won" } }

  measure: done_demos  {
    type: count_distinct
    sql: ${id} ;;
    filters: {
      field: check_demo_done_c
      value: "yes" } }

  measure: booked_demos  {
    type: count_distinct
    sql: ${id} ;;
    filters: {
      field: demo_booked_c
      value: "yes" } }


measure: average_funneltime {
  label: "Funneltime"
  type: average
  sql: ${daysin_opportunity_funnel_c} ;;
  filters: {
    field: is_won
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
      forecast_category_name,
      accounts.name,
      accounts.id
    ]
  }
}
