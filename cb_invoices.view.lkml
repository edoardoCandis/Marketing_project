view: cb_invoices {
  sql_table_name: salesforce.cb_invoices ;;

# ----------- hidden dimensions ---------------

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: additional_charge_mrr_c {
    hidden: yes
    type: string
    sql: ${TABLE}.additional_charge_mrr_c ;;
  }

  dimension: chargebeeapps_cb_id_c {
    hidden:  yes
    type: string
    sql: ${TABLE}.chargebeeapps_cb_id_c ;;
  }

  dimension: chargebeeapps_customer_id_c {
    hidden: yes
    type: string
    sql: ${TABLE}.chargebeeapps_customer_id_c ;;
  }

  dimension: chargebeeapps_subscription_id_c {
    hidden: yes
    type: string
    sql: ${TABLE}.chargebeeapps_subscription_id_c ;;
  }

  dimension: chargebeeapps_vatnumber_c {
    hidden: yes
    type: string
    sql: ${TABLE}.chargebeeapps_vatnumber_c ;;
  }

  dimension: is_deleted {
    hidden: yes
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: chargebeeapps_invoice_id_c {
    hidden:  yes
    type: string
    sql: ${TABLE}.chargebeeapps_invoice_id_c ;;
  }

  dimension: invoice_net_mrr_c {
    hidden:  yes
    type: string
    sql: ${TABLE}.invoice_net_mrr_c ;;
  }

  # ----------- dimensions -----------------------


  dimension_group: chargebeeapps_due_date_c {
    group_label: "Invoice Dates"
    label: "Due Date"
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
    sql: ${TABLE}.chargebeeapps_due_date_c ;;
  }

  dimension_group: chargebeeapps_invoice_date_c {
    type: time
    group_label: "Invoice Dates"
    label: "Created Date"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.chargebeeapps_invoice_date_c ;;
  }

  dimension_group: chargebeeapps_paid_on_c {
    group_label: "Invoice Dates"
    label: "Paid Date"
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
    sql: ${TABLE}.chargebeeapps_paid_on_c ;;
  }

  dimension: chargebeeapps_recurring_c {
    label: " is recurring ?"
    type: yesno
    sql: ${TABLE}.chargebeeapps_recurring_c ;;
  }

  dimension: chargebeeapps_status_c {
    label: "Invoice Status"
    type: string
    sql: ${TABLE}.chargebeeapps_status_c ;;
  }


  dimension: days_until_payment_c {
    type: number
    sql: ${TABLE}.days_until_payment_c ;;
  }


  dimension: name {
    label: "Invoice Number"
    type: string
    sql: ${TABLE}.name ;;
  }

# --------------- measures -------------

  measure: count {
    type: count
    drill_fields: [id, name]
  }

  measure: chargebeeapps_tax_c {
    label: "VAT"
    type: sum
    sql: ${TABLE}.chargebeeapps_tax_c ;;
  }

  measure: chargebeeapps_amount_c {
    label: "Invoice Amount incl. VAT"
    type: sum
    sql: ${TABLE}.chargebeeapps_amount_c ;;
  }

  measure: chargebeeapps_sub_total_c {
    label: "Invoice Amount excl. VAT"
    type: sum
    sql: ${TABLE}.chargebeeapps_sub_total_c ;;
  }

  measure: total_invoice_discount_applied_c {
    hidden: yes # -> should be taken from Credit Notes
    type: sum
    label: "Total Discount"
    sql: ${TABLE}.total_invoice_discount_applied_c ;;
  }

  measure: chargebeeapps_due_amount_c {
    label: "Open Liabilities"
    type: sum
    sql: ${TABLE}.chargebeeapps_due_amount_c ;;
  }
}
