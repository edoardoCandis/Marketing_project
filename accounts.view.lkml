view: accounts {
  sql_table_name: salesforce.accounts ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: account_channel_c {
    type: string
#     hidden: yes
    sql: ${TABLE}.account_channel_c ;;
  }

  dimension: account_segment_c {
    type: string
    sql: ${TABLE}.account_segment_c ;;
  }

  dimension: account_source {
    type: string
    sql: ${TABLE}.account_source ;;
  }

  dimension: account_status_c {
    type: string
    sql: ${TABLE}.account_status_c ;;
  }

  dimension: accounting_tool_in_use_c {
    type: string
    sql: ${TABLE}.accounting_tool_in_use_c ;;
  }

  dimension: acm_c {
    type: string
    sql: ${TABLE}.acm_c ;;
  }

  dimension: active_child_accounts_c {
    type: number
    sql: ${TABLE}.active_child_accounts_c ;;
  }

  dimension: annual_revenue {
    type: string
    sql: ${TABLE}.annual_revenue ;;
  }

  dimension_group: becamea_customer_date_c {
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
    sql: ${TABLE}.becamea_customer_date_c ;;
  }

  dimension: billing_city {
    type: string
    sql: ${TABLE}.billing_city ;;
  }

  dimension: billing_country {
    type: string
    sql: ${TABLE}.billing_country ;;
  }

  dimension: billing_method_c {
    type: string
    sql: ${TABLE}.billing_method_c ;;
  }

  dimension: billing_postal_code {
    type: string
    sql: ${TABLE}.billing_postal_code ;;
  }

  dimension: billing_state {
    type: string
    sql: ${TABLE}.billing_state ;;
  }

  dimension: billing_street {
    type: string
    sql: ${TABLE}.billing_street ;;
  }

  dimension: booking_url_legacy_c {
    type: string
    sql: ${TABLE}.booking_url_legacy_c ;;
  }

  dimension: candis_companies_c {
    type: number
    sql: ${TABLE}.candis_companies_c ;;
  }

  dimension_group: churn_date_c {
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
    sql: ${TABLE}.churn_date_c ;;
  }

  dimension: churn_reason_c {
    type: string
    sql: ${TABLE}.churn_reason_c ;;
  }

  dimension: churnreason_additional_information_c {
    type: string
    sql: ${TABLE}.churnreason_additional_information_c ;;
  }

  dimension: client_group_c {
    type: string
    sql: ${TABLE}.client_group_c ;;
  }

  dimension: client_onboarding_c {
    type: yesno
    sql: ${TABLE}.client_onboarding_c ;;
  }

  dimension: converted_lead_campaign_c {
    type: string
    sql: ${TABLE}.converted_lead_campaign_c ;;
  }

  dimension: converted_lead_channel_c {
    type: string
    sql: ${TABLE}.converted_lead_channel_c ;;
  }

  dimension: converted_lead_engagement_c {
    type: string
    sql: ${TABLE}.converted_lead_engagement_c ;;
  }

  dimension: converted_lead_method_c {
    type: string
    sql: ${TABLE}.converted_lead_method_c ;;
  }

  dimension: converted_lead_owner_c {
    type: string
    sql: ${TABLE}.converted_lead_owner_c ;;
  }

  dimension: converted_lead_response_c {
    type: string
    sql: ${TABLE}.converted_lead_response_c ;;
  }

  dimension: converted_lead_source_c {
    type: string
    sql: ${TABLE}.converted_lead_source_c ;;
  }

  dimension: count_active_subscriptions_c {
    type: number
    sql: ${TABLE}.count_active_subscriptions_c ;;
  }

  dimension: count_open_opportunities_c {
    type: number
    sql: ${TABLE}.count_open_opportunities_c ;;
  }

  dimension: count_presales_c {
    label: "is presales Lead Conversion ?"
    type: yesno
    sql:CASE WHEN ${TABLE}.count_presales_c=1 THEN true ELSE false END ;;
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
      year
    ]
    sql: ${TABLE}.created_date ;;
  }

  dimension: dashboard_link_c {
    type: string
    sql: ${TABLE}.dashboard_link_c ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: domain_c {
    type: string
    sql: ${TABLE}.domain_c ;;
  }

  dimension_group: end_of_moneyback_c {
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
    sql: ${TABLE}.end_of_moneyback_c ;;
  }

  dimension: gross_mrr_c {
    type: number
    sql: ${TABLE}.gross_mrr_c ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}.industry ;;
  }

  dimension: internal_bookkeeping_c {
    type: yesno
    sql: ${TABLE}.internal_bookkeeping_c ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: lead_channel_drilldown_info_1_c {
    type: string
    sql: ${TABLE}.lead_channel_drilldown_info_1_c ;;
  }

  dimension: lead_channel_drilldown_info_2_c {
    type: string
    sql: ${TABLE}.lead_channel_drilldown_info_2_c ;;
  }

  dimension: lead_channel_grouping_c {
    type: string
    sql: ${TABLE}.lead_channel_grouping_c ;;
  }

  dimension: lead_landing_page_url_c {
    type: string
    sql: ${TABLE}.lead_landing_page_url_c ;;
  }

  dimension: lead_last_referring_site_url_c {
    type: string
    sql: ${TABLE}.lead_last_referring_site_url_c ;;
  }

  dimension: master_record_id {
    type: string
    sql: ${TABLE}.master_record_id ;;
  }

  dimension: mrr_c {
    type: number
    sql: ${TABLE}.mrr_c ;;
  }

  dimension: multiplier_payment_conditions_c {
    type: string
    sql: ${TABLE}.multiplier_payment_conditions_c ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: number_of_employees {
    type: number
    sql: ${TABLE}.number_of_employees ;;
  }

  dimension: overall_account_nps_c {
    type: number
    sql: ${TABLE}.overall_account_nps_c ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.owner_id ;;
  }

  dimension: parent_id {
    type: string
    sql: ${TABLE}.parent_id ;;
  }

  dimension: partner_landingpage_c {
    type: string
    sql: ${TABLE}.partner_landingpage_c ;;
  }

  dimension: partner_network_status_c {
    type: string
    sql: ${TABLE}.partner_network_status_c ;;
  }

  dimension: payment_conditions_for_clients_c {
    type: string
    sql: ${TABLE}.payment_conditions_for_clients_c ;;
  }

  dimension: payment_conditions_legacy_c {
    type: string
    sql: ${TABLE}.payment_conditions_legacy_c ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: photo_url {
    type: string
    sql: ${TABLE}.photo_url ;;
  }

  dimension: products_legacy_c {
    type: string
    sql: ${TABLE}.products_legacy_c ;;
  }

  dimension: record_type_id {
    type: string
    sql: ${TABLE}.record_type_id ;;
  }

  dimension: referral_account_c {
    type: yesno
    sql: ${TABLE}.referral_account_c ;;
  }

  dimension: referral_child_accounts_c {
    type: yesno
    sql: ${TABLE}.referral_child_accounts_c ;;
  }

  dimension: referral_source_legacy_c {
    type: string
    sql: ${TABLE}.referral_source_legacy_c ;;
  }

  dimension: secondary_medium_c {
    type: string
    sql: ${TABLE}.secondary_medium_c ;;
  }

  dimension: secondary_referrer_c {
    type: string
    sql: ${TABLE}.secondary_referrer_c ;;
  }

  dimension: tax_advisor_stage_c {
    type: string
    sql: ${TABLE}.tax_advisor_stage_c ;;
  }

  dimension: taxadvisor_client_process_c {
    type: yesno
    sql: ${TABLE}.taxadvisor_client_process_c ;;
  }

  dimension: total_bookkeeping_clients_c {
    type: number
    sql: ${TABLE}.total_bookkeeping_clients_c ;;
  }

  dimension: total_mrr_c {
    type: string
    sql: ${TABLE}.total_mrr_c ;;
  }

  dimension: converted_lead_owner_id_c {
    hidden: yes
    # exists to join users
    type: string
    sql: ${TABLE}.converted_lead_owner_id_c ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
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

  dimension: website {
    type: string
    sql: ${TABLE}.website ;;
  }

  dimension: winback_score_c {
    type: number
    sql: ${TABLE}.winback_score_c ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, opportunities.count]
  }
}
