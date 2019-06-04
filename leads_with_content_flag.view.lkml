view: leads_with_content_flag {
  derived_table: {
    sql: with content_visit as(
        select distinct user_id,
        min(received_at) as visit_date
        from candis_website.pages
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
l.*,
CASE WHEN l.created_date >= v.visit_date THEN l.id ELSE NULL END AS visited_content
from salesforce.leads l
left join content_visit v on l.tracking_user_id_c = v.user_id
 ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: received_at {
    type: time
    sql: ${TABLE}.received_at ;;
  }

  dimension: uuid {
    hidden: yes
    type: number
    sql: ${TABLE}.uuid ;;
  }

  dimension: calendly_event_type_name_c {
    hidden: yes
    type: string
    sql: ${TABLE}.calendly_event_type_name_c ;;
  }

  dimension_group: uuid_ts {
    hidden: yes
    type: time
    sql: ${TABLE}.uuid_ts ;;
  }

  dimension: lead_channel_c {
    type: string
    sql: ${TABLE}.lead_channel_c ;;
  }

  dimension: name {
    hidden: yes
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: contacted_via_social_network_c {
    type: string
    sql: ${TABLE}.contacted_via_social_network_c ;;
  }

  dimension: ipcountry_c {
    hidden: yes
    type: string
    sql: ${TABLE}.ipcountry_c ;;
  }

  dimension: legacy_hubspot_contact_id_c {
    hidden: yes
    type: string
    sql: ${TABLE}.legacy_hubspot_contact_id_c ;;
  }

  dimension: postal_code {
    hidden: yes
    type: string
    sql: ${TABLE}.postal_code ;;
  }

  dimension: lead_source {

    type: string
    sql: ${TABLE}.lead_source ;;
  }

  dimension: afilliate_c {
    hidden: yes
    type: string
    sql: ${TABLE}.afilliate_c ;;
  }

  dimension: lead_channel_drilldown_info_1_c {
    hidden: yes
    type: string
    sql: ${TABLE}.lead_channel_drilldown_info_1_c ;;
  }

  dimension: last_referring_site_url_c {

    type: string
    sql: ${TABLE}.last_referring_site_url_c ;;
  }

  dimension: street {
    hidden: yes
    type: string
    sql: ${TABLE}.street ;;
  }

  dimension: title {
    hidden: yes
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: city {
    hidden: yes
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: description {
    hidden: yes
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: lead_count_c {
    hidden: yes
    type: number
    sql: ${TABLE}.lead_count_c ;;
  }

  dimension: number_of_employees {

    type: number
    sql: ${TABLE}.number_of_employees ;;
  }

  dimension_group: system_modstamp {
    hidden: yes
    type: time
    sql: ${TABLE}.system_modstamp ;;
  }

  dimension: calendly_email_match_for_opp_c {
    hidden: yes
    type: string
    sql: ${TABLE}.calendly_email_match_for_opp_c ;;
  }

  dimension: created_by_id {
    hidden: yes
    type: string
    sql: ${TABLE}.created_by_id ;;
  }

  dimension: ipcity_c {
    hidden: yes
    type: string
    sql: ${TABLE}.ipcity_c ;;
  }

  dimension_group: last_activity_date {


    hidden: yes
    type: time
    sql: ${TABLE}.last_activity_date ;;
  }

  dimension: lead_channel_grouping_c {
    hidden: yes
    type: string
    sql: ${TABLE}.lead_channel_grouping_c ;;
  }

  dimension: first_name {
    hidden: yes
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: lead_channel_drilldown_info_2_c {
    hidden: yes
    type: string
    sql: ${TABLE}.lead_channel_drilldown_info_2_c ;;
  }

  dimension: lead_segment_c {
    hidden: yes
    type: string
    sql: ${TABLE}.lead_segment_c ;;
  }

  dimension_group: converted_date {
    type: time
    sql: ${TABLE}.converted_date ;;
  }

  dimension: last_name {
    hidden: yes
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: tracking_user_id_c {
    hidden: yes
    type: string
    sql: ${TABLE}.tracking_user_id_c ;;
  }

  dimension: ipstate_region_c {
    hidden: yes
    type: string
    sql: ${TABLE}.ipstate_region_c ;;
  }

  dimension: is_unread_by_owner {
    hidden: yes
    type: string
    sql: ${TABLE}.is_unread_by_owner ;;
  }

  dimension: last_modified_by_id {
    hidden: yes
    type: string
    sql: ${TABLE}.last_modified_by_id ;;
  }

  dimension: converted_contact_id {
    hidden: yes
    type: string
    sql: ${TABLE}.converted_contact_id ;;
  }

  dimension: ip_c {
    hidden: yes
    type: string
    sql: ${TABLE}.ip_c ;;
  }

  dimension: phone {
    hidden: yes
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: converted_opportunity_id {
    hidden: yes
    type: string
    sql: ${TABLE}.converted_opportunity_id ;;
  }

  dimension_group: created_date {
    hidden: yes
    type: time
    sql: ${TABLE}.created_date ;;
  }

  dimension: email {
    hidden: yes
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension_group: last_referenced_date {
    hidden: yes
    type: time
    sql: ${TABLE}.last_referenced_date ;;
  }

  dimension: affiliate_publisher_id_c {
    hidden: yes
    type: string
    sql: ${TABLE}.affiliate_publisher_id_c ;;
  }

  dimension: converted_account_id {
    hidden: yes
    type: string
    sql: ${TABLE}.converted_account_id ;;
  }

  dimension: is_deleted {
    hidden: yes
    type: string
    sql: ${TABLE}.is_deleted ;;
  }

  dimension_group: last_modified_date {
    type: time
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension: product_acquisition_channel_c {
    type: string
    sql: ${TABLE}.product_acquisition_channel_c ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: is_converted {
    type: string
    sql: ${TABLE}.is_converted ;;
  }

  dimension: last_page_seen_url_c {
    type: string
    sql: ${TABLE}.last_page_seen_url_c ;;
  }

  dimension: photo_url {
    type: string
    sql: ${TABLE}.photo_url ;;
  }

  dimension: calendly_created_c {
    type: string
    sql: ${TABLE}.calendly_created_c ;;
  }

  dimension: landingpage_url_c {
    type: string
    sql: ${TABLE}.landingpage_url_c ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.owner_id ;;
  }

  dimension: salutation {
    type: string
    sql: ${TABLE}.salutation ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}.website ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}.industry ;;
  }

  dimension_group: last_viewed_date {
    type: time
    sql: ${TABLE}.last_viewed_date ;;
  }

  dimension: iace_branche_c {
    type: number
    sql: ${TABLE}.iace_branche_c ;;
  }

  dimension: master_record_id {
    type: string
    sql: ${TABLE}.master_record_id ;;
  }

  dimension: email_domain_c {
    type: string
    sql: ${TABLE}.email_domain_c ;;
  }

  dimension: mobile_phone {
    type: string
    sql: ${TABLE}.mobile_phone ;;
  }

  dimension: mql_c {
    type: string
    sql: ${TABLE}.mql_c ;;
  }

  dimension: company_size_score_c {
    type: number
    sql: ${TABLE}.company_size_score_c ;;
  }

  dimension: sql_c {
    type: string
    sql: ${TABLE}.sql_c ;;
  }

  dimension: total_leadscore_c {
    type: number
    sql: ${TABLE}.total_leadscore_c ;;
  }

  dimension: decisionmaker_score_c {
    type: number
    sql: ${TABLE}.decisionmaker_score_c ;;
  }

  dimension: invoice_volume_score_c {
    type: number
    sql: ${TABLE}.invoice_volume_score_c ;;
  }

  dimension: urgency_score_c {
    type: number
    sql: ${TABLE}.urgency_score_c ;;
  }

  dimension: decisionmaker_c {
    type: string
    sql: ${TABLE}.decisionmaker_c ;;
  }

  dimension: monthly_invoice_volume_c {
    type: number
    sql: ${TABLE}.monthly_invoice_volume_c ;;
  }

  dimension_group: expected_close_date_c {
    type: time
    sql: ${TABLE}.expected_close_date_c ;;
  }

  dimension: accounting_tool_in_use_c {
    type: string
    sql: ${TABLE}.accounting_tool_in_use_c ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: lead_method_c {
    type: string
    sql: ${TABLE}.lead_method_c ;;
  }

  dimension: lead_source_referrer_c {
    type: string
    sql: ${TABLE}.lead_source_referrer_c ;;
  }

  dimension: lead_campaign_c {
    type: string
    sql: ${TABLE}.lead_campaign_c ;;
  }

  dimension: email_bounced_reason {
    type: string
    sql: ${TABLE}.email_bounced_reason ;;
  }

  dimension_group: email_bounced_date {
    type: time
    sql: ${TABLE}.email_bounced_date ;;
  }

  dimension: lead_engagement_c {
    type: string
    sql: ${TABLE}.lead_engagement_c ;;
  }

  dimension: position_c {
    type: string
    sql: ${TABLE}.position_c ;;
  }

  dimension: main_lead_c {
    type: string
    sql: ${TABLE}.main_lead_c ;;
  }

  dimension: lead_company_c {
    type: string
    sql: ${TABLE}.lead_company_c ;;
  }

  dimension: response_c {
    type: string
    sql: ${TABLE}.response_c ;;
  }

  dimension: lead_owner_name_c {
    type: string
    sql: ${TABLE}.lead_owner_name_c ;;
  }

  dimension: convert_lead_company_leads_c {
    type: string
    sql: ${TABLE}.convert_lead_company_leads_c ;;
  }

  dimension: dont_unqualify_lead_c {
    type: string
    sql: ${TABLE}.dont_unqualify_lead_c ;;
  }

  dimension: count_leadactivities_c {
    type: number
    sql: ${TABLE}.count_leadactivities_c ;;
  }

  dimension: contact_hierarchy_c {
    type: string
    sql: ${TABLE}.contact_hierarchy_c ;;
  }

  dimension: priority_lead_c {
    type: string
    sql: ${TABLE}.priority_lead_c ;;
  }

  dimension: lead_position_score_c {
    type: number
    sql: ${TABLE}.lead_position_score_c ;;
  }

  dimension: lead_interest_score_c {
    type: number
    sql: ${TABLE}.lead_interest_score_c ;;
  }

  dimension: lead_creation_score_c {
    type: number
    sql: ${TABLE}.lead_creation_score_c ;;
  }

  dimension_group: first_contact_date_c {
    type: time
    sql: ${TABLE}.first_contact_date_c ;;
  }

  dimension: prequalified_c {
    type: string
    sql: ${TABLE}.prequalified_c ;;
  }

  dimension: country_c {
    type: string
    sql: ${TABLE}.country_c ;;
  }

  dimension_group: prequalified_date_c {
    type: time
    sql: ${TABLE}.prequalified_date_c ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: probability_score_c {
    type: number
    sql: ${TABLE}.probability_score_c ;;
  }

  dimension: unqualified_reason_c {
    type: string
    sql: ${TABLE}.unqualified_reason_c ;;
  }

  dimension: total_mql_score_c {
    type: number
    sql: ${TABLE}.total_mql_score_c ;;
  }

  dimension: industry_score_c {
    type: number
    sql: ${TABLE}.industry_score_c ;;
  }

  dimension: probability_category_c {
    type: string
    sql: ${TABLE}.probability_category_c ;;
  }

  dimension: visited_content {
    hidden: yes
    type: string
    sql: ${TABLE}.visited_content ;;
  }

  measure: content_visited {
    type: count_distinct
    sql: ${visited_content} ;;
  }
  measure: total_leads{
    type: count_distinct
    sql: ${id} ;;
  }

  set: detail {
    fields: [
      id,
      received_at_time,
      uuid,
      calendly_event_type_name_c,
      uuid_ts_time,
      lead_channel_c,
      name,
      contacted_via_social_network_c,
      ipcountry_c,
      legacy_hubspot_contact_id_c,
      postal_code,
      lead_source,
      afilliate_c,
      lead_channel_drilldown_info_1_c,
      last_referring_site_url_c,
      street,
      title,
      city,
      description,
      lead_count_c,
      number_of_employees,
      system_modstamp_time,
      calendly_email_match_for_opp_c,
      created_by_id,
      ipcity_c,
      last_activity_date_time,
      lead_channel_grouping_c,
      first_name,
      lead_channel_drilldown_info_2_c,
      lead_segment_c,
      converted_date_time,
      last_name,
      tracking_user_id_c,
      ipstate_region_c,
      is_unread_by_owner,
      last_modified_by_id,
      converted_contact_id,
      ip_c,
      phone,
      converted_opportunity_id,
      created_date_time,
      email,
      last_referenced_date_time,
      affiliate_publisher_id_c,
      converted_account_id,
      is_deleted,
      last_modified_date_time,
      product_acquisition_channel_c,
      company,
      is_converted,
      last_page_seen_url_c,
      photo_url,
      calendly_created_c,
      landingpage_url_c,
      owner_id,
      salutation,
      status,
      website,
      industry,
      last_viewed_date_time,
      iace_branche_c,
      master_record_id,
      email_domain_c,
      mobile_phone,
      mql_c,
      company_size_score_c,
      sql_c,
      total_leadscore_c,
      decisionmaker_score_c,
      invoice_volume_score_c,
      urgency_score_c,
      decisionmaker_c,
      monthly_invoice_volume_c,
      expected_close_date_c_time,
      accounting_tool_in_use_c,
      country,
      lead_method_c,
      lead_source_referrer_c,
      lead_campaign_c,
      email_bounced_reason,
      email_bounced_date_time,
      lead_engagement_c,
      position_c,
      main_lead_c,
      lead_company_c,
      response_c,
      lead_owner_name_c,
      convert_lead_company_leads_c,
      dont_unqualify_lead_c,
      count_leadactivities_c,
      contact_hierarchy_c,
      priority_lead_c,
      lead_position_score_c,
      lead_interest_score_c,
      lead_creation_score_c,
      first_contact_date_c_time,
      prequalified_c,
      country_c,
      prequalified_date_c_time,
      state,
      probability_score_c,
      unqualified_reason_c,
      total_mql_score_c,
      industry_score_c,
      probability_category_c,
      visited_content
    ]
  }
}
