view: meetings {
  sql_table_name: salesforce.meetings ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
    link: {
      label: "View in Salesforce"
      url: "https://eu16.lightning.force.com/lightning/r/Event/{{value}}/view"
    }
  }

  dimension: account_id {
    hidden: yes
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension_group: end_date {
    hidden:  yes
    # not really important
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
    sql: ${TABLE}.end_date_time ;;
  }

  dimension_group: activity {
    hidden: yes
    label: "Demo"
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
    sql: ${TABLE}.activity_date ;;
  }

  dimension_group: activity_date {
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
    sql: ${TABLE}.activity_date_time ;;
  }

  dimension: what_id {
    hidden: yes
    # only important for joining
    type: string
    sql: ${TABLE}.what_id ;;
  }

  dimension: who_id {
    hidden: yes
    # only important for joining
    type: string
    sql: ${TABLE}.who_id ;;
  }

  dimension: task_outcome_c {
    hidden: yes
    type: string
    sql: ${TABLE}.task_outcome_c ;;
  }

  dimension: event_subtype {
    # not used currently, therefore hidden
    hidden: yes
    type: string
    sql: ${TABLE}.event_subtype ;;
  }

  dimension: group_event_type {
    hidden: yes
    #not used currently
    type: string
    sql: ${TABLE}.group_event_type ;;
  }

  dimension: invitee_phone_number_c {
    type: string
    hidden: yes
    #not important
    sql: ${TABLE}.invitee_phone_number_c ;;
  }

  dimension: invitee_uuid_c {
    hidden: yes
    #not important to show, only for merging reasons
    type: string
    sql: ${TABLE}.invitee_uuid_c ;;
  }

  dimension: meeting_status_c {
    hidden: yes
    type: string
    sql: lower(${TABLE}.meeting_status_c) ;;
  }

  dimension: is_deleted {
    hidden: yes
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }
  dimension: owner_id {
    hidden: yes
    # only important for joining
    type: string
    sql: ${TABLE}.owner_id ;;
  }

# ------------------------ dimensions in use ------------------
  dimension: activity_datediff_c {
    label: "Days between Booking and Demo Date"
    type: number
    sql: ${TABLE}.activity_datediff_c ;;
  }

  dimension: activity_datediff_c_bucketed {
    label: "Datediff booked to demo bucketed"
    description: "Groups Datediff between date of booking and date of demo"
    type: tier
    tiers: [3,7,14]
    style: integer
    sql: ${TABLE}.activity_datediff_c ;;
  }

  dimension_group: created {
    label: "Created"
    description: "Date the demo was booked"
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
    sql: ${TABLE}.created_date ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

dimension: meeting_outcome {
  label: "Status"
  type: string
  sql: CASE WHEN ${subject} LIKE '%cancelled%' THEN 'Cancelled by Prospect'
            WHEN ${meeting_status_c}='attended' THEN 'Attended'
            WHEN ${meeting_status_c}='cancelled by operator' THEN 'Cancelled by Operator'
            ELSE 'Not Attended' END;;
}

  dimension: duration_in_minutes {
    type: number
    sql: ${TABLE}.duration_in_minutes ;;
  }

  dimension_group: start_date {
    label: "Demo"
    type: time
    timeframes: [
      raw,
      time,
      hour,
      hour_of_day,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.start_date_time ;;
  }

  dimension: subject {
    type: string
    sql: lower(${TABLE}.subject) ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }


# ----------- insert measures here ---------------

  measure: count {
    label: "Total Demos"
    type: count
    drill_fields: [id,meeting_status_c,what_id]
  }
}
