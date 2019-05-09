view: bwa_costs {
  view_label: "P&L Cost Data"
  sql_table_name: financials.bwa_costs ;;

  dimension: uniqueid {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.uniqueid ;;
  }

  dimension: cost_center {
    type: string
    sql: ${TABLE}.cost_center ;;
  }

  dimension: expense_account {
    type: string
    sql: ${TABLE}.expense_account ;;
  }

  dimension: expense_account_number {
    type: number
    sql: ${TABLE}.expense_account_number ;;
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


#--------- measures here ---------------

  measure: count {
    type: count
    drill_fields: []
  }

  measure: amount {
    label: "Total Costs"
    type: sum
    value_format_name: eur
    sql: ${TABLE}.amount;;
  }
  measure: direct_cost {
    label: "CoGS"
    description: "All Costs accounted to Cost Center CoGS (direct cost)"
    type: sum
    value_format_name: eur
    sql: ${TABLE}.amount;;
    filters: {
      field: cost_center
      value: "CoGS"
    }
  }
}
