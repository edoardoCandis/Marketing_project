view: bwa_costs {
  sql_table_name: financials.bwa_costs ;;

  dimension: uniqueid {
    primary_key: yes
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

  dimension: month {
    label: "Month"
    type: string
    sql: ${TABLE}.month ;;
  }



#--------- measures here ---------------

  measure: count {
    type: count
    drill_fields: []
  }

  measure: amount {
    type: sum
    value_format: "0.00€"
    sql: ${TABLE}.amount;;
  }
}
