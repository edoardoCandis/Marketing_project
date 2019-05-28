view: churn_reasons {
  sql_table_name: success.churn_reasons ;;

  dimension: subscription_id {
    hidden: yes
    type: string
    sql: ${TABLE}.subscription_id ;;
  }

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.primary_key;;
  }

  dimension: case_id {
    # case ID
    type: string
    hidden: yes
    sql: ${TABLE}.case_id ;;
  }

  dimension: month {
    hidden: yes
    type: string
    sql: ${TABLE}.month ;;
  }

  dimension: reasons_count {
    hidden: yes
    type: number
    sql: ${TABLE}.reasons_count ;;
  }

  dimension: active_days {
    hidden: yes
    type: number
    sql: ${TABLE}.active_days ;;
  }

  dimension: chargebeeapps_company_c {
    hidden: yes
    type: string
    sql: ${TABLE}.chargebeeapps_company_c ;;
  }

  dimension_group: chargebeeapps_subscription_created_at_c {
    hidden: yes
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
    sql: ${TABLE}.chargebeeapps_subscription_created_at_c ;;
  }

  dimension: gross_mrr {
    hidden: yes
    # should come from Subscription
    type: number
    sql: ${TABLE}.gross_mrr ;;
  }

  dimension: subscription_stage_c {
    hidden:yes
    # should come from Subscription
    type: string
    sql: ${TABLE}.subscription_stage_c ;;
  }

  dimension: churn_reason_split {
    label: "Churn Reason"
    type: string
    sql: ${TABLE}.churn_reason_split ;;
  }

# -------------- measures here ---------------

  measure: count {
    type: count
    drill_fields: [subscription_id,case_id]
  }

  measure: attributed_gross_dollar_churn {
    label: "Gross Dollar Churn (Gross MRR)"
    type: number
    sql: ${TABLE}.attributed_gross_dollar_churn ;;
  }

  measure: attributed_logo_churn {
    label: "Logo Churn (Customers)"
    type: sum
    value_format_name: eur
    sql: ${TABLE}.attributed_logo_churn ;;
  }

  measure: attributed_net_dollar_churn {
    label: "Net Dollar Churn (Net MRR)"
    type: sum
    value_format_name: eur
    sql: ${TABLE}.attributed_net_dollar_churn ;;
  }
}
