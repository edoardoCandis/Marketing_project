view: review_task_escalated {
  sql_table_name: candis_server.review_task_escalated ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: task_claim_duration {
    hidden: yes
    type: number
    sql: ${TABLE}.task_claim_duration ;;
  }

  dimension: task_id {
    hidden: yes
    type: string
    sql: ${TABLE}.task_id ;;
  }

  dimension: document_id {
    hidden: yes
    type: string
    sql: ${TABLE}.document_id ;;
  }

  dimension: escalated_by {
    hidden: yes
    type: string
    sql: ${TABLE}.escalated_by ;;
  }

  dimension: escalated_to_level {
    hidden: yes
    type: number
    sql: ${TABLE}.escalated_to_level ;;
  }

  dimension: user_id {
    hidden: yes
    type: string
    sql: ${TABLE}.user_id ;;
  }

  # ------------ dimensions in use ------------------

  dimension_group: escalated {
    label: "Task escalated"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.escalated_at ;;
  }

  dimension: task_level {
    type: number
    description: "Level the Task was escalated from"
    sql: ${TABLE}.escalated_to_level-1 ;;
  }

  dimension: task_viewing_duration {
    label: "Time to escalate"
    type: tier
    tiers: [20,40,60]
    sql: ${TABLE}.task_viewing_duration/1000 ;;
  }

  # ------------------- measures -------------------------
  measure: count {
    hidden: yes
    type: count
    drill_fields: [id]
  }

  measure: escalated_tasks {
    label: "Total Tasks escalated"
    type: count_distinct
    sql: ${id} ;;
  }

  measure: average_task_viewing_duration {
    type: average
    label: "Avg. Time to escalate"
    value_format: "0.00"
    sql: ${TABLE}.task_viewing_duration/1000 ;;
  }
}
