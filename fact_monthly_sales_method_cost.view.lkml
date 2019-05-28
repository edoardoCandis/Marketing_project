view: fact_monthly_sales_and_method_cost {
  sql_table_name: marketing.fact_monthly_sales_and_method_cost ;;

  dimension: lead_method {
    type: string
    sql: ${TABLE}.lead_method ;;
  }

  dimension: primary_key {
    type: string
    sql: ${month_month}||${lead_method} ;;
    primary_key: yes
    hidden: yes
  }

  dimension_group: month {
    label: "Cost"
    type: time
    timeframes: [
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql: to_date(${TABLE}.month,'yyyy-mm') ;;
  }

  dimension: cost_of_method {
    type: number
    value_format_name: eur
    sql: ${TABLE}.cost_of_method ;;
  }

  dimension: cost_of_sale {
    type: number
    value_format_name: eur
    sql: ${TABLE}.cost_of_sale ;;
  }

  measure: cost_of_method_avg {
    type: average
    value_format_name: eur
    sql: ${TABLE}.cost_of_method ;;
  }

  measure: cost_of_sale_avg {
    type: average
    value_format_name: eur
    sql: ${TABLE}.cost_of_sale ;;
  }


}
