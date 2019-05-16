view: review_task_resolved {
  sql_table_name: candis_server.review_task_resolved ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: company_id {
    hidden: yes
    type: string
    sql: ${TABLE}.company_id ;;
  }

  dimension: tracking_user_id {
    hidden: yes
    type: string
    sql: ${TABLE}.tracking_user_id ;;
  }

  dimension: review_task_type_raw {
    hidden: yes
    type: string
    sql: ${TABLE}.review_task_type ;;
  }

  dimension: tags {
    hidden: yes
    type: string
    sql: ${TABLE}.tags ;;
  }

  dimension: user_id {
    hidden: yes
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension_group: review_task_assigned {
    label: "Assigned at"
    hidden: yes
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
    sql: ${TABLE}.review_task_assigned_at ;;
  }

  dimension: review_task_id {
    hidden: yes
    type: string
    sql: ${TABLE}.review_task_id ;;
  }

  dimension_group: review_task_created {
    hidden: yes
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
    sql: ${TABLE}.review_task_created_at ;;
  }

  dimension: completion_time {
    hidden: yes
    type: number
    label: "Completion time (s)"
    sql: ${TABLE}.completion_time/1000 ;;
  }

  # ------------------ dimensions in use -------------------------



  dimension_group: original_timestamp {
    label: "Completed at"
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
    sql: ${TABLE}.original_timestamp ;;
  }

  dimension: review_task_escalation_level {
    label: "Escalation Level"
    type: number
    sql: ${TABLE}.review_task_escalation_level ;;
  }

  dimension: task_type {
    label: "Task Type"
    type: string
    sql: CASE WHEN ${tags} IS NULL THEN ${review_task_type_raw}
              WHEN ${tags} like '%general-data-extraction%' THEN 'general-data-extraction'
              WHEN ${tags} like '%sender-contact-data-extraction%' THEN 'sender-contact-data-extraction'
              WHEN ${tags} like '%recipient-contact-data-extraction%' THEN 'recipient-contact-data-extraction'
              WHEN ${tags} like '%payment-data-extraction%' THEN 'payment-data-extraction'
              WHEN ${tags} like '%all-document-data-extraction%' THEN 'all-document-data-extraction' END;;
  }

  # ------------------ dimensions in use -------------------------
  measure: count {
    label: "Tasks completed"
    type: count
    drill_fields: []
  }

  measure: avg_completion_time {
    type: average
    label: "Avg. Completion Time (s)"
    sql: ${completion_time};;
  }

}
