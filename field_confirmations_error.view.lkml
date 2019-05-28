view: field_confirmations_error {
  derived_table: {
    sql: SELECT DISTINCT
        a.document_id,
        a.field,
        CONCAT(a.document_id, a.field) AS id,
        b.min_confirmed_at::date,
        replace(replace(a.reviewer_email,'[',''),']','') as reviewer,
        CASE WHEN a.prediction <> ' ' THEN id ELSE NULL END AS is_auto, --if prediction field not empty >> machine confirmed
        is_corrected,
        is_corrected_doc

        from  mongodb.document_field_confirmations a
        left join (select
                    document_id,
                    field,
                    min(confirmed_at) as min_confirmed_at,
                    CASE WHEN count(distinct value) > 1 THEN CONCAT(document_id, field) ELSE NULL END AS is_corrected,
                    CASE WHEN count(distinct value) > 1 THEN document_id ELSE NULL END AS is_corrected_doc
                    from mongodb.document_field_confirmations
                    group by 1,2) b on a.document_id = b.document_id and a.field = b.field
--        where a.confirmed_at = b.min_confirmed_at

 ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [detail*]
  }

  dimension: document_id {
    type: string
    sql: ${TABLE}.document_id ;;
  }

  dimension: field {
    type: string
    sql: ${TABLE}.field ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  measure: field_count {
    label: "Number of confirmed fields"
    description: "Select this field to count the overall number of confirmed fields"
    type: count_distinct
    sql:  ${id} ;;
  }

  measure: document_count {
    label: "Number of documents"
    description: "Select this field to count the overall number of documents"
    type: count_distinct
    sql:  ${document_id} ;;
  }

  dimension: confirmed_at {
    type: date
    sql: ${TABLE}.min_confirmed_at ;;
  }

  dimension: reviewer {
    type: string
    sql: ${TABLE}.reviewer;;
  }

  dimension: is_auto  {
    label: "Is automatically confirmed?"
    description: "Select yes to visualize only fields that have been initially confirmed by the machine"
    type: yesno
    sql: CASE WHEN ${TABLE}.is_auto IS NULL THEN FALSE ELSE TRUE END ;;
  }

  measure: auto_confirmed {
    label: "Number of automatically confirmed fields"
    description: "Select this field to count the number of automatically confirmed field"
    type: count_distinct
    sql: ${TABLE}.is_auto ;;
  }



  measure: is_corrected {
    label: "Number of corrected fields"
    description: "Corrected field = field that has been confirmed more than once, with different values"
    type: count_distinct
    sql: ${TABLE}.is_corrected ;;
  }

  measure: corrected_documents {
    label: "Number of corrected documents"
    description: "Corrected document = document where at least one field has been confirmed more than once, with different values"
    type: count_distinct
    sql: ${TABLE}.is_corrected_doc  ;;
  }

  dimension: primary_key {
    hidden: yes
    primary_key: yes
    type: string
    sql: concat(${id},${confirmed_at}) ;;
  }

  set: detail {
    fields: [
      document_id,
      field,
      id,
      confirmed_at,
      reviewer,
      is_auto,
      is_corrected
    ]
  }
}
