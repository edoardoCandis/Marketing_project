view: temp_facebook_comp_acq_campaign_spendings {
  sql_table_name: marketing.temp_facebook_comp_acq_campaign_spendings ;;

  dimension: ad_name {
    type: string
    sql: ${TABLE}.ad_name ;;
  }

  dimension: adset_id {
    type: string
    sql: ${TABLE}.adset_id ;;
  }

  dimension: adset_name {
    type: string
    sql: ${TABLE}.adset_name ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }

  dimension: campaign_status {
    type: string
    sql: ${TABLE}.campaign_status ;;
  }

  dimension: month {
    type: date_month
    sql: ${TABLE}.month ;;
  }

  measure: spendings {
    type: sum
    sql: ${TABLE}.spendings ;;
  }

  dimension: url_parameters {
    type: string
    sql: ${TABLE}.url_parameters ;;
  }

  dimension: utm_campaign {
    type: string
    sql: ${TABLE}.utm_campaign ;;
  }

  dimension: utm_medium {
    type: string
    sql: ${TABLE}.utm_medium ;;
  }

  dimension: utm_source {
    type: string
    sql: ${TABLE}.utm_source ;;
  }

  dimension: utm_term {
    type: string
    sql: ${TABLE}.utm_term ;;
  }

  measure: count {
    type: count
    drill_fields: [ad_name, adset_name, campaign_name]
  }
}
