view: fact_documents_processed {
  sql_table_name: success.documents_processed ;;

  dimension: company_id {
    hidden: yes
    type: string
    sql: ${TABLE}.company_id ;;
  }

  dimension: primary_key {
    type: string
    primary_key: yes
    hidden: yes
    sql: ${company_id}||${date_month} ;;
  }

  dimension: company_name {
    hidden:yes
    type: string
    sql: ${TABLE}.company_name ;;
  }

  measure: documents_marked_as_unreadable {
    type: sum
    sql: ${TABLE}.documents_marked_as_unreadable ;;
  }

  measure: documents_processed {
    type: sum
    sql: ${TABLE}.documents_processed ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql: to_date(${TABLE}.month,'yyyy-mm') ;;
  }

  dimension: salesforce_account_id {
    hidden: yes
    type: string
    sql: ${TABLE}.salesforce_account_id ;;
  }

  measure: total_document_units_processed {
    type: sum
    sql: ${TABLE}.total_document_units_processed ;;
  }

  measure: total_documents_processed {
    type: sum
    sql: ${TABLE}.total_documents_processed ;;
  }

}
