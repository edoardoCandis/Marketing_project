view: cb_credit_notes {
  label: "Credit Notes"
  sql_table_name: salesforce.cb_credit_notes ;;


#------------------- hidden dimensions -------------
  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: chargebeeapps_status_c {
    hidden: yes
    type: string
    sql: ${TABLE}.chargebeeapps_status_c ;;
  }

  dimension: chargebeeapps_type_c {
    hidden:  yes
    # only always is tax exclusive
    type: string
    sql: ${TABLE}.chargebeeapps_type_c ;;
  }
  dimension: chargebeeapps_allocated_amount_c {
    hidden:  yes
    label: "Amount written off"
    type: string
    sql: ${TABLE}.chargebeeapps_allocated_amount_c ;;
  }

  dimension: chargebeeapps_available_amount_c {
    hidden: yes
    # not sure why this is important ever
    type: string
    sql: ${TABLE}.chargebeeapps_available_amount_c ;;
  }

  dimension: chargebeeapps_contact_c {
    hidden:  yes #only used for merging
    type: string
    sql: ${TABLE}.chargebeeapps_contact_c ;;
  }

  dimension: chargebeeapps_invoice_c {
    hidden: yes #only important for merging to invoice
    type: string
    sql: ${TABLE}.chargebeeapps_invoice_c ;;
  }

  dimension: is_deleted {
    hidden:  yes
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

# --------- dimensions in use -----------

  dimension_group: chargebeeapps_issued_date_c {
    label: "Created Date"
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
    sql: ${TABLE}.chargebeeapps_issued_date_c ;;
  }


  dimension: name {
    label: "Credit Note Number"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: chargebeeapps_reason_code_c {
    label: "Credit Note Reason"
    type: string
    sql: ${TABLE}.chargebeeapps_reason_code_c ;;
  }

# ------------ measures start here ------------

  measure: count {
    type: count
    drill_fields: [id, name]
  }

  measure: chargebeeapps_sub_total_c {
    label: "Credit Note Total excl. VAT"
    type: sum
    sql: ${TABLE}.chargebeeapps_sub_total_c ;;
    drill_fields: [credit_note_details*]
  }

  measure: chargebeeapps_total_c {
    label: "Credit Note Total incl. VAT"
    type: sum
    sql: ${TABLE}.chargebeeapps_total_c ;;
    drill_fields: [credit_note_details*]
  }


  measure: chargebeeapps_refunded_amount_c {
    label: "Amount refunded"
    type: sum
    sql: ${TABLE}.chargebeeapps_refunded_amount_c ;;
    drill_fields: [credit_note_details*]
  }

  set: credit_note_details {
    fields: [
      id,
      chargebeeapps_issued_date_c_date,
      chargebeeapps_reason_code_c,
      chargebeeapps_invoice_c
    ]
  }
}
