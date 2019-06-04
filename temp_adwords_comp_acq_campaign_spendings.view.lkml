view: temp_adwords_comp_acq_campaign_spendings {
  sql_table_name: marketing.temp_adwords_comp_acq_campaign_spendings ;;

  measure: budget_spent {
    type: sum
    sql: ${TABLE}.budget_spent ;;
  }

  dimension: month {
    type: date_month
    sql: ${TABLE}.month ;;
  }

  dimension: name {
    label: "campaign name"
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
