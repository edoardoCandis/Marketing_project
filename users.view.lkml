view: users {
  sql_table_name: salesforce.users ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
    hidden: yes
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
    hidden: yes
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
    label: "User Role"
    sql: CASE WHEN ${TABLE}.user_role_id='00E1t000000cVzBEAU' THEN 'Salesrep'
              WHEN ${TABLE}.user_role_id='00E1t000000lKrFEAU' THEN 'Presales'
              WHEN  ${TABLE}.user_role_id='00E1t000000ca3qEAA' THEN 'Successrep' ELSE 'Other'END ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}.username ;;
    hidden: yes
  }

  dimension: uuid {
    type: number
    value_format_name: id
    sql: ${TABLE}.uuid ;;
    hidden: yes
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  filter: sales_or_all {
    type: string
    sql: if(${user_role_id}="Salesrep","Salesrep","All") ;;
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
