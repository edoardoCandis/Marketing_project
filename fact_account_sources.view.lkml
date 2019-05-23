view: fact_account_sources {
  sql_table_name: marketing.fact_account_sources ;;

  dimension: account_id {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension: act_source {
    label: "Source Detail"
    description: "Most actionable source after online & secondary attribution. Before NULL attribution."
    type: string
    sql: ${TABLE}.act_source ;;
  }

  dimension: active_interest {
    hidden: yes
    type: yesno
    sql: ${TABLE}.active_interest ;;
  }

  dimension: is_actionable {
    hidden: yes
    type: yesno
    sql: ${TABLE}.is_actionable ;;
  }

  dimension: lead_method {
    hidden: yes
    type: string
    sql: ${TABLE}.lead_method ;;
  }

  dimension: online_medium {
    hidden: yes
    type: string
    sql: ${TABLE}.online_medium ;;
  }
  dimension: online_source {
    hidden: yes
    type: string
    sql: ${TABLE}.online_source ;;
  }

  dimension: lead_source {
    hidden: yes
    type: string
    sql: ${TABLE}.lead_source ;;
  }

  dimension: presales {
    hidden: yes
    type: number
    sql: ${TABLE}.presales ;;
  }

  dimension: can_redistr {
    hidden: yes
    type: number
    sql: ${TABLE}.can_redistr ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }

  dimension: context_campaign_content {
    type: string
    sql: ${TABLE}.context_campaign_content ;;
  }

  dimension: online_referrer {
    type: string
    sql: ${TABLE}.online_referrer ;;
  }

  dimension: paid {
    type: yesno
    sql: ${TABLE}.paid ;;
  }

  dimension: secondary_referrer {
    type: string
    sql: ${TABLE}.secondary_referrer ;;
  }

  dimension: grouping_source {
    type: string
    label: "grouping source"
    description: "Macro-Areas of sources"
    sql: ${TABLE}.grouping_source ;;
  }



# --------------------- measures ------------------
  measure: count {
    hidden: yes
    type: count
    drill_fields: [campaign_name]
  }

  set: basic_source_information {
    fields: [
      account_id,
      grouping_source,
      paid
    ]
  }
}
