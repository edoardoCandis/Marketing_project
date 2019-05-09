view: fact_monthly_revenues {
  sql_table_name: financials.fact_monthly_revenues ;;



dimension: primary_key {
  sql: ${TABLE}.date;;
  primary_key: yes
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
    hidden: no
    sql: ${TABLE}.total_customer_mrr ;;
  }

  dimension: total_customer_mrr_previous_period {
    type: number
    hidden: no
    sql: lag(${TABLE}.total_customer_mrr,1) over ( order by ${date_month} asc) ;;
  }

  dimension: total_moneyback_mrr {
    type: number
    hidden: yes
    sql: ${TABLE}.total_moneyback_mrr ;;
  }

  dimension: total_trial_mrr {
    type: number
    hidden: yes
    sql: ${TABLE}.total_trial_mrr ;;
  }



  measure: acm_smartbooks {
    type: max
    sql: ${TABLE}.acm_smartbooks ;;
  }

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

  measure: net_mrr_smartbooks {
    type: max
    sql: ${TABLE}.net_mrr_smartbooks ;;
  }

  measure: net_mrr_workflows {
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
    type: max
    sql: ${TABLE}.tcm_smartbooks ;;
  }

  measure: total_customer_mrr_sum {
    type: max
    sql: ${total_customer_mrr} ;;
  }

  measure: total_moneyback_mrr_sum {
    type: max
    sql: ${total_moneyback_mrr};;
  }

  measure: total_trial_mrr_sum {
    type: max
    sql: ${total_trial_mrr} ;;
  }

  measure: total_monthly_mrr {
    value_format_name: eur
    label: "Total MRR"
    type: max
    sql: ${total_customer_mrr}+${total_trial_mrr}+${total_moneyback_mrr} ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
