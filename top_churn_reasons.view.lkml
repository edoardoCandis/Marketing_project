view: top_churn_reasons {
  derived_table: {
    sql: select
      churn_reason_split,
      subscription_stage_c,
      rank() over(partition by subscription_stage_c order by count(*) desc) rank
      from success.churn_reasons
      group by 1,2
       ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [detail*]
  }

  dimension: churn_reason_split {
    hidden: yes
    type: string
    sql: ${TABLE}.churn_reason_split ;;
  }

  dimension: subscription_stage_c {
    hidden: yes
    type: string
    sql: ${TABLE}.subscription_stage_c ;;
  }

  dimension: rank {
    label: "Filter: Most used Churn reasons"
    description: "Use this filter to select only the most used churn reasons"
    type: number
    sql: ${TABLE}.rank ;;
  }


  set: detail {
    fields: [churn_reason_split, subscription_stage_c, rank]
  }
}
