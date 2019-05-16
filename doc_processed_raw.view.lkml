view: doc_processed_raw {
  sql_table_name: candis_server.doc_processed ;;

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

  dimension: user_id {
    type: string
    hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: document_id {
    hidden: yes
    type: string
    sql: ${TABLE}.document_id ;;
  }

  dimension_group: document_updated {
    hidden: yes
    # not sure what this is used for
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
    sql: ${TABLE}.document_updated_at ;;
  }

  dimension: doctype {
    type: string
    sql: ${TABLE}.doctype ;;
  }

  dimension_group: document_created {
    label: "Document uploaded"
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
    sql: ${TABLE}.document_created_at ;;
  }

  dimension_group: document {
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
    sql: ${TABLE}.document_date ;;
  }

  dimension: is_outgoing {
    label: "Direction"
    type: string
    sql: CASE WHEN ${TABLE}.is_outgoing=true THEN 'outgoing' ELSE 'incoming' END ;;
  }

  dimension: page_count {
    label: "Pages"
    type: number
    sql: ${TABLE}.page_count ;;
  }

  dimension: processing_duration {
    type: number
    label: "Processing Time (h)"
    sql: ${TABLE}.processing_duration/3600 ;;
  }

  dimension_group: received {
    label: "Processed"
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

  dimension: source_type {
    label: "Upload Type"
    type: string
    sql: ${TABLE}.source_type ;;
  }


  measure: count {
    label: "Documents Processed"
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
    ]
  }
}
