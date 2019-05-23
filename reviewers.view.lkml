view: reviewers {
  derived_table: {
    sql: SELECT DISTINCT
      a.created_at,
      a.db_id,
      a.display_name,
      a.email,
      a.tracking_user_id,
      CASE WHEN b.email IS NULL then false ELSE true END as active_reviewer,
      b.weekly_hours

      FROM candis_server.users a
      LEFT JOIN public.active_reviewers b ON a.email=b.email

      WHERE a.email LIKE '%candis%'
       ;;
  }

  dimension_group: created_at {
    hidden: yes
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension: db_id {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.db_id ;;
  }

  dimension: tracking_user_id {
    hidden: yes
    type: string
    sql: ${TABLE}.tracking_user_id ;;
  }

  dimension: email {
    hidden: yes
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: display_name {
    label: "Assigned to"
    type: string
    sql: ${TABLE}.display_name ;;
  }

  dimension: active_reviewer {
    label: "Active"
    description: "Is the Reviewer still working @Candis ?"
    type: yesno
    sql: ${TABLE}.active_reviewer ;;
  }

  dimension: weekly_hours {
    hidden: yes
    type: number
    sql: ${TABLE}.weekly_hours ;;
  }

  measure: weekly_hours_capacity {
    hidden: yes
    type: sum
    sql: ${TABLE}.weekly_hours ;;
  }

  set: detail {
    fields: [
    display_name,
    tracking_user_id,
    email,
    weekly_hours
    ]
  }
}
