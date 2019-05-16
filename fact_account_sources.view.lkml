view: fact_account_sources {
  sql_table_name: marketing.fact_account_sources ;;

  dimension: account_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.account_id;;

  }

  dimension: act_source {
    type: string
    sql: ${TABLE}.act_source ;;
  }

  dimension: active_interest {
    type: yesno
    sql: ${TABLE}.active_interest ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }

  dimension: can_redistr {
    type: number
    sql: ${TABLE}.can_redistr ;;
  }

  dimension: context_campaign_content {
    type: string
    sql: ${TABLE}.context_campaign_content ;;
  }

  dimension: is_actionable {
    type: yesno
    sql: ${TABLE}.is_actionable ;;
  }

  dimension: lead_method {
    type: string
    sql: ${TABLE}.lead_method ;;
  }

  dimension: lead_source {
    type: string
    sql: ${TABLE}.lead_source ;;
  }

  dimension: online_medium {
    type: string
    sql: ${TABLE}.online_medium ;;
  }

  dimension: online_referrer {
    type: string
    sql: ${TABLE}.online_referrer ;;
  }

  dimension: online_source {
    type: string
    sql: ${TABLE}.online_source ;;
  }

  dimension: paid {
    type: yesno
    sql: ${TABLE}.paid ;;
  }

  dimension: presales {
    type: number
    sql: ${TABLE}.presales ;;
  }

  dimension: secondary_referrer {
    type: string
    sql: ${TABLE}.secondary_referrer ;;
  }

  measure: count {
    type: count
    drill_fields: [campaign_name]
  }

  dimension: grouping_source {
    type: string
    sql: CASE
          WHEN lower(${TABLE}.act_source) LIKE '%other%' THEN 'other'
          WHEN lower(${TABLE}.act_source) LIKE '%facebook%' OR lower(${TABLE}.act_source) LIKE '%instagram%' THEN 'facebook'
          WHEN lower(${TABLE}.act_source) LIKE '%google%' OR lower(${TABLE}.act_source) LIKE '%adwords%' THEN 'google'
          WHEN lower(${TABLE}.act_source) LIKE '%bing%' OR lower(${TABLE}.act_source) LIKE '%linkedin%' OR lower(${TABLE}.act_source) LIKE '%xing%' THEN lower(${TABLE}.act_source)
          WHEN lower(${TABLE}.act_source) LIKE '%com x%' OR lower(${TABLE}.act_source) LIKE 'comx' THEN 'com X'
          WHEN lower(${TABLE}.act_source) LIKE 'bvmw list' THEN 'bvmw list'
          WHEN ${TABLE}.act_source IS NULL THEN NULL
          ELSE 'other' END;;
  }
}
