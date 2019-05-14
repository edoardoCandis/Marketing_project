view: churn_reasons {
  sql_table_name: success.churn_reasons ;;

  dimension: subscription_id {
    type: string
    sql: ${TABLE}.subscription_id ;;
  }

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${subscription_id}, ${churn_reason_split}) ;;
  }

  dimension: id {
    # case ID
    type: string
    hidden: yes
    sql: ${TABLE}.id ;;
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

  dimension: churn_reason_split {
    type: string
    sql: ${TABLE}.churn_reason_split ;;
  }

  dimension: gross_mrr {
    type: number
    sql: ${TABLE}.gross_mrr ;;
  }


  dimension: subscription_stage_c {
    hidden:yes
    # i think this we dont need since we can get it from the subscription
    type: string
    sql: ${TABLE}.subscription_stage_c ;;
  }

# -------------- measures here ---------------

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: attributed_gross_dollar_churn {
    type: number
    sql: ${TABLE}.attributed_gross_dollar_churn ;;
  }

  measure: attributed_logo_churn {
    type: sum
    value_format_name: eur
    sql: ${TABLE}.attributed_logo_churn ;;
  }

  measure: attributed_net_dollar_churn {
    type: sum
    value_format_name: eur
    sql: ${TABLE}.attributed_net_dollar_churn ;;
  }
}
