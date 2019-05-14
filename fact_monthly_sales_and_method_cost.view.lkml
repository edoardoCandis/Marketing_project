view: fact_monthly_sales_and_method_cost {
  sql_table_name: marketing.fact_monthly_sales_and_method_cost ;;

  measure: cost_of_method {
    type: sum
    sql: ${TABLE}.cost_of_method ;;
  }

  measure: cost_of_sale {
    type: sum
    sql: ${TABLE}.cost_of_sale ;;
  }

  dimension: lead_method {
    type: string
    sql: ${TABLE}.lead_method ;;
  }

  dimension: month {
    type: string
    sql: ${TABLE}.month ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
