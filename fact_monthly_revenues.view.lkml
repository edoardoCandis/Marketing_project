view: fact_monthly_revenues {
  derived_table: {
    sql: SELECT
      to_char(date, 'yyyy-mm') as month,
      total_customer_mrr,
      total_trial_mrr,
      total_moneyback_mrr,
      total_customer_mrr+total_trial_mrr+total_moneyback_mrr as total_mrr

      FROM (SELECT*, rank() OVER (partition by to_char(date, 'yyyy-mm') ORDER BY date desc) FROM management_kpis.fact_revenues)

      WHERE rank=1
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: month {
    type: string
    sql: ${TABLE}.month ;;
  }

  dimension: total_customer_mrr {
    type: number
    sql: ${TABLE}.total_customer_mrr ;;
  }

  dimension: total_trial_mrr {
    type: number
    sql: ${TABLE}.total_trial_mrr ;;
  }

  dimension: total_moneyback_mrr {
    type: number
    sql: ${TABLE}.total_moneyback_mrr ;;
  }

  dimension: total_mrr {
    type: number
    sql: ${TABLE}.total_mrr ;;
  }

  set: detail {
    fields: [month, total_customer_mrr, total_trial_mrr, total_moneyback_mrr, total_mrr]
  }
}
