view: fact_account_sources {
  sql_table_name: marketing.fact_account_sources ;;

  dimension: account_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.account_id ;;
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
    hidden: yes
    type: number
    sql: ${TABLE}.can_redistr ;;
  }

  dimension: context_campaign_content {
    type: string
    sql: ${TABLE}.context_campaign_content ;;
  }

  dimension: grouping_source {
    description: "Grouping sources into macro categories"
    type: string
    sql: ${TABLE}.grouping_source ;;
  }

  dimension: is_actionable {
    hidden: yes
    type: yesno
    sql: ${TABLE}.is_actionable ;;
  }

  dimension: lead_method {
    label: "Lead Method"
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
    label: "Paid source?"
    description: "Yes if the actionable source is a paid source, no if it's organic"
    type: yesno
    sql: ${TABLE}.paid ;;
  }

  dimension: presales {
    hidden: yes
    type: number
    sql: ${TABLE}.presales ;;
  }

  dimension: secondary_referrer {
    hidden: yes
    type: string
    sql: ${TABLE}.secondary_referrer ;;
  }

  measure: count {
    type: count
    drill_fields: [campaign_name, accounts.name, accounts.id]
  }
}
