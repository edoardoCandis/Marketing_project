view: accounts {
  sql_table_name: salesforce.accounts ;;


# ----------------- hidden measures ---------------
  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: account_channel_c {
    type: string
    hidden: yes
    sql: ${TABLE}.account_channel_c ;;
  }


  dimension: owner_id {
    hidden: yes
    type: string
    sql: ${TABLE}.owner_id ;;
  }

  dimension: parent_id {
    hidden: yes
    type: string
    sql: ${TABLE}.parent_id ;;
  }

  dimension: partner_landingpage_c {
    hidden: yes
    type: string
    sql: ${TABLE}.partner_landingpage_c ;;
  }

  dimension: partner_network_status_c {
    hidden: yes
    type: string
    sql: ${TABLE}.partner_network_status_c ;;
  }

  dimension: payment_conditions_for_clients_c {
    hidden: yes
    type: string
    sql: ${TABLE}.payment_conditions_for_clients_c ;;
  }

  dimension: record_type_id {
    hidden: yes
    type: string
    sql: ${TABLE}.record_type_id ;;
  }
  dimension: referral_child_accounts_c {
    hidden: yes
    type: yesno
    sql: ${TABLE}.referral_child_accounts_c ;;
  }

  dimension: billing_city {
    hidden: yes
    type: string
    sql: ${TABLE}.billing_city ;;
  }

  dimension: billing_country {
    hidden: yes
    type: string
    sql: ${TABLE}.billing_country ;;
  }

  dimension: client_onboarding_c {
    hidden: yes
    # this is kinda legacy. we give an onboarding to everybody
    type: yesno
    sql: ${TABLE}.client_onboarding_c ;;
  }

  dimension: converted_lead_owner_c {
    hidden: yes
    # used for merging the lead owner
    type: string
    sql: ${TABLE}.converted_lead_owner_c ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_date ;;
  }

  dimension: dashboard_link_c {
    hidden: yes
    type: string
    sql: ${TABLE}.dashboard_link_c ;;
  }

  dimension: description {
    hidden: yes
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: domain_c {
    hidden: yes
    type: string
    sql: ${TABLE}.domain_c ;;
  }
  dimension: is_deleted {
    hidden: yes
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: annual_revenue {
    hidden: yes
    # standart salesforce field, not used currently
    type: string
    sql: ${TABLE}.annual_revenue ;;
  }

  dimension: billing_method_c {
    hidden: yes
    type: string
    sql: ${TABLE}.billing_method_c ;;
  }

  dimension: converted_lead_channel_c {
    hidden: yes
    type: string
    sql: ${TABLE}.converted_lead_channel_c ;;
  }

  dimension: tax_advisor_stage_c {
    hidden: yes
    type: string
    sql: ${TABLE}.tax_advisor_stage_c ;;
  }

  dimension: total_mrr_c {
    hidden: yes
    type: string
    sql: ${TABLE}.total_mrr_c ;;
  }

  dimension: count_open_opportunities_c {
    hidden: yes
    type: number
    sql: ${TABLE}.count_open_opportunities_c ;;
  }

  dimension: created_by_id {
    hidden: yes
    type: string
    sql: ${TABLE}.created_by_id ;;
  }

  dimension: acm_c {
    hidden: yes
    type: string
    sql: ${TABLE}.acm_c ;;
  }


  dimension: converted_lead_owner_id_c {
    hidden: yes
    # exists to join users
    type: string
    sql: ${TABLE}.converted_lead_owner_id_c ;;
  }

  dimension: lead_channel_grouping_c {
    hidden: yes
    type: string
    sql: ${TABLE}.lead_channel_grouping_c ;;
  }

  dimension: lead_landing_page_url_c {
    hidden: yes
    type: string
    sql: ${TABLE}.lead_landing_page_url_c ;;
  }

  dimension: lead_last_referring_site_url_c {
    hidden: yes
    type: string
    sql: ${TABLE}.lead_last_referring_site_url_c ;;
  }

  dimension: master_record_id {
    hidden: yes
    type: string
    sql: ${TABLE}.master_record_id ;;
  }

  dimension: type {
    hidden: yes
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: website {
    hidden: yes
    type: string
    sql: ${TABLE}.website ;;
  }

  dimension: winback_score_c {
    hidden: yes
    type: number
    sql: ${TABLE}.winback_score_c ;;
  }

  dimension: multiplier_payment_conditions_c {
    hidden: yes
    type: string
    sql: ${TABLE}.multiplier_payment_conditions_c ;;
  }
  dimension: taxadvisor_client_process_c {
    hidden: yes
    type: yesno
    sql: ${TABLE}.taxadvisor_client_process_c ;;
  }

  dimension: total_bookkeeping_clients_c {
    hidden: yes
    type: number
    sql: ${TABLE}.total_bookkeeping_clients_c ;;
  }

# ------------------------------- source data -----------------------
  dimension: secondary_medium_c {
    hidden: yes
    # reattribution
    type: string
    sql: ${TABLE}.secondary_medium_c ;;
  }

  dimension: converted_lead_engagement_c {
    hidden: yes
    # taken from reattribution
    type: string
    sql: ${TABLE}.converted_lead_engagement_c ;;
  }
  dimension: account_source {
    hidden: yes
    # taken from reattribution
    type: string
    sql: ${TABLE}.account_source ;;
  }

  dimension: converted_lead_source_c {
    hidden: yes
    # taken from account sources
    type: string
    sql: ${TABLE}.converted_lead_source_c ;;
  }

  dimension: converted_lead_campaign_c {
    hidden: yes
    type: string
    sql: ${TABLE}.converted_lead_campaign_c ;;
  }


#------------------ dimensions in use ------------------------

  dimension: industry {
    type: string
    sql: ${TABLE}.industry ;;
  }

  dimension: internal_bookkeeping_c {
    type: yesno
    sql: ${TABLE}.internal_bookkeeping_c ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: number_of_employees {
    type: number
    sql: ${TABLE}.number_of_employees ;;
  }

  dimension: referral_account_c {
    label: "Multiplier Client ?"
    description: "Yes if Account Multiplier is known & active"
    type: yesno
    sql: ${TABLE}.referral_account_c ;;
  }

  dimension: account_status_c {
    type: string
    sql: ${TABLE}.account_status_c ;;
  }

  dimension: accounting_tool_in_use_c {
    type: string
    sql: ${TABLE}.accounting_tool_in_use_c ;;
  }

  dimension: active_child_accounts_c {
    label: "Active Sub-Accounts"
    description: "e.g. tax advisor clients"
    type: number
    sql: ${TABLE}.active_child_accounts_c ;;
  }

  dimension: converted_lead_method_c {
    type: string
    sql: ${TABLE}.converted_lead_method_c ;;
  }

  dimension: converted_lead_response_c {
    type: string
    sql: ${TABLE}.converted_lead_response_c ;;
  }

  dimension: count_presales_c {
    label: "Presales Lead Conversion (yes/no)"
    description: "Presales Team has been actively engaged to convert this Lead."
    type: yesno
    sql:CASE WHEN ${TABLE}.count_presales_c=1 THEN true ELSE false END ;;
  }

  dimension: secondary_referrer_c {
    type: string
    sql: ${TABLE}.secondary_referrer_c ;;
  }

  dimension: candis_companies_c {
    label: "Number of active CANDIS Accounts"
    type: number
    sql: ${TABLE}.candis_companies_c ;;
  }

  dimension: count_active_subscriptions_c {
    type: number
    sql: ${TABLE}.count_active_subscriptions_c ;;
  }

# ---------------- measures ---------------------

  measure: count {
    type: count
    drill_fields: [id, name, opportunities.count]
  }

  measure: overall_account_nps_c {
    type: average
    sql: ${TABLE}.overall_account_nps_c ;;
  }

  measure: gross_mrr_c {
    hidden: yes
    type: sum
    value_format_name: eur
    sql: ${TABLE}.gross_mrr_c ;;
  }

  measure: mrr_c {
    hidden: yes
    type: sum
    value_format_name: eur
    sql: ${TABLE}.mrr_c ;;
  }


  set: multiplier_fields {
    fields: [
      id,
      name,
      active_child_accounts_c,
      account_status_c
    ]
  }
}
