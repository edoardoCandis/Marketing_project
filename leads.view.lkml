view: leads {
  sql_table_name: salesforce.leads ;;


# ---------------------- hidden measures -----------------------------

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: convert_lead_company_leads_c {
    hidden: yes
    type: yesno
    sql: ${TABLE}.convert_lead_company_leads_c ;;
  }

  dimension: converted_account_id {
    hidden: yes
    type: string
    sql: ${TABLE}.converted_account_id ;;
  }

  dimension: converted_contact_id {
    hidden: yes
    type: string
    sql: ${TABLE}.converted_contact_id ;;
  }

  dimension: converted_opportunity_id {
    hidden: yes
    type: string
    sql: ${TABLE}.converted_opportunity_id ;;
  }

  dimension: description {
    hidden: yes
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: dont_unqualify_lead_c {
    hidden: yes
    type: yesno
    sql: ${TABLE}.dont_unqualify_lead_c ;;
  }
  dimension: email_domain_c {
    hidden: yes
    type: string
    sql: ${TABLE}.email_domain_c ;;
  }
  dimension: owner_id {
    hidden: yes
    type: string
    sql: ${TABLE}.owner_id ;;
  }
  dimension: phone {
    hidden: yes
    type: string
    sql: ${TABLE}.phone ;;
  }
  dimension: salutation {
    hidden: yes
    type: string
    sql: ${TABLE}.salutation ;;
  }
  dimension: tracking_user_id_c {
    hidden: yes
    type: string
    sql: ${TABLE}.tracking_user_id_c ;;
  }

  dimension: country {
    type: string
    hidden: yes
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: created_by_id {
    hidden: yes
    type: string
    sql: ${TABLE}.created_by_id ;;
  }

  dimension: accounting_tool_in_use_c {
    type: string
    sql: ${TABLE}.accounting_tool_in_use_c ;;
  }

  dimension: affiliate_publisher_id_c {
    type: string
    sql: ${TABLE}.affiliate_publisher_id_c ;;
  }

  dimension: afilliate_c {
    type: string
    sql: ${TABLE}.afilliate_c ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: company_size_score_c {
    type: number
    sql: ${TABLE}.company_size_score_c ;;
  }

  dimension: contact_hierarchy_c {
    type: string
    sql: ${TABLE}.contact_hierarchy_c ;;
  }

  dimension: contacted_via_social_network_c {
    type: yesno
    sql: ${TABLE}.contacted_via_social_network_c ;;
  }


  dimension_group: converted {
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
    sql: ${TABLE}.converted_date ;;
  }

  dimension: count_leadactivities_c {
    type: number
    sql: ${TABLE}.count_leadactivities_c ;;
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

  dimension: decisionmaker_c {
    type: yesno
    sql: ${TABLE}.decisionmaker_c ;;
  }

  dimension: decisionmaker_score_c {
    type: number
    sql: ${TABLE}.decisionmaker_score_c ;;
  }


  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }



  dimension_group: expected_close_date_c {
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
    sql: ${TABLE}.expected_close_date_c ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: iace_branche_c {
    type: number
    sql: ${TABLE}.iace_branche_c ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}.industry ;;
  }

  dimension: is_converted {
    type: yesno
    sql: ${TABLE}.is_converted ;;
  }

  dimension: is_deleted {
    hidden: yes
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }


  dimension: landingpage_url_c {
    type: string
    sql: ${TABLE}.landingpage_url_c ;;
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

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: last_page_seen_url_c {
    type: string
    sql: ${TABLE}.last_page_seen_url_c ;;
  }

  dimension: last_referring_site_url_c {
    type: string
    sql: ${TABLE}.last_referring_site_url_c ;;
  }

  dimension: lead_campaign_c {
    type: string
    sql: ${TABLE}.lead_campaign_c ;;
  }

  dimension: lead_channel_grouping_c {
    type: string
    sql: ${TABLE}.lead_channel_grouping_c ;;
  }

  dimension: lead_company_c {
    type: string
    sql: ${TABLE}.lead_company_c ;;
  }

  dimension: lead_creation_score_c {
    type: number
    sql: ${TABLE}.lead_creation_score_c ;;
  }

  dimension: lead_engagement_c {
    type: string
    sql: ${TABLE}.lead_engagement_c ;;
  }

  dimension: lead_interest_score_c {
    type: number
    sql: ${TABLE}.lead_interest_score_c ;;
  }

  dimension: lead_method_c {
    type: string
    sql: ${TABLE}.lead_method_c ;;
  }

  dimension: lead_owner_name_c {
    type: string
    sql: ${TABLE}.lead_owner_name_c ;;
  }

  dimension: lead_position_score_c {
    type: number
    sql: ${TABLE}.lead_position_score_c ;;
  }

  dimension: lead_segment_c {
    type: string
    sql: ${TABLE}.lead_segment_c ;;
  }

  dimension: lead_source {
    type: string
    sql: ${TABLE}.lead_source ;;
  }

  dimension: lead_source_referrer_c {
    type: string
    sql: ${TABLE}.lead_source_referrer_c ;;
  }


  dimension: main_lead_c {
    hidden: yes
    type: string
    sql: ${TABLE}.main_lead_c ;;
  }

  dimension: monthly_invoice_volume_c {
    type: number
    sql: ${TABLE}.monthly_invoice_volume_c ;;
  }

  dimension: mql_c {
    type: yesno
    sql: ${TABLE}.mql_c ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: number_of_employees {
    type: number
    sql: ${TABLE}.number_of_employees ;;
  }

  dimension: position_c {
    type: string
    sql: ${TABLE}.position_c ;;
  }

  dimension: priority_lead_c {
    type: yesno
    sql: ${TABLE}.priority_lead_c ;;
  }

  dimension: product_acquisition_channel_c {
    type: string
    sql: ${TABLE}.product_acquisition_channel_c ;;
  }


  dimension: response_c {
    type: string
    sql: ${TABLE}.response_c ;;
  }

  dimension: sql_c {
    type: yesno
    sql: ${TABLE}.sql_c ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: total_leadscore_c {
    type: number
    sql: ${TABLE}.total_leadscore_c ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}.website ;;
  }

  measure: count {
    type: count
    drill_fields: [id, last_name, first_name, name]
  }
}
