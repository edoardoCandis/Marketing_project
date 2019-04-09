view: users {
  sql_table_name: salesforce.users ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }



  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }



  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: user_role_id {
    type: string
    sql: CASE WHEN ${TABLE}.user_role_id='00E1t000000cVzBEAU' THEN 'Salesrep'
              WHEN  ${TABLE}.user_role_id='00E1t000000ca3qEAA' THEN 'Successrep' ELSE 'Other'END ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}.username ;;
  }

  dimension: uuid {
    type: number
    value_format_name: id
    sql: ${TABLE}.uuid ;;
  }

  dimension_group: uuid_ts {
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
    sql: ${TABLE}.uuid_ts ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      first_name,
      name,
      username
    ]
  }
}
