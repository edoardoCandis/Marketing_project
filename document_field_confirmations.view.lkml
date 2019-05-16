view: document_field_confirmations {
  derived_table: {
    sql: SELECT DISTINCT
      *

      from mongodb.document_field_confirmations
       ;;
  }

  dimension: document_id {
    hidden: yes
    type: string
    sql: ${TABLE}.document_id ;;
  }

  dimension: field {
    type: string
    sql: ${TABLE}.field ;;
  }

  dimension: value {
    hidden: yes
    type: string
    sql: ${TABLE}.value ;;
  }

  dimension: review_task_id {
    hidden: yes
    type: string
    sql: ${TABLE}.review_task_id ;;
  }

  dimension: prediction {
    type: string
    sql: CASE WHEN ${TABLE}.prediction<>'' THEN 'automatic confirmation' ELSE 'human confirmation' END ;;
  }

  dimension_group: confirmed_at {
    type: time
    timeframes: [
      raw,
      date,
      day_of_month,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.confirmed_at ;;
  }

  dimension: company_id {
    hidden: yes
    # company ID of our customer
    type: string
    sql: ${TABLE}.owner_id ;;
  }

  dimension: owner_name {
    type: string
    sql: ${TABLE}.owner_name ;;
  }

  dimension: contact_id {
    hidden: yes

    type: string
    sql: ${TABLE}.contact_id ;;
  }

  dimension: contact_name {
    type: string
    sql: ${TABLE}.contact_name ;;
  }

  dimension: reviewer_id {
    type: string
    sql: ${TABLE}.reviewer_id ;;
  }

  dimension: reviewer_name {
    type: string
    sql: ${TABLE}.reviewer_name ;;
  }

  dimension: reviewer_email {
    type: string
    sql: replace(replace(${TABLE}.reviewer_email,'[',''),']','') ;;
  }

  dimension: db_user_id {
    # user that corrected the value (our customer)
    hidden: yes
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: user_name {
    label: "Customer Name"
    type: string
    sql: ${TABLE}.user_name ;;
  }

  dimension: user_email {
    label: "Customer Email"
    type: string
    sql: replace(replace(${TABLE}.user_email,'[',''),']','') ;;
  }

  dimension: gini_payment_recipient {
    type: string
    sql: ${TABLE}.gini_payment_recipient ;;
  }

  dimension: source_classification {
    label: "Upload Source"
    type: string
    sql: ${TABLE}.source_classification ;;
  }

  dimension: s3 {
    hidden: yes
    type: string
    sql: ${TABLE}.s3 ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension: page_count {
    type: number
    sql: ${TABLE}.page_count ;;
  }


  measure: count {
    type: count
    drill_fields: [detail*]
  }


  set: detail {
    fields: [
      s3
    ]
  }
}
