view: meetings {
  sql_table_name: salesforce.meetings ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }


  dimension_group: activity {
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

  dimension: activity_datediff_c {
    label: "Days between Booking and Demo Date"
    type: number
    sql: ${TABLE}.activity_datediff_c ;;
  }



  dimension_group: created {
    label: "booking date"
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

dimension: is_cancelled{
  type: yesno
  sql: ${subject} LIKE '%cancelled%' OR ${meeting_status_c}='Not Attended';;
}

  dimension: duration_in_minutes {
    type: number
    sql: ${TABLE}.duration_in_minutes ;;
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


  dimension: is_deleted {
    hidden: yes
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }


  dimension: last_modified_by_id {
    type: string
    hidden: yes
    sql: ${TABLE}.last_modified_by_id ;;
  }

  dimension_group: last_modified {
    hidden:  yes
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
    sql: ${TABLE}.last_modified_date ;;
  }


  dimension: meeting_status_c {
    type: string
    sql: ${TABLE}.meeting_status_c ;;
  }

  dimension: owner_id {
    hidden: yes
    # only important for joining
    type: string
    sql: ${TABLE}.owner_id ;;
  }


  dimension_group: start_date {
    label: "Meeting Datetime"
    type: time
    timeframes: [
      raw,
      time,
      hour,
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

  dimension_group: system_modstamp {
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
    sql: ${TABLE}.system_modstamp ;;
  }

  dimension: task_outcome_c {
    type: string
    sql: ${TABLE}.task_outcome_c ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: uuid {
    type: number
    value_format_name: id
    sql: ${TABLE}.uuid ;;
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

# ----------- insert measures here ---------------

  measure: count {
    type: count
    drill_fields: [id]
  }
}
