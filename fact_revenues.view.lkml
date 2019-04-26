view: fact_revenues {
  sql_table_name: management_kpis.fact_revenues ;;

  dimension: acm_smartbooks {
    type: number
    sql: ${TABLE}.acm_smartbooks ;;
  }

  dimension: contracted_multiplier_accounts {
    type: number
    sql: ${TABLE}.contracted_multiplier_accounts ;;
  }

  dimension: count_smartbooks_subscriptions {
    type: number
    sql: ${TABLE}.count_smartbooks_subscriptions ;;
  }

  dimension: count_workflows_subscriptions {
    type: number
    sql: ${TABLE}.count_workflows_subscriptions ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: net_mrr_smartbooks {
    type: number
    sql: ${TABLE}.net_mrr_smartbooks ;;
  }

  dimension: net_mrr_workflows {
    type: number
    sql: ${TABLE}.net_mrr_workflows ;;
  }

  dimension: non_contracted_multiplier_accounts {
    type: number
    sql: ${TABLE}.non_contracted_multiplier_accounts ;;
  }

  dimension: referral_subscriptions {
    type: number
    sql: ${TABLE}.referral_subscriptions ;;
  }

  dimension: tcm_smartbooks {
    type: number
    sql: ${TABLE}.tcm_smartbooks ;;
  }

  dimension: total_customer_mrr {
    type: number
    sql: ${TABLE}.total_customer_mrr ;;
  }

  dimension: total_moneyback_mrr {
    type: number
    sql: ${TABLE}.total_moneyback_mrr ;;
  }

  measure: total_trial_mrr {
    type: max
    sql: ${TABLE}.total_trial_mrr ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
