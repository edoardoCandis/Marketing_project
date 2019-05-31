view: reprocess_document {
  sql_table_name: candis_server.reprocess_document ;;

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


  dimension: current_processing_cycle {
    type: number
    sql: ${TABLE}.current_processing_cycle ;;
  }

  dimension: document_id {
    hidden: yes
    type: string
    sql: ${TABLE}.document_id ;;
  }

  dimension: document_previously_fully_processed {
    type: yesno
    sql: ${TABLE}.document_previously_fully_processed ;;
  }

  dimension: reason {
    type: string
    sql: ${TABLE}.reason ;;
  }

  dimension_group: received {
    label: "Reprocessed"
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
    sql: ${TABLE}.received_at ;;
  }

  dimension: user_id {
    hidden: yes
    type: string
    sql: ${TABLE}.user_id ;;
  }

  measure: count_distinct {
    type: count_distinct
    sql: ${id} ;;
    label: "Total Documents Reprocessed"
    drill_fields: [id]
  }
}
