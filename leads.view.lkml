view: leads {
  sql_table_name: salesforce.leads ;;


# ---------------------- hidden measures -----------------------------

  dimension: id {
    primary_key: yes
    hidden: yes
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

  dimension: iace_branche_c {
    hidden: yes
    # not used currently
    type: number
    sql: ${TABLE}.iace_branche_c ;;
  }

  dimension: email {
    hidden: yes
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension_group: expected_close_date_c {
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
    sql: ${TABLE}.expected_close_date_c ;;
  }

  dimension: first_name {
    hidden: yes
    type: string
    sql: ${TABLE}.first_name ;;
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

  dimension: company {
    hidden: yes
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: contact_hierarchy_c {
    hidden: yes
    type: string
    sql: ${TABLE}.contact_hierarchy_c ;;
  }

  dimension: title {
    hidden: yes
    type: string
    sql: ${TABLE}.title ;;
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

  dimension: lead_company_c {
    hidden: yes
    type: string
    sql: ${TABLE}.lead_company_c ;;
  }

  dimension: main_lead_c {
    hidden: yes
    type: string
    sql: ${TABLE}.main_lead_c ;;
  }

  dimension: name {
    hidden: yes
    type: string
    sql: ${TABLE}.name ;;
  }


  dimension: last_name {
    hidden: yes
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: is_deleted {
    hidden: yes
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: website {
    hidden: yes
    type: string
    sql: ${TABLE}.website ;;
  }

# ----------------- dimensions in use -------------------

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
    label: "Number of Calls"
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
    label: "Decisionmaker (yes/no)"
    description: "Is the Lead the Decisionmaker?"
    type: yesno
    sql: ${TABLE}.decisionmaker_c ;;
  }

  dimension: decisionmaker_score_c {
    group_label: "Scoring Information"
    type: number
    sql: ${TABLE}.decisionmaker_score_c ;;
  }

  dimension: company_size_score_c {
    group_label: "Scoring Information"
    type: number
    sql: ${TABLE}.company_size_score_c ;;
  }

  dimension: industry {
    group_label:"Company Information"
    type: string
    sql: ${TABLE}.industry ;;
  }

  dimension: is_converted {
    type: yesno
    label: "Lead converted (yes/no)"
    sql: ${TABLE}.is_converted ;;
  }
  dimension: accounting_tool_in_use_c {
    group_label: "Company Information"
    type: string
    sql: ${TABLE}.accounting_tool_in_use_c ;;
  }

  dimension: affiliate_publisher_id_c {
    group_label: "Source Information"
    type: string
    sql: ${TABLE}.affiliate_publisher_id_c ;;
  }

  dimension: afilliate_c {
    group_label: "Source Information"
    type: string
    sql: ${TABLE}.afilliate_c ;;
  }

  dimension: landingpage_url_c {
    group_label: "Source Information"
    type: string
    sql: ${TABLE}.landingpage_url_c ;;
  }

dimension: idle_time {
  label: "Time since last Lead Activity (weeks)"
  description: "Days since somebody has done any changes to the lead"
  type: tier
  sql: current_date-${last_activity_date} ;;
  tiers: [0,7,14,21,30]
  style: integer

}

  dimension: last_page_seen_url_c {
    group_label: "Source Information"
    type: string
    sql: ${TABLE}.last_page_seen_url_c ;;
  }

  dimension: last_referring_site_url_c {
    group_label: "Source Information"
    type: string
    sql: ${TABLE}.last_referring_site_url_c ;;
  }

  dimension: lead_campaign_c {
    group_label: "Source Information"
    type: string
    sql: ${TABLE}.lead_campaign_c ;;
  }

  dimension: lead_engagement_c {
    group_label: "Source Information"
    type: string
    sql: ${TABLE}.lead_engagement_c ;;
  }
  dimension: lead_method_c {
    group_label: "Source Information"
    type: string
    sql: ${TABLE}.lead_method_c ;;
  }

  dimension: lead_source {
    group_label: "Source Information"
    type: string
    sql: ${TABLE}.lead_source ;;
  }

  dimension: lead_source_referrer_c {
    group_label: "Source Information"
    type: string
    sql: ${TABLE}.lead_source_referrer_c ;;
  }

  dimension: lead_creation_score_c {
    group_label: "Scoring Information"
    type: number
    sql: ${TABLE}.lead_creation_score_c ;;
  }

  dimension: lead_interest_score_c {
    group_label: "Scoring Information"
    type: number
    sql: ${TABLE}.lead_interest_score_c ;;
  }


  dimension: lead_position_score_c {
    group_label: "Scoring Information"
    type: number
    sql: ${TABLE}.lead_position_score_c ;;
  }

  dimension: lead_segment_c {
    label: "Lead Type "
    description: "Company/Multiplier"
    type: string
    sql: ${TABLE}.lead_segment_c ;;
  }

  dimension: monthly_invoice_volume_c {
    group_label:"Company Information"
    label: "Monthly Invoices"
    type: number
    sql: ${TABLE}.monthly_invoice_volume_c ;;
  }

  dimension: mql_c {
    type: yesno
    label: "MQL (yes/no)"
    description: "Is the Lead a MarketingQualifiedLead"
    sql: ${TABLE}.mql_c ;;
  }

  dimension: number_of_employees {
    group_label:"Company Information"
    type: number
    sql: ${TABLE}.number_of_employees ;;
  }

  dimension: position_c {
    label: "Position"
    type: string
    sql: ${TABLE}.position_c ;;
  }

  dimension: priority_lead_c {
    label: "Priority Lead (yes/no)"
    type: yesno
    sql: ${TABLE}.priority_lead_c ;;
  }

  dimension: product_acquisition_channel_c {
    label: "Product"
    type: string
    sql: ${TABLE}.product_acquisition_channel_c ;;
  }

  dimension: response_c {
    group_label: "Source Information"
    type: string
    sql: ${TABLE}.response_c ;;
  }

  dimension: sql_c {
    type: yesno
    label: "SQL (yes/no)"
    sql: ${TABLE}.sql_c ;;
  }

  dimension: status {
    type: string
    sql: lower(${TABLE}.status) ;;
  }

  dimension: group {
    description: "targeted vs. new"
    type: string
    sql: CASE WHEN ${status} NOT IN ('prospect','prequalified') AND ${lead_owner.user_role}='Presales' THEN 'targeted'
              WHEN ${status} IN ('prospect','prequalified') THEN 'new'
              ELSE 'other' END;;
  }

  dimension: total_leadscore_c {
    group_label: "Scoring Information"
    type: number
    sql: ${TABLE}.total_leadscore_c ;;
  }

# ---------------- measures -----------------

  measure: count {
    label: "Total"
    type: count
    drill_fields: [id, last_name, first_name,email]
  }

  measure: average_calls {
    label: "Average Calls"
    description: "Excludes 0,NULL"
    type: average
    sql: ${count_leadactivities_c};;
    filters: {
      field: count_leadactivities_c
      value: ">0"
    }
  }

  set: personal_information {
    fields: [
      id,
      last_name,
      first_name,
      email,
      title,
      contact_hierarchy_c,
      website,
      company,
      last_activity_date
    ]
  }
}
