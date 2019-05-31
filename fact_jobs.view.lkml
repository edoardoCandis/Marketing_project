view: fact_jobs {
  label: "Jobs"
  sql_table_name: mongodb.fact_jobs ;;

  dimension: _id {
    hidden: yes
    type: string
    sql: ${TABLE}._id ;;
  }

  dimension: booking_period {
    type: string
    sql: ${TABLE}.booking_period ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension_group: createdat {
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
    sql: ${TABLE}.createdat ;;
  }

  dimension: currentstatus {
    label: "Current Status"
    type: string
    sql: ${TABLE}.currentstatus ;;
  }

  dimension_group: finished {
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
    sql: ${TABLE}.finished_at ;;
  }

  dimension_group: initiated {
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
    sql: ${TABLE}.initiated_at ;;

  }
  dimension: duration {
    type: number
    sql: ${finished_raw} - ${initiated_raw} ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension_group: pending {
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
    sql: ${TABLE}.pending_at ;;
  }

  dimension: progress {
    hidden:  yes
    type: number
    sql: ${TABLE}.progress ;;
  }

  dimension: task_format {
    label: "Format"
    type: string
    sql: ${TABLE}.task_format ;;
  }

  dimension: task_type {
    label: "Type"
    type: string
    sql: ${TABLE}.task_type ;;
  }

  dimension_group: updatedat {
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
    sql: ${TABLE}.updatedat ;;
  }


  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  measure: jobs_count {
    label: "Count of jobs"
    type: count_distinct
    sql: ${_id} ;;
  }

  measure: companies_count {
    label: "Count of companies"
    type: count_distinct
    sql: ${company} ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}
