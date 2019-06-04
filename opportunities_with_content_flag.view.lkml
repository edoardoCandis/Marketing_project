view: opportunities_with_content_flag {
  derived_table: {
    sql: with content_visit as (
        select distinct
        c.account_id,
        min(p.received_at) as visit_date
        from candis_website.pages p
        inner join marketing.fact_demo_request r on r.anonymous_id = p.anonymous_id
        inner join salesforce.contacts c on c.email = r.user_email
        where lower( context_page_url) LIKE '%blog%'
        OR lower( context_page_url) LIKE '%glossar%'
        OR lower( context_page_url) LIKE '%angebote%'
        OR lower( context_page_url) LIKE '%vorlagen%'
        OR lower( context_page_url) LIKE '%funktionen%'
        OR lower( context_page_url) LIKE '%https://candis.io/zuordnung-von-rechnung-nach-kostenstelle/'
        OR lower( context_page_url) LIKE '%https://candis.io/transparenter-freigabestatus/'
        OR lower( context_page_url) LIKE '%https://candis.io/rechtemanagement/'
        OR lower( context_page_url) LIKE '%https://candis.io/erinnerung-an-offene-freigaben/'
        OR lower( context_page_url) LIKE '%https://candis.io/prozessdokumentation-der-freigabe/'
        OR lower( context_page_url) LIKE '%https://candis.io/digitale-rechnungsfreigabe-gobd-konform/'
        GROUP BY 1)
select
o.*,
CASE WHEN visit_date < o.created_date THEN TRUE ELSE FALSE END AS visited_content
FROM salesforce.opportunities o
left join content_visit v ON o.account_id = v.account_id
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: received_at {
    type: time
    sql: ${TABLE}.received_at ;;
  }

  dimension: uuid {
    type: number
    sql: ${TABLE}.uuid ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension: fiscal {
    type: string
    sql: ${TABLE}.fiscal ;;
  }

  dimension: probability {
    type: string
    sql: ${TABLE}.probability ;;
  }

  dimension: fiscal_quarter {
    type: number
    sql: ${TABLE}.fiscal_quarter ;;
  }

  dimension: has_overdue_task {
    type: string
    sql: ${TABLE}.has_overdue_task ;;
  }

  dimension: incoming_invoices_per_month_c {
    type: string
    sql: ${TABLE}.incoming_invoices_per_month_c ;;
  }

  dimension: amount {
    type: string
    sql: ${TABLE}.amount ;;
  }

  dimension_group: last_activity_date {
    type: time
    sql: ${TABLE}.last_activity_date ;;
  }

  dimension_group: last_referenced_date {
    type: time
    sql: ${TABLE}.last_referenced_date ;;
  }

  dimension: total_bookkeeping_clients_c {
    type: number
    sql: ${TABLE}.total_bookkeeping_clients_c ;;
  }

  dimension: blocking_features_notes_c {
    type: string
    sql: ${TABLE}.blocking_features_notes_c ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: get_my_invoices_c {
    type: string
    sql: ${TABLE}.get_my_invoices_c ;;
  }

  dimension_group: system_modstamp {
    type: time
    sql: ${TABLE}.system_modstamp ;;
  }

  dimension: created_by_id {
    type: string
    sql: ${TABLE}.created_by_id ;;
  }

  dimension: demo_notes_c {
    type: string
    sql: ${TABLE}.demo_notes_c ;;
  }

  dimension: lead_source {
    type: string
    sql: ${TABLE}.lead_source ;;
  }

  dimension: forecast_category_name {
    type: string
    sql: ${TABLE}.forecast_category_name ;;
  }

  dimension: is_won {
    type: string
    sql: ${TABLE}.is_won ;;
  }

  dimension: last_modified_by_id {
    type: string
    sql: ${TABLE}.last_modified_by_id ;;
  }

  dimension: check_demo_done_c {
    type: string
    sql: ${TABLE}.check_demo_done_c ;;
  }

  dimension: forecast_category {
    type: string
    sql: ${TABLE}.forecast_category ;;
  }

  dimension: gmiaccount_email_c {
    type: string
    sql: ${TABLE}.gmiaccount_email_c ;;
  }

  dimension: invoice_creation_tool_c {
    type: string
    sql: ${TABLE}.invoice_creation_tool_c ;;
  }

  dimension: preaccounting_c {
    type: string
    sql: ${TABLE}.preaccounting_c ;;
  }

  dimension: product_expectations_c {
    type: string
    sql: ${TABLE}.product_expectations_c ;;
  }

  dimension: accounting_tool_in_use_c {
    type: string
    sql: ${TABLE}.accounting_tool_in_use_c ;;
  }

  dimension: calendly_created_c {
    type: string
    sql: ${TABLE}.calendly_created_c ;;
  }

  dimension: daysin_opportunity_funnel_c {
    type: number
    sql: ${TABLE}.daysin_opportunity_funnel_c ;;
  }

  dimension: industry_c {
    type: string
    sql: ${TABLE}.industry_c ;;
  }

  dimension: invoice_data_transfer_c {
    type: string
    sql: ${TABLE}.invoice_data_transfer_c ;;
  }

  dimension: is_deleted {
    type: string
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: outgoing_invoices_per_month_c {
    type: string
    sql: ${TABLE}.outgoing_invoices_per_month_c ;;
  }

  dimension_group: close_date {
    type: time
    sql: ${TABLE}.close_date ;;
  }

  dimension: duoexperience_c {
    type: string
    sql: ${TABLE}.duoexperience_c ;;
  }

  dimension: email_c {
    type: string
    sql: ${TABLE}.email_c ;;
  }

  dimension_group: last_modified_date {
    type: time
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension: multiplier_account_c {
    type: string
    sql: ${TABLE}.multiplier_account_c ;;
  }

  dimension: next_step {
    type: string
    sql: ${TABLE}.next_step ;;
  }

  dimension: opportunity_count_c {
    type: number
    sql: ${TABLE}.opportunity_count_c ;;
  }

  dimension: approval_workflow_c {
    type: string
    sql: ${TABLE}.approval_workflow_c ;;
  }

  dimension: net_mrr_c {
    type: string
    sql: ${TABLE}.net_mrr_c ;;
  }

  dimension: product_acquisition_channel_c {
    type: string
    sql: ${TABLE}.product_acquisition_channel_c ;;
  }

  dimension: bank_accounts_c {
    type: string
    sql: ${TABLE}.bank_accounts_c ;;
  }

  dimension: fiscal_year {
    type: number
    sql: ${TABLE}.fiscal_year ;;
  }

  dimension: has_open_activity {
    type: string
    sql: ${TABLE}.has_open_activity ;;
  }

  dimension: record_type_id {
    type: string
    sql: ${TABLE}.record_type_id ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: additional_company_names_c {
    type: string
    sql: ${TABLE}.additional_company_names_c ;;
  }

  dimension: blocking_features_c {
    type: string
    sql: ${TABLE}.blocking_features_c ;;
  }

  dimension_group: created_date {
    type: time
    sql: ${TABLE}.created_date ;;
  }

  dimension: duocliends_c {
    type: number
    sql: ${TABLE}.duocliends_c ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.owner_id ;;
  }

  dimension: painpoints_c {
    type: string
    sql: ${TABLE}.painpoints_c ;;
  }

  dimension: company_name_c {
    type: string
    sql: ${TABLE}.company_name_c ;;
  }

  dimension: invoice_reconciliation_responsibility_c {
    type: string
    sql: ${TABLE}.invoice_reconciliation_responsibility_c ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: pricebook_2_id {
    type: string
    sql: ${TABLE}.pricebook_2_id ;;
  }

  dimension: share_companies_25_employees_c {
    type: string
    sql: ${TABLE}.share_companies_25_employees_c ;;
  }

  dimension: stage_name {
    type: string
    sql: ${TABLE}.stage_name ;;
  }

  dimension: transaction_data_transfer_c {
    type: string
    sql: ${TABLE}.transaction_data_transfer_c ;;
  }

  dimension_group: uuid_ts {
    type: time
    sql: ${TABLE}.uuid_ts ;;
  }

  dimension: cash_ledger_c {
    type: string
    sql: ${TABLE}.cash_ledger_c ;;
  }

  dimension: information_request_responsibility_c {
    type: string
    sql: ${TABLE}.information_request_responsibility_c ;;
  }

  dimension: is_closed {
    type: string
    sql: ${TABLE}.is_closed ;;
  }

  dimension_group: last_viewed_date {
    type: time
    sql: ${TABLE}.last_viewed_date ;;
  }

  dimension: multiplier_stage_c {
    type: string
    sql: ${TABLE}.multiplier_stage_c ;;
  }

  dimension: other_tools_in_use_c {
    type: string
    sql: ${TABLE}.other_tools_in_use_c ;;
  }

  dimension: bob_folder_clients_c {
    type: number
    sql: ${TABLE}.bob_folder_clients_c ;;
  }

  dimension: subscription_plan_c {
    type: string
    sql: ${TABLE}.subscription_plan_c ;;
  }

  dimension: employees_c {
    type: number
    sql: ${TABLE}.employees_c ;;
  }

  dimension: has_opportunity_line_item {
    type: string
    sql: ${TABLE}.has_opportunity_line_item ;;
  }

  dimension: practice_digitzies_invoices_c {
    type: string
    sql: ${TABLE}.practice_digitzies_invoices_c ;;
  }

  dimension: share_digital_invoices_c {
    type: string
    sql: ${TABLE}.share_digital_invoices_c ;;
  }

  dimension: demo_booked_c {
    type: string
    sql: ${TABLE}.demo_booked_c ;;
  }

  dimension: hrneed_for_new_employees_c {
    type: string
    sql: ${TABLE}.hrneed_for_new_employees_c ;;
  }

  dimension: contact_role_score_c {
    type: number
    sql: ${TABLE}.contact_role_score_c ;;
  }

  dimension: funnel_value_c {
    type: string
    sql: ${TABLE}.funnel_value_c ;;
  }

  dimension: multiplier_payment_conditions_c {
    type: string
    sql: ${TABLE}.multiplier_payment_conditions_c ;;
  }

  dimension: urgency_score_c {
    type: number
    sql: ${TABLE}.urgency_score_c ;;
  }

  dimension: company_size_score_c {
    type: number
    sql: ${TABLE}.company_size_score_c ;;
  }

  dimension: opportunity_score_c {
    type: number
    sql: ${TABLE}.opportunity_score_c ;;
  }

  dimension: competition_knowledge_c {
    type: string
    sql: ${TABLE}.competition_knowledge_c ;;
  }

  dimension: competitor_score_c {
    type: number
    sql: ${TABLE}.competitor_score_c ;;
  }

  dimension: decision_process_score_c {
    type: number
    sql: ${TABLE}.decision_process_score_c ;;
  }

  dimension: pain_definition_score_c {
    type: number
    sql: ${TABLE}.pain_definition_score_c ;;
  }

  dimension: invoice_volume_score_c {
    type: number
    sql: ${TABLE}.invoice_volume_score_c ;;
  }

  dimension: incoming_invoices_per_month_legacy_c {
    type: string
    sql: ${TABLE}.incoming_invoices_per_month_legacy_c ;;
  }

  dimension: company_details_structure_c {
    type: string
    sql: ${TABLE}.company_details_structure_c ;;
  }

  dimension: accounts_payable_process_c {
    type: string
    sql: ${TABLE}.accounts_payable_process_c ;;
  }

  dimension: decision_process_c {
    type: string
    sql: ${TABLE}.decision_process_c ;;
  }

  dimension: painpoint_notes_c {
    type: string
    sql: ${TABLE}.painpoint_notes_c ;;
  }

  dimension: demo_conclusion_c {
    type: string
    sql: ${TABLE}.demo_conclusion_c ;;
  }

  dimension: subscription_out_of_moneyback_c {
    type: string
    sql: ${TABLE}.subscription_out_of_moneyback_c ;;
  }

  dimension: buying_advantages_for_customer_c {
    type: string
    sql: ${TABLE}.buying_advantages_for_customer_c ;;
  }

  dimension: next_steps_c {
    type: string
    sql: ${TABLE}.next_steps_c ;;
  }

  dimension: subscription_out_of_trial_stage_c {
    type: string
    sql: ${TABLE}.subscription_out_of_trial_stage_c ;;
  }

  dimension: intro_c {
    type: string
    sql: ${TABLE}.intro_c ;;
  }

  dimension: probability_category_c {
    type: string
    sql: ${TABLE}.probability_category_c ;;
  }

  dimension: competition_notes_c {
    type: string
    sql: ${TABLE}.competition_notes_c ;;
  }

  dimension: text_process_c {
    type: string
    sql: ${TABLE}.text_process_c ;;
  }

  dimension: opportunity_channel_c {
    type: string
    sql: ${TABLE}.opportunity_channel_c ;;
  }

  dimension: sql_c {
    type: string
    sql: ${TABLE}.sql_c ;;
  }

  dimension: text_intro_c {
    type: string
    sql: ${TABLE}.text_intro_c ;;
  }

  dimension: text_next_steps_c {
    type: string
    sql: ${TABLE}.text_next_steps_c ;;
  }

  dimension: text_solution_match_c {
    type: string
    sql: ${TABLE}.text_solution_match_c ;;
  }

  dimension: opportunty_source_c {
    type: string
    sql: ${TABLE}.opportunty_source_c ;;
  }

  dimension_group: demo_done_date_c {
    type: time
    sql: ${TABLE}.demo_done_date_c ;;
  }

  dimension: gmi_notes_c {
    type: string
    sql: ${TABLE}.gmi_notes_c ;;
  }

  dimension: account_lead_method_c {
    type: string
    sql: ${TABLE}.account_lead_method_c ;;
  }

  dimension: opportunity_segment_c {
    type: string
    sql: ${TABLE}.opportunity_segment_c ;;
  }

  dimension: potential_smartbooks_c {
    type: number
    sql: ${TABLE}.potential_smartbooks_c ;;
  }

  dimension: potential_workflows_c {
    type: number
    sql: ${TABLE}.potential_workflows_c ;;
  }

  dimension: account_lead_engagement_c {
    type: string
    sql: ${TABLE}.account_lead_engagement_c ;;
  }

  dimension: subscription_id_c {
    type: string
    sql: ${TABLE}.subscription_id_c ;;
  }

  dimension: close_lost_reason_c {
    type: string
    sql: ${TABLE}.close_lost_reason_c ;;
  }

  dimension_group: reapproach_date_c {
    type: time
    sql: ${TABLE}.reapproach_date_c ;;
  }

  dimension: followup_owner_c {
    type: string
    sql: ${TABLE}.followup_owner_c ;;
  }

  dimension_group: demo_booked_date_c {
    type: time
    sql: ${TABLE}.demo_booked_date_c ;;
  }

  dimension: testgroup_for_upfront_payments_only_c {
    type: string
    sql: ${TABLE}.testgroup_for_upfront_payments_only_c ;;
  }

  dimension: industry_score_c {
    type: number
    sql: ${TABLE}.industry_score_c ;;
  }

  dimension: share_digital_invoices_score_c {
    type: number
    sql: ${TABLE}.share_digital_invoices_score_c ;;
  }

  dimension: avg_days_in_opp_funnel_c {
    type: number
    sql: ${TABLE}.avg_days_in_opp_funnel_c ;;
  }

  dimension: visited_content {
    type: string
    sql: ${TABLE}.visited_content ;;
  }

  set: detail {
    fields: [
      id,
      received_at_time,
      uuid,
      account_id,
      fiscal,
      probability,
      fiscal_quarter,
      has_overdue_task,
      incoming_invoices_per_month_c,
      amount,
      last_activity_date_time,
      last_referenced_date_time,
      total_bookkeeping_clients_c,
      blocking_features_notes_c,
      description,
      get_my_invoices_c,
      system_modstamp_time,
      created_by_id,
      demo_notes_c,
      lead_source,
      forecast_category_name,
      is_won,
      last_modified_by_id,
      check_demo_done_c,
      forecast_category,
      gmiaccount_email_c,
      invoice_creation_tool_c,
      preaccounting_c,
      product_expectations_c,
      accounting_tool_in_use_c,
      calendly_created_c,
      daysin_opportunity_funnel_c,
      industry_c,
      invoice_data_transfer_c,
      is_deleted,
      outgoing_invoices_per_month_c,
      close_date_time,
      duoexperience_c,
      email_c,
      last_modified_date_time,
      multiplier_account_c,
      next_step,
      opportunity_count_c,
      approval_workflow_c,
      net_mrr_c,
      product_acquisition_channel_c,
      bank_accounts_c,
      fiscal_year,
      has_open_activity,
      record_type_id,
      type,
      additional_company_names_c,
      blocking_features_c,
      created_date_time,
      duocliends_c,
      owner_id,
      painpoints_c,
      company_name_c,
      invoice_reconciliation_responsibility_c,
      name,
      pricebook_2_id,
      share_companies_25_employees_c,
      stage_name,
      transaction_data_transfer_c,
      uuid_ts_time,
      cash_ledger_c,
      information_request_responsibility_c,
      is_closed,
      last_viewed_date_time,
      multiplier_stage_c,
      other_tools_in_use_c,
      bob_folder_clients_c,
      subscription_plan_c,
      employees_c,
      has_opportunity_line_item,
      practice_digitzies_invoices_c,
      share_digital_invoices_c,
      demo_booked_c,
      hrneed_for_new_employees_c,
      contact_role_score_c,
      funnel_value_c,
      multiplier_payment_conditions_c,
      urgency_score_c,
      company_size_score_c,
      opportunity_score_c,
      competition_knowledge_c,
      competitor_score_c,
      decision_process_score_c,
      pain_definition_score_c,
      invoice_volume_score_c,
      incoming_invoices_per_month_legacy_c,
      company_details_structure_c,
      accounts_payable_process_c,
      decision_process_c,
      painpoint_notes_c,
      demo_conclusion_c,
      subscription_out_of_moneyback_c,
      buying_advantages_for_customer_c,
      next_steps_c,
      subscription_out_of_trial_stage_c,
      intro_c,
      probability_category_c,
      competition_notes_c,
      text_process_c,
      opportunity_channel_c,
      sql_c,
      text_intro_c,
      text_next_steps_c,
      text_solution_match_c,
      opportunty_source_c,
      demo_done_date_c_time,
      gmi_notes_c,
      account_lead_method_c,
      opportunity_segment_c,
      potential_smartbooks_c,
      potential_workflows_c,
      account_lead_engagement_c,
      subscription_id_c,
      close_lost_reason_c,
      reapproach_date_c_time,
      followup_owner_c,
      demo_booked_date_c_time,
      testgroup_for_upfront_payments_only_c,
      industry_score_c,
      share_digital_invoices_score_c,
      avg_days_in_opp_funnel_c,
      visited_content
    ]
  }
}
