view: fact_monthly_revenues {
  sql_table_name: financials.fact_monthly_revenues ;;

dimension: primary_key {
  sql: ${TABLE}.date;;
  primary_key: yes
  hidden: yes
  type: string
}

  dimension_group: date {
    type: time
    timeframes: [
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql: to_date(${TABLE}.date,'yyyy-mm') ;;
  }

  dimension: total_customer_mrr {
    type: number
    hidden: yes
    sql: ${TABLE}.total_customer_mrr ;;
  }

  dimension: total_customer_mrr_previous_period {
    hidden: yes
    type: number
    sql: ${TABLE}.total_customer_mrr_previous_period ;;
  }

  dimension: total_moneyback_mrr {
    type: number
    hidden: yes
    sql: ${TABLE}.total_moneyback_mrr ;;
  }

  dimension: total_moneyback_mrr_previous_period {
    hidden: yes
    type: number
    sql: ${TABLE}.total_moneyback_mrr_previous_period ;;
  }

  dimension: total_trial_mrr {
    type: number
    hidden: yes
    sql: ${TABLE}.total_trial_mrr ;;
  }

  dimension: total_trial_mrr_previous_period {
    hidden: yes
    type: number
    sql: ${TABLE}.total_trial_mrr_previous_period ;;
  }


# --------------- measures ----------------

  measure: contracted_multiplier_accounts {
    type: max
    sql: ${TABLE}.contracted_multiplier_accounts ;;
  }

  measure: count_smartbooks_subscriptions {
    type: max
    sql: ${TABLE}.count_smartbooks_subscriptions ;;
  }

  measure: count_workflows_subscriptions {
    type: max
    sql: ${TABLE}.count_workflows_subscriptions ;;
  }

  measure: acm_smartbooks {
    value_format_name: eur
    type: max
    sql: ${TABLE}.acm_smartbooks ;;
  }

  measure: net_mrr_smartbooks {
    value_format_name: eur
    type: max
    sql: ${TABLE}.net_mrr_smartbooks ;;
  }

  measure: net_mrr_workflows {
    value_format_name: eur
    type: max
    sql: ${TABLE}.net_mrr_workflows ;;
  }

  measure: non_contracted_multiplier_accounts {
    type: max
    sql: ${TABLE}.non_contracted_multiplier_accounts ;;
  }

  measure: referral_subscriptions {
    type: max
    sql: ${TABLE}.referral_subscriptions ;;
  }

  measure: tcm_smartbooks {
    value_format_name: eur
    type: max
    sql: ${TABLE}.tcm_smartbooks ;;
  }

  measure: total_customer_mrr_sum {
    type: max
    value_format_name: eur
    sql: ${total_customer_mrr} ;;
  }

  measure: total_moneyback_mrr_sum {
    type: max
    value_format_name: eur
    sql: ${total_moneyback_mrr};;
  }

  measure: total_trial_mrr_sum {
    type: max
    value_format_name: eur
    sql: ${total_trial_mrr} ;;
  }

  measure: total_monthly_mrr {
    value_format_name: eur
    label: "Total MRR"
    type: max
    sql: ${total_customer_mrr}+${total_trial_mrr}+${total_moneyback_mrr} ;;
  }

}
