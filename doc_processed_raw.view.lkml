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
    group_label: "Attributes"
    type: string
    sql: ${TABLE}.doctype ;;
  }

  dimension_group: document_created {
    label: "  Uploaded"
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
    label: "   Document"
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

  dimension_group: received {
    label: " Processed"
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

  dimension: is_outgoing {
    label: "Direction"
    group_label: "Attributes"
    type: string
    sql: CASE WHEN ${TABLE}.is_outgoing=true THEN 'outgoing' ELSE 'incoming' END ;;
  }

  dimension: page_count {
    group_label: "Attributes"
    label: "Pages"
    type: number
    sql: ${TABLE}.page_count ;;
  }

  dimension: processing_duration {
    type: tier
    tiers: [6,12,24,48]
    label: "Processing Time Segments"
    description: "processed after 6 hours, after 12 hours etc."
    sql: ${TABLE}.processing_duration/3600 ;;
  }

  dimension: source_type {
    label: "Upload Type"
    description: "Email vs. manual upload"
    type: string
    sql: ${TABLE}.source_type ;;
  }

# -------------- measures --------------------

  measure: count {
    label: "Total Documents Processed"
    type: count
    drill_fields: [detail*]
  }

  measure: sum_document_units {
    label: "Total Document Units Processed"
    type: sum
    sql: CASE WHEN ${page_count} IS NULL THEN 1 ELSE CEILING(CAST(${page_count} as decimal (6,2))/3) END ;;
  }

  measure: processing_time {
    type: average
    label: "Avg. Time to process (Hours)"
    sql: (${TABLE}.processing_duration/3600) ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
    ]
  }
}
