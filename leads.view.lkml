view: leads {
  sql_table_name: salesforce.leads ;;


# ---------------------- hidden measures -----------------------------

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
    link: {
      label: "View in Salesforce"
      url: "https://eu16.lightning.force.com/lightning/r/lead/{{value}}/view"
    }
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
    # this should not be in use since not every converted lead is associated to an opportunity
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

  dimension: private_domain {
    label: "Private Email Domain"
    type: yesno
    sql: CASE WHEN ${email_domain_c} IS NULL THEN true ELSE false END ;;
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

  dimension: affiliate_publisher_id_c {
    group_label: "Source Information"
    hidden: yes
    type: string
    sql: ${TABLE}.affiliate_publisher_id_c ;;
  }

  dimension: afilliate_c {
    hidden: yes
    group_label: "Source Information"
    type: string
    sql: ${TABLE}.afilliate_c ;;
  }

  dimension: last_page_seen_url_c {
    hidden: yes
    group_label: "Source Information"
    type: string
    sql: ${TABLE}.last_page_seen_url_c ;;
  }

  dimension: last_referring_site_url_c {
    hidden: yes
    group_label: "Source Information"
    type: string
    sql: ${TABLE}.last_referring_site_url_c ;;
  }

  dimension: lead_campaign_c {
    hidden: yes
    group_label: "Source Information"
    type: string
    sql: ${TABLE}.lead_campaign_c ;;
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
    label: "Decisionmaker"
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
    label: "Lead converted"
    sql: ${TABLE}.is_converted ;;
  }
  dimension: accounting_tool_in_use_c {
    group_label: "Company Information"
    type: string
    sql: ${TABLE}.accounting_tool_in_use_c ;;
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

  dimension: lead_engagement_c {
    label: "Interest Category"
    description: "active interest=Warmcall, passive&no interest=Coldcall"
    group_label: "Source Information"
    type: string
    sql: CASE WHEN ${TABLE}.lead_engagement_c='active interest' THEN 'Warmcall' ELSE 'Coldcall' END ;;
  }

  dimension: lead_method_c {
    group_label: "Source Information"
    label: "Lead Method"
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
    label: "MQL"
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
    label: "Priority Lead"
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
    label: "SQL"
    sql: ${TABLE}.sql_c ;;
  }

  dimension: prequalified {
    type: yesno
    label: "Prequalified"
    sql: ${TABLE}.prequalified_c ;;
  }

  dimension_group: prequalified_date {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.prequalified_date_c;;
  }

  dimension: status {
    type: string
    sql: lower(${TABLE}.status) ;;
  }

  dimension: unqualified_reason {
    type: string
    sql: ${TABLE}.unqualified_reason_c ;;
  }

  dimension: presales_content_approach {
    type: string
    sql: ${TABLE}.presales_content_approach_c ;;
  }


  dimension: group {
    #WHEN ${status} IN ('prospect','prequalified') THEN 'new'
    description: "targeted vs. prequalified vs. new"
    type: string
    sql: CASE WHEN ${status} NOT IN ('prospect','prequalified') AND ${lead_owner.user_role}='Presales' THEN 'targeted'
              WHEN ${prequalified} THEN 'prequalified'
              ELSE 'other' END;;
  }

  dimension: total_leadscore_c {
    group_label: "Scoring Information"
    type: number
    sql: ${TABLE}.total_leadscore_c ;;
  }

  dimension: lead_count_adjusted {
    type: string
    hidden: yes
    # this is the count we use in every measure.
    sql: CASE WHEN ${lead_company_c} IS NULL THEN ${id} ELSE ${lead_company_c} END ;;
  }

#dimension: final_source {
  # type: string
  # sql: CASE WHEN ${lead_source} IS NOT NULL THEN lower(${lead_source})
#  WHEN ${lead_source_referrer_c} IS NOT NULL THEN lower(${lead_source_referrer_c})
#  ELSE lower(${fact_account_sources.grouping_source}) END;;
#}

# ---------------- measures -----------------

  measure: count {
    label: "Total Leads"
    description: "This shouldnt really be used. We care about Distinct Leads"
    type: count
    drill_fields: [id, last_name, first_name,email]
  }

  measure: count_distinct_leads {
    label: "Total Lead Companies"
    description: "Lead Companies"
    type: count_distinct
    sql: CASE WHEN ${lead_company_c} IS NULL THEN ${id} ELSE ${lead_company_c} END ;;
    drill_fields: [id, last_name, first_name,email]
  }

  measure: CR_0.5 {
    # we reference the booked from the opportunities table that is joined in the explore and divide by the unique leads
    label: "CR 0.5"
    description: "Prequalified -> Demo Booked"
    type: number
    value_format_name: percent_0
    sql:  CAST(${converted_account_opportunity.booked_demos} as float4) / ${count_distinct_leads}  ;;
  }

  measure: time_to_prequalify {
    type: average
    value_format_name: decimal_2
    sql: CAST(DATEDIFF('Days',${created_date} ,${prequalified_date_date}) as float4);;
    filters: {
      field: prequalified
      value: "yes"
    }
  }

  measure: time_to_convert {
    label: "Total Time to Convert (Days)"
    type: average
    value_format_name: decimal_0
    sql: CASE WHEN ${prequalified_date_date} IS NULL THEN DATEDIFF('Days', ${prequalified_date_date},${converted_date})
      ELSE DATEDIFF('Days', ${created_date},${converted_date}) END ;;

    filters: {
      field: status
      value: "demo requested"

    }
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
