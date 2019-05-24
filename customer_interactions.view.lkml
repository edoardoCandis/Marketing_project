view: customer_interactions {
  sql_table_name: success.customer_interactions ;;

  dimension: _tag {
    hidden: yes
    type: string
    sql: ${TABLE}._tag ;;
  }

  dimension: tag {
    type: string
    sql: CASE WHEN ${tags.name} IS NULL THEN ${_tag} ELSE ${tags.name} END  ;;
  }

  dimension_group: created {
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

  dimension: interaction_id {
    hidden: yes
    type: string
    sql: ${TABLE}.interaction_id ;;
  }

  dimension: salesforce_account {
    hidden: no
    type: string
    sql: ${TABLE}.salesforce_account ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
